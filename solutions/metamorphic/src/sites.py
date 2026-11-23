"""Site finder: every place where a rewrite rule of D6 applies, joined to the
step 3 abstract-state export by source line (D14).

A *site* is one rule applied at one node of one benchmark method. It is
*uncertain* when its source line holds an uncertain site of the interval
analysis (``uncertain_lines`` in the export).
"""

import argparse
import json
from collections import Counter
from dataclasses import dataclass
from pathlib import Path

import rules
import tree_sitter
from javaexpr import Rejected, Scope, declared_types, field_names, parse, text

# Nodes whose contents belong to another method (lambdas, local/anonymous classes).
OTHER_METHOD = {"lambda_expression", "class_body", "enum_body", "interface_body"}
STATEMENTS_END = "_statement"


@dataclass
class Found:
    sites: list[dict]
    rejected: Counter  # (rule, reason) -> count
    unmatched_methods: list[str]


def class_methods(root: tree_sitter.Node, simple_name: str) -> list[tree_sitter.Node]:
    """The method declarations directly in the top-level class ``simple_name``."""
    for cls in root.named_children:
        if (
            cls.type == "class_declaration"
            and text(cls.child_by_field_name("name")) == simple_name
        ):
            body = cls.child_by_field_name("body")
            return [m for m in body.named_children if m.type == "method_declaration"]
    return []


def match_method(
    decls: list[tree_sitter.Node], name: str, lines: set[int]
) -> tree_sitter.Node | None:
    """The declaration named ``name`` whose line span contains all ``lines``."""
    hits = [
        d
        for d in decls
        if text(d.child_by_field_name("name")) == name
        and all(d.start_point.row + 1 <= ln <= d.end_point.row + 1 for ln in lines)
    ]
    return hits[0] if len(hits) == 1 else None


def nodes_in(body: tree_sitter.Node):
    """All nodes of a method body, not entering lambdas or nested classes."""
    stack = [body]
    while stack:
        n = stack.pop()
        yield n
        stack.extend(c for c in reversed(n.children) if c.type not in OTHER_METHOD)


def statement_of(node: tree_sitter.Node) -> tree_sitter.Node:
    n = node
    while n.parent is not None and not (
        n.type.endswith(STATEMENTS_END) or n.type == "local_variable_declaration"
    ):
        n = n.parent
    return n


def join(node: tree_sitter.Node, method: dict) -> tuple[int, bool, bool]:
    """(line, joined, uncertain) of a site at ``node``.

    The node's own line is used if the export has a branch there; otherwise the
    first line of the enclosing statement (a condition split over lines is
    compiled to the statement's first line).
    """
    branch_lines = {s["line"] for s in method["sites"] if s["kind"] == "branch"}
    line = node.start_point.row + 1
    if line not in branch_lines:
        line = statement_of(node).start_point.row + 1
    joined = line in branch_lines
    return line, joined, joined and line in method["uncertain_lines"]


def method_sites(
    decl: tree_sitter.Node,
    methodid: str,
    method: dict,
    source: str,
    fields: set[str],
    rejected: Counter,
) -> list[dict]:
    if decl.has_error:
        # tree-sitter could not parse the method (it fails on some valid
        # literals, e.g. `0_10`); its nodes cannot be trusted.
        rejected[("all", "parse error in method")] += 1
        return []
    scope = Scope(declared_types(decl), fields)
    out = []
    for node in nodes_in(decl.child_by_field_name("body")):
        if node.type == "if_statement":
            candidates = rules.R1_RULES
        elif rules.is_comparison(node):
            candidates = rules.R2_RULES
        else:
            continue
        for rule in candidates:
            try:
                rw = rule(node, scope)
            except Rejected as e:
                rejected[(rule.__name__, str(e.args[0]).split(":")[0])] += 1
                continue
            key = (
                rw.node.child_by_field_name("condition")
                if rw.rule == "R1-invert"
                else rw.node
            )
            line, joined, uncertain = join(key, method)
            out.append(
                {
                    "id": f"{source}:{rw.node.start_point.row + 1}:{rw.node.start_point.column + 1}:{rw.rule}",
                    "method": methodid,
                    "source": source,
                    "rule": rw.rule,
                    "line": line,
                    "joined": joined,
                    "uncertain": uncertain,
                    "start_byte": rw.node.start_byte,
                    "end_byte": rw.node.end_byte,
                    "original": text(rw.node),
                    "rewritten": rw.rewritten,
                }
            )
    return out


def find_sites(export: dict, root: Path) -> Found:
    by_source: dict[str, list[str]] = {}
    for mid, m in export["methods"].items():
        if m["source"] is not None:
            by_source.setdefault(m["source"], []).append(mid)

    sites, rejected, unmatched = [], Counter(), []
    for source in sorted(by_source):
        tree = parse((root / source).read_bytes())
        fields = field_names(tree.root_node)
        for mid in sorted(by_source[source]):
            m = export["methods"][mid]
            cls, name = mid.split(":")[0].rsplit(".", 1)
            decls = class_methods(tree.root_node, cls.rsplit(".", 1)[-1])
            lines = {p["line"] for p in m["pcs"] if p["line"] is not None}
            decl = match_method(decls, name, lines)
            if decl is None:
                unmatched.append(mid)
                continue
            sites += method_sites(decl, mid, m, source, fields, rejected)
    sites.sort(key=lambda s: (s["source"], s["start_byte"], s["rule"]))
    return Found(sites, rejected, unmatched)


def apply(source: bytes, site: dict) -> bytes:
    """The source with one site rewritten (one variant = one rewrite)."""
    return (
        source[: site["start_byte"]]
        + site["rewritten"].encode()
        + source[site["end_byte"] :]
    )


def summary(found: Found, export: dict) -> str:
    total, unc, unjoined = Counter(), Counter(), Counter()
    for s in found.sites:
        total[s["rule"]] += 1
        unc[s["rule"]] += s["uncertain"]
        unjoined[s["rule"]] += not s["joined"]
    out = [
        f"benchmark methods: {len(export['methods'])}",
        f"methods with a site: {len({s['method'] for s in found.sites})}",
        f"methods with an uncertain site: {len({s['method'] for s in found.sites if s['uncertain']})}",
        f"methods not matched to source: {len(found.unmatched_methods)}",
        f"sites: {len(found.sites)} (uncertain {sum(unc.values())}, not joined {sum(unjoined.values())})",
    ]
    for r in rules.RULE_NAMES:
        out.append(f"  {r}: {total[r]} (uncertain {unc[r]}, not joined {unjoined[r]})")
    out.append("rejected (rule, reason):")
    for (rule, reason), n in sorted(
        found.rejected.items(), key=lambda kv: (kv[0][0], -kv[1], kv[0][1])
    ):
        out.append(f"  {rule}: {reason}: {n}")
    return "\n".join(out)


def main() -> None:
    p = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    p.add_argument(
        "-e", "--export", type=Path, required=True, help="step 3 JSON export"
    )
    p.add_argument("-o", "--output", type=Path, required=True)
    p.add_argument(
        "--root", type=Path, default=Path.cwd(), help="repository root (default: cwd)"
    )
    args = p.parse_args()

    export = json.loads(args.export.read_text())
    found = find_sites(export, args.root)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    data = {
        "export": str(args.export),
        "analyzer": export["analyzer"],
        "rules": list(rules.RULE_NAMES),
        "unmatched_methods": found.unmatched_methods,
        "sites": found.sites,
    }
    args.output.write_text(json.dumps(data, indent=1) + "\n")
    print(summary(found, export))
