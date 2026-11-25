"""Site selection: the order in which each strategy spends the rewrite budget (D15).

Every strategy returns a permutation of all eligible sites (``sites.json`` of
step 4); a rewrite budget N takes its first N sites, and a time budget takes
sites in that order until the time runs out. The order depends only on the
strategy name and the seed.

- ``random``: uniform over all eligible sites.
- ``syntax``: closest first to a ``/``, ``%`` or ``assert`` in the same method,
  by source lines; no analysis.
- ``guided``: candidates (``uncertain``, D14) first, then the rest.
- ``guided-strict``: candidates that are uncertain *and* lie in a method with
  an uncertain divisor or array access, then the rest (sensitivity check).
"""

import argparse
import json
import math
import random
import statistics
from collections import Counter
from pathlib import Path

import tree_sitter
from javaexpr import parse, text
from sites import nodes_in

STRATEGIES = ("random", "syntax", "guided", "guided-strict")
SEEDS = range(10)
BUDGET_FRACTIONS = {"50%": 0.5, "25%": 0.25}  # D11


def rng(strategy: str, seed: int) -> random.Random:
    return random.Random(f"{strategy}/{seed}")


def shuffled(sites: list[dict], r: random.Random) -> list[dict]:
    out = sorted(sites, key=lambda s: s["id"])
    r.shuffle(out)
    return out


def anchor_lines(method: tree_sitter.Node) -> list[int]:
    """Lines of the ``/``, ``%`` and ``assert`` in a method declaration."""
    lines = []
    for n in nodes_in(method):
        if n.type == "assert_statement" or (
            n.type == "binary_expression"
            and text(n.child_by_field_name("operator")) in ("/", "%")
        ):
            lines.append(n.start_point.row + 1)
    return lines


def enclosing_method(root: tree_sitter.Node, byte: int) -> tree_sitter.Node | None:
    node = root.descendant_for_byte_range(byte, byte)
    while node is not None and node.type != "method_declaration":
        node = node.parent
    return node


def syntax_distance(tree: tree_sitter.Tree, start_byte: int) -> float:
    """Lines from the site at ``start_byte`` to the nearest anchor of its method.

    ``inf`` if the method has no ``/``, ``%`` or ``assert``.
    """
    method = enclosing_method(tree.root_node, start_byte)
    anchors = anchor_lines(method) if method is not None else []
    line = tree.root_node.descendant_for_byte_range(start_byte, start_byte)
    row = line.start_point.row + 1
    return min((abs(row - a) for a in anchors), default=math.inf)


def syntax_distances(sites: list[dict], root: Path) -> dict[str, float]:
    trees: dict[str, tree_sitter.Tree] = {}
    out = {}
    for s in sites:
        if s["source"] not in trees:
            trees[s["source"]] = parse((root / s["source"]).read_bytes())
        out[s["id"]] = syntax_distance(trees[s["source"]], s["start_byte"])
    return out


def strict_candidates(sites: list[dict], export: dict) -> set[str]:
    """Uncertain sites in methods with an uncertain divisor or array access."""
    risky = {
        mid
        for mid, m in export["methods"].items()
        if any(x["uncertain"] and x["kind"] in ("divisor", "array") for x in m["sites"])
    }
    return {s["id"] for s in sites if s["uncertain"] and s["method"] in risky}


def candidates_first(sites: list[dict], cand: set[str], r: random.Random) -> list[dict]:
    order = shuffled(sites, r)
    return [s for s in order if s["id"] in cand] + [
        s for s in order if s["id"] not in cand
    ]


def order(
    strategy: str,
    seed: int,
    sites: list[dict],
    distance: dict[str, float],
    strict: set[str],
) -> list[dict]:
    r = rng(strategy, seed)
    match strategy:
        case "random":
            return shuffled(sites, r)
        case "syntax":
            # shuffle, then a stable sort: ties stay in random order
            return sorted(shuffled(sites, r), key=lambda s: distance[s["id"]])
        case "guided":
            return candidates_first(
                sites, {s["id"] for s in sites if s["uncertain"]}, r
            )
        case "guided-strict":
            return candidates_first(sites, strict, r)
    raise ValueError(f"unknown strategy {strategy}")


def budgets(eligible: int) -> dict[str, int]:
    return {k: round(f * eligible) for k, f in BUDGET_FRACTIONS.items()}


def summary(data: dict, sites: list[dict], strict: set[str]) -> str:
    by_id = {s["id"]: s for s in sites}
    unc = {s["id"] for s in sites if s["uncertain"]}
    out = [
        f"eligible sites: {data['eligible']}",
        (
            f"candidates: guided {len(unc)}, guided-strict {len(strict)} "
            f"({len({by_id[i]['method'] for i in strict})} methods)"
        ),
        f"seeds: {len(data['seeds'])}",
    ]

    def stat(xs: list[int]) -> str:
        return f"{statistics.mean(xs):6.1f} [{min(xs)}-{max(xs)}]"

    for label, n in data["budgets"].items():
        out.append(f"budget {label}: N = {n}")
        out.append("  strategy       uncertain hit     strict hit        methods")
        for strat in STRATEGIES:
            picks = [ids[:n] for ids in data["orders"][strat].values()]
            u = [len(unc.intersection(p)) for p in picks]
            st = [len(strict.intersection(p)) for p in picks]
            ms = [len({by_id[i]["method"] for i in p}) for p in picks]
            out.append(f"  {strat:14} {stat(u)}  {stat(st)}  {stat(ms)}")
        for strat in STRATEGIES:
            rules = Counter(
                by_id[i]["rule"]
                for ids in data["orders"][strat].values()
                for i in ids[:n]
            )
            mix = ", ".join(
                f"{r} {c / len(data['seeds']):.1f}" for r, c in sorted(rules.items())
            )
            out.append(f"  rules per seed, {strat}: {mix}")
    return "\n".join(out)


def main() -> None:
    p = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    p.add_argument("-s", "--sites", type=Path, required=True, help="step 4 sites.json")
    p.add_argument("-e", "--export", type=Path, required=True, help="step 3 export")
    p.add_argument("-o", "--output", type=Path, required=True)
    p.add_argument(
        "--root", type=Path, default=Path.cwd(), help="repository root (default: cwd)"
    )
    args = p.parse_args()

    sites = json.loads(args.sites.read_text())["sites"]
    export = json.loads(args.export.read_text())
    distance = syntax_distances(sites, args.root)
    strict = strict_candidates(sites, export)
    data = {
        "sites": str(args.sites),
        "export": str(args.export),
        "eligible": len(sites),
        "budgets": budgets(len(sites)),
        "seeds": list(SEEDS),
        "orders": {
            strat: {
                str(seed): [
                    s["id"] for s in order(strat, seed, sites, distance, strict)
                ]
                for seed in SEEDS
            }
            for strat in STRATEGIES
        },
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(data, indent=1) + "\n")
    print(summary(data, sites, strict))
