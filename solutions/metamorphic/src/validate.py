"""Validation of variants: compile, run original and variant on synthesized inputs (D16).

A variant (one site rewritten, ``sites.apply``) is *valid* when it compiles and
gives the same result as the original (outcome and return value) on every
synthesized input. Inputs come from the method's ``@Case`` inputs and from the
step 3 interval export: interval boundaries of each parameter at the method's
sites, the compared constants, and fixed extremes (``synthesize``).

Everything Java runs in one long-lived container of the jpamb build image:
one script compiles and decompiles all versions, then ``java/Validate.java``
runs each method's versions in one JVM, restarted after every timeout.

``--mutants`` validates deliberately wrong rewrites instead (an off-by-one
comparison operator, or a branch inversion without the swap), to measure how
often the synthesized inputs catch a wrong rule.
"""

import argparse
import json
import random
import re
import shutil
import subprocess
import sys
from collections import Counter, defaultdict
from dataclasses import dataclass
from pathlib import Path

import tree_sitter
from javaexpr import parse, text
from selection import enclosing_method
from sites import apply, nodes_in

from jpamb.utils import DockerRunner

IMAGE = "ghcr.io/kalhauge/jvm2json:jdk-latest"
INT_MIN, INT_MAX = -(2**31), 2**31 - 1
CAP = 128  # inputs per method
RANDOM_INPUTS = 16
SMITH_INPUTS = 8
TIMEOUT_MS = 1000
HERE = Path(__file__).resolve().parent.parent  # solutions/metamorphic

# Deliberately wrong comparison operators (the off-by-one or opposite partner).
MUTATE = {">": ">=", ">=": ">", "<": "<=", "<=": "<", "==": "!=", "!=": "=="}


# --- names and paths --------------------------------------------------------


def vid(site_id: str) -> str:
    return re.sub(r"[^A-Za-z0-9]+", "_", site_id).strip("_")


def class_name(methodid: str) -> str:
    return methodid.split(":")[0].rsplit(".", 1)[0]


def class_path(methodid: str) -> str:
    """``jpamb.cases.Simple`` -> ``jpamb/cases/Simple``."""
    return class_name(methodid).replace(".", "/")


def param_types(methodid: str) -> list[str]:
    desc = methodid.split(":(", 1)[1].split(")", 1)[0]
    return re.findall(r"\[?(?:L[^;]*;|[A-Z])", desc)


# --- input synthesis --------------------------------------------------------

CASE_LINE = re.compile(r"^(\S+)\s+(\(.*\)) -> (.*)$")


def read_cases(path: Path) -> dict[str, list[str]]:
    out: dict[str, list[str]] = defaultdict(list)
    for line in path.read_text().splitlines():
        m = CASE_LINE.match(line.strip())
        if m and m.group(2) not in out[m.group(1)]:
            out[m.group(1)].append(m.group(2))
    return out


def parse_args(inp: str, types: list[str]) -> list[int | bool] | None:
    """The values of an all-int/boolean input such as ``(1, true)``."""
    inner = inp.strip()[1:-1].strip()
    toks = [t.strip() for t in inner.split(",")] if inner else []
    if len(toks) != len(types):
        return None
    out = []
    for t, ty in zip(toks, types):
        if ty == "Z" and t in ("true", "false"):
            out.append(t == "true")
        elif ty == "I" and re.fullmatch(r"-?\d+", t):
            out.append(int(t))
        else:
            return None
    return out


def encode(values: list[int | bool]) -> str:
    return (
        "("
        + ", ".join(
            ("true" if v else "false") if isinstance(v, bool) else str(v)
            for v in values
        )
        + ")"
    )


def clamp(xs) -> set[int]:
    return {x for x in xs if INT_MIN <= x <= INT_MAX}


@dataclass(frozen=True)
class SourceConstants:
    """Constants in a method's source that the interval export may not show."""

    literals: frozenset[int] = frozenset()  # int literals, array initializer lengths
    widths: frozenset[int] = frozenset()  # w in `smith.draw(w)`

    def derived(self) -> set[int]:
        """The literals, their complements, and literal shifts (`c << s`)."""
        shifts = [s for s in self.literals if 1 <= s <= 31]
        out = set(self.literals) | {~c for c in self.literals}
        out |= {c << s for c in self.literals for s in shifts}
        return clamp(out)


def source_constants(method: tree_sitter.Node) -> SourceConstants:
    literals, widths = set(), set()
    for n in nodes_in(method):
        if n.type == "decimal_integer_literal":
            try:
                v = int(text(n).replace("_", ""))
            except ValueError:
                continue
            p = n.parent
            if (
                p.type == "unary_expression"
                and text(p.child_by_field_name("operator")) == "-"
            ):
                v = -v
            literals.add(v)
            call = p.parent if p.type == "argument_list" else None
            if (
                call is not None
                and call.type == "method_invocation"
                and text(call.child_by_field_name("name")) == "draw"
            ):
                widths.add(v)
        elif n.type == "array_initializer":
            literals.add(len(n.named_children))
    return SourceConstants(frozenset(literals), frozenset(widths))


NO_CONSTANTS = SourceConstants()


def int_values(
    method: dict | None, nparams: int, src: SourceConstants = NO_CONSTANTS
) -> list[set[int]]:
    """Per parameter: interval boundaries at its sites, constants, extremes.

    In a static method with only int/boolean parameters, local ``i`` is
    parameter ``i``.
    """
    base = {0, 1, -1, INT_MIN, INT_MAX}
    consts: set[int] = src.derived()
    per = [set(base) for _ in range(nparams)]
    for s in (method or {}).get("sites", []):
        pairs = []
        if s["kind"] == "branch":
            pairs = list(zip(s["operands"], s["origins"]))
        elif s["kind"] == "divisor":
            pairs = [(s["divisor"], s["origin"])]
        for itv, origin in pairs:
            bounds = [b for b in (itv["min"], itv["max"]) if b is not None]
            if origin is None:
                if itv["min"] is not None and itv["min"] == itv["max"]:
                    consts.add(itv["min"])
            elif origin < nparams:
                per[origin] |= {b + d for b in bounds for d in (-1, 0, 1)}
    near = {c + d for c in consts for d in (-1, 0, 1)}
    return [clamp(p | near) for p in per]


def random_bits(r: random.Random) -> str:
    n = r.randint(1, 64)
    return "(r'" + "".join(r.choice("01") for _ in range(n)) + "')"


def capped(cases: list[str], *tiers: list[str], r: random.Random) -> list[str]:
    """Case inputs, then each tier in priority order, up to CAP in total.

    A tier that does not fit is sampled (seeded); later tiers get no room.
    """
    out = list(dict.fromkeys(cases))
    for tier in tiers:
        tier = [g for g in dict.fromkeys(tier) if g not in out]
        room = max(CAP - len(out), 0)
        if len(tier) > room:
            keep = set(r.sample(range(len(tier)), room))
            tier = [g for i, g in enumerate(tier) if i in keep]
        out += tier
    return out


def synthesize(
    methodid: str,
    method: dict | None,
    cases: list[str],
    src: SourceConstants = NO_CONSTANTS,
) -> list[str]:
    """Deterministic test inputs for one method (case inputs always kept)."""
    types = param_types(methodid)
    r = random.Random(f"inputs/{methodid}")
    if not types:
        return ["()"]
    near = sorted({c + d for c in src.derived() for d in (-1, 0, 1)})
    if types == ["Ljpamb/utils/Smith;"]:
        # each constant as the first w bits, nothing after (an exhausted Smith)
        bits = [
            f"(r'{c:0{w}b}')"
            for w in sorted(src.widths)
            if 1 <= w <= 32
            for c in near
            if 0 <= c < 2**w
        ]
        return capped(cases, bits, [random_bits(r) for _ in range(SMITH_INPUTS)], r=r)
    if types == ["[I"]:
        # InputParser reads no negative numbers inside an int[] literal
        return capped(cases, [f"([I: {c}])" for c in near if c >= 0], r=r)
    if not all(t in ("I", "Z") for t in types):
        return list(dict.fromkeys(cases))

    def domains(ints: list[set[int]]) -> list[list]:
        return [
            sorted(ints[i]) if t == "I" else [False, True] for i, t in enumerate(types)
        ]

    def one_at_a_time(doms: list[list]) -> list[str]:
        return [
            encode(b[:i] + [v] + b[i + 1 :])
            for b in bases
            for i, dom in enumerate(doms)
            for v in dom
        ]

    bases = [b for b in (parse_args(c, types) for c in cases) if b is not None]
    zero = [False if t == "Z" else 0 for t in types]
    bases = bases + ([zero] if zero not in bases else [])
    # tier 1: the analysis (interval boundaries, compared constants, extremes);
    # tier 2: constants from the source; tier 3: random combinations
    primary = domains(int_values(method, len(types)))
    full = domains(int_values(method, len(types), src))
    rand = [encode([r.choice(d) for d in full]) for _ in range(RANDOM_INPUTS)]
    return capped(cases, one_at_a_time(primary), one_at_a_time(full), rand, r=r)


# --- condition coverage -----------------------------------------------------


class Unknown(Exception):
    pass


def node_of(tree: tree_sitter.Tree, site: dict) -> tree_sitter.Node:
    return tree.root_node.descendant_for_byte_range(
        site["start_byte"], site["end_byte"]
    )


def assigned_names(method: tree_sitter.Node) -> set[str]:
    out = set()
    for n in nodes_in(method):
        if n.type == "assignment_expression":
            left = n.child_by_field_name("left")
            if left.type == "identifier":
                out.add(text(left))
        elif n.type == "update_expression":
            out |= {text(c) for c in n.named_children if c.type == "identifier"}
    return out


def evaluate(node: tree_sitter.Node, env: dict[str, int]):
    match node.type:
        case "identifier":
            if text(node) not in env:
                raise Unknown(text(node))
            return env[text(node)]
        case "decimal_integer_literal":
            return int(text(node).replace("_", ""))
        case "parenthesized_expression":
            return evaluate(node.named_children[0], env)
        case "unary_expression":
            op = text(node.child_by_field_name("operator"))
            v = evaluate(node.child_by_field_name("operand"), env)
            if op == "!":
                return not v
            if op == "-":
                return -v
        case "binary_expression":
            op = text(node.child_by_field_name("operator"))
            if op == "&&":
                return evaluate(node.child_by_field_name("left"), env) and evaluate(
                    node.child_by_field_name("right"), env
                )
            if op == "||":
                return evaluate(node.child_by_field_name("left"), env) or evaluate(
                    node.child_by_field_name("right"), env
                )
            a = evaluate(node.child_by_field_name("left"), env)
            b = evaluate(node.child_by_field_name("right"), env)
            match op:
                case "<":
                    return a < b
                case "<=":
                    return a <= b
                case ">":
                    return a > b
                case ">=":
                    return a >= b
                case "==":
                    return a == b
                case "!=":
                    return a != b
    raise Unknown(node.type)


def condition_values(
    tree: tree_sitter.Tree, site: dict, inputs: list[str], types: list[str]
) -> str:
    """``both``/``one``: values the original condition takes on the inputs,
    evaluated at method entry; ``unknown`` unless every operand is a parameter
    that the method never assigns."""
    node = node_of(tree, site)
    is_if = site.get("mutated_rule", site["rule"]) == "R1-invert"
    cond = node.child_by_field_name("condition") if is_if else node
    method = enclosing_method(tree.root_node, site["start_byte"])
    if method is None or cond is None:
        return "unknown"
    params = method.child_by_field_name("parameters")
    names = [
        text(p.child_by_field_name("name"))
        for p in params.named_children
        if p.type == "formal_parameter"
    ]
    if len(names) != len(types):
        return "unknown"
    unassigned = set(names) - assigned_names(method)
    seen = set()
    for inp in inputs:
        values = parse_args(inp, types)
        if values is None:
            return "unknown"
        env = {n: v for n, v in zip(names, values) if n in unassigned}
        try:
            seen.add(bool(evaluate(cond, env)))
        except Unknown:
            return "unknown"
    return "both" if len(seen) == 2 else "one"


# --- mutants ----------------------------------------------------------------


def mutant(tree: tree_sitter.Tree, site: dict) -> dict | None:
    """A deliberately wrong rewrite at the same node as ``site``.

    R1: the condition is negated but the branches are not swapped. R2: the
    comparison operator is replaced by its off-by-one (or opposite) partner.
    """
    node = node_of(tree, site)
    if site["rule"] == "R1-invert":
        cond = node.child_by_field_name("condition")
        inner = text(cond)[1:-1]
        rewritten = (
            text(node)[: cond.start_byte - node.start_byte]
            + f"(!({inner}))"
            + text(node)[cond.end_byte - node.start_byte :]
        )
        kind = "invert-without-swap"
    else:
        op = node.child_by_field_name("operator")
        if op is None or text(op) not in MUTATE:
            return None
        rewritten = (
            text(node)[: op.start_byte - node.start_byte]
            + MUTATE[text(op)]
            + text(node)[op.end_byte - node.start_byte :]
        )
        kind = "off-by-one"
    return {
        **site,
        "id": f"{site['source']}:{node.start_point.row + 1}:{node.start_point.column + 1}:mutant-{kind}",
        "rule": f"mutant-{kind}",
        "mutated_rule": site["rule"],
        "rewritten": rewritten,
    }


def mutants(sites: list[dict], root: Path) -> list[dict]:
    """One mutant per distinct rewritten node (R2 rules share their node)."""
    trees: dict[str, tree_sitter.Tree] = {}
    out, seen = [], set()
    for s in sites:
        key = (s["source"], s["start_byte"], s["rule"] == "R1-invert")
        if key in seen:
            continue
        seen.add(key)
        if s["source"] not in trees:
            trees[s["source"]] = parse((root / s["source"]).read_bytes())
        if m := mutant(trees[s["source"]], s):
            out.append(m)
    return out


# --- bytecode ---------------------------------------------------------------


def bytecode(decompiled: dict) -> list:
    """The instructions of every method, without line tables."""
    return [
        (m["name"], m["params"], m["code"]["bytecode"] if m["code"] else None)
        for m in decompiled["methods"]
    ]


# --- container --------------------------------------------------------------


@dataclass
class Container:
    docker: DockerRunner
    name: str = ""

    def start(self) -> None:
        out = subprocess.run(
            [*self.docker.docker_cmd, "run", "-d", "--rm", "-v",
             f"{self.docker.workfolder}:/workspace", self.docker.image,
             "sleep", "infinity"],
            check=True, capture_output=True, text=True,
        )  # fmt: skip
        self.name = out.stdout.strip()

    def exec(self, cmd: list[str], timeout: float) -> subprocess.CompletedProcess:
        return subprocess.run(
            [*self.docker.docker_cmd, "exec", "-w", "/workspace", self.name, *cmd],
            capture_output=True, text=True, timeout=timeout, check=False,
        )  # fmt: skip

    def stop(self) -> None:
        if self.name:
            subprocess.run(
                [*self.docker.docker_cmd, "kill", self.name],
                capture_output=True,
                check=False,
            )


# --- pipeline ---------------------------------------------------------------


def build_script(build: Path, originals: list[str], variants: list[dict]) -> str:
    """Bash that compiles and decompiles the originals and every variant."""
    b = build.as_posix()
    lines = [
        "set -u",
        f"mkdir -p {b}/harness {b}/_orig/classes",
        f"javac -d {b}/harness solutions/metamorphic/java/Validate.java || exit 1",
        f"javac -g -cp target/classes -d {b}/_orig/classes "
        + " ".join(f"cases/{c}.java" for c in originals)
        + " || exit 1",
    ]
    for c in originals:
        lines.append(f"mkdir -p {b}/_orig/decompiled/$(dirname {c})")
        lines.append(
            f"jvm2json -s {b}/_orig/classes/{c}.class > {b}/_orig/decompiled/{c}.json"
        )
    for v in variants:
        d, c = f"{b}/{v['vid']}", v["class"]
        lines.append(
            f"if javac -g -cp target/classes -d {d}/classes {d}/src/{c}.java "
            f"2> {d}/javac.log; then mkdir -p {d}/decompiled/$(dirname {c}) && "
            f"jvm2json -s {d}/classes/{c}.class > {d}/decompiled/{c}.json && "
            f"echo 'ok {v['vid']}'; else echo 'fail {v['vid']}'; fi"
        )
    return "\n".join(lines) + "\n"


def run_method(
    box: Container, build: Path, methodid: str, versions: list[str], inputs: list[str]
) -> list[list[str]]:
    """results[v][i] for every version and input, restarting after timeouts."""
    tag = vid(methodid)
    (build / "runs").mkdir(parents=True, exist_ok=True)
    vfile, ifile = build / "runs" / f"{tag}.versions", build / "runs" / f"{tag}.inputs"
    vfile.write_text("\n".join(versions) + "\n")
    ifile.write_text("\n".join(inputs) + "\n")
    results = [[None] * len(inputs) for _ in versions]
    v, i = 0, 0
    while v < len(versions):
        p = box.exec(
            ["java", "-cp", f"{build.as_posix()}/harness", "Validate", methodid,
             "target/classes", vfile.as_posix(), ifile.as_posix(), str(v), str(i),
             str(TIMEOUT_MS)],
            timeout=3600,
        )  # fmt: skip
        last = None
        for line in p.stdout.splitlines():
            a, b, res = line.split("\t", 2)
            results[int(a)][int(b)] = res
            last = (int(a), int(b))
        if p.returncode == 0:
            break
        if p.returncode != 3 or last is None:
            raise RuntimeError(f"harness failed on {methodid}: {p.stderr[-2000:]}")
        v, i = last[0], last[1] + 1
        if i >= len(inputs):
            v, i = v + 1, 0
    return results


def validate(
    sites: list[dict],
    export: dict,
    cases: dict[str, list[str]],
    root: Path,
    build: Path,
    docker: DockerRunner,
    log=print,
) -> list[dict]:
    if build.exists():
        shutil.rmtree(build)
    rel_build = build.relative_to(root)
    variants = []
    for s in sites:
        c = class_path(s["method"])
        d = build / vid(s["id"])
        (d / "src" / c).parent.mkdir(parents=True, exist_ok=True)
        (d / "src" / f"{c}.java").write_bytes(
            apply((root / s["source"]).read_bytes(), s)
        )
        variants.append({"site": s, "vid": vid(s["id"]), "class": c})
    originals = sorted({v["class"] for v in variants})

    box = Container(docker)
    box.start()
    try:
        log(f"compiling {len(variants)} variants of {len(originals)} classes")
        build.mkdir(parents=True, exist_ok=True)
        (build / "build.sh").write_text(build_script(rel_build, originals, variants))
        p = box.exec(["bash", f"{rel_build.as_posix()}/build.sh"], 7200)
        if p.returncode != 0:
            raise RuntimeError(p.stderr[-3000:])
        compiled = {
            line.split()[1] for line in p.stdout.splitlines() if line.startswith("ok ")
        }
        orig_code = {
            c: bytecode(
                json.loads((build / "_orig/decompiled" / f"{c}.json").read_text())
            )
            for c in originals
        }

        by_method: dict[str, list[dict]] = defaultdict(list)
        for v in variants:
            by_method[v["site"]["method"]].append(v)
        trees: dict[str, tree_sitter.Tree] = {}
        verdicts = []
        for k, (mid, vs) in enumerate(sorted(by_method.items())):
            s0 = vs[0]["site"]
            if s0["source"] not in trees:
                trees[s0["source"]] = parse((root / s0["source"]).read_bytes())
            decl = enclosing_method(trees[s0["source"]].root_node, s0["start_byte"])
            src = source_constants(decl) if decl is not None else NO_CONSTANTS
            inputs = synthesize(
                mid, export["methods"].get(mid), cases.get(mid, []), src
            )
            ok = [v for v in vs if v["vid"] in compiled]
            versions = [f"{rel_build.as_posix()}/_orig/classes"] + [
                f"{rel_build.as_posix()}/{v['vid']}/classes" for v in ok
            ]
            log(
                f"[{k + 1}/{len(by_method)}] {mid}: {len(ok)} variants x {len(inputs)} inputs"
            )
            results = run_method(box, rel_build, mid, versions, inputs)
            row = {v["vid"]: results[j + 1] for j, v in enumerate(ok)}
            types = param_types(mid)
            for v in vs:
                s = v["site"]
                if s["source"] not in trees:
                    trees[s["source"]] = parse((root / s["source"]).read_bytes())
                verdict = {
                    "id": s["id"],
                    "method": mid,
                    "rule": s["rule"],
                    "uncertain": s["uncertain"],
                    "compiles": v["vid"] in compiled,
                    "inputs": len(inputs),
                    "condition_values": condition_values(
                        trees[s["source"]], s, inputs, types
                    ),
                }
                if verdict["compiles"]:
                    dec = build / v["vid"] / "decompiled" / f"{v['class']}.json"
                    mism = [
                        {"input": inputs[i], "original": results[0][i], "variant": r}
                        for i, r in enumerate(row[v["vid"]])
                        if r != results[0][i]
                    ]
                    verdict |= {
                        "bytecode_identical": bytecode(json.loads(dec.read_text()))
                        == orig_code[v["class"]],
                        "timeouts": sum(r == "*" for r in results[0]),
                        "mismatches": mism,
                        "valid": not mism,
                    }
                else:
                    log_file = build / v["vid"] / "javac.log"
                    verdict |= {
                        "bytecode_identical": None,
                        "mismatches": [],
                        "valid": False,
                        "javac": log_file.read_text()[-1000:],
                    }
                if "mutated_rule" in s:
                    verdict["mutated_rule"] = s["mutated_rule"]
                verdicts.append(verdict)
        return verdicts
    finally:
        box.stop()


def summary(verdicts: list[dict], label: str) -> str:
    n = len(verdicts)
    by_rule = defaultdict(list)
    for v in verdicts:
        by_rule[v["rule"]].append(v)
    out = [
        f"{label}: {n}",
        f"  compile: {sum(v['compiles'] for v in verdicts)}",
        f"  valid (same result on every input): {sum(v['valid'] for v in verdicts)}",
        f"  discarded by testing: {sum(v['compiles'] and not v['valid'] for v in verdicts)}",
        f"  bytecode identical to original: {sum(bool(v['bytecode_identical']) for v in verdicts)}",
        (
            f"  inputs per method: min {min(v['inputs'] for v in verdicts)}, "
            f"max {max(v['inputs'] for v in verdicts)}"
        ),
        f"  original condition values on inputs: {dict(Counter(v['condition_values'] for v in verdicts))}",
    ]
    for rule, vs in sorted(by_rule.items()):
        out.append(
            f"  {rule}: {len(vs)}, valid {sum(v['valid'] for v in vs)}, "
            f"identical bytecode {sum(bool(v['bytecode_identical']) for v in vs)}, "
            f"condition values {dict(Counter(v['condition_values'] for v in vs))}"
        )
    if label == "mutants":
        killed = sum(v["compiles"] and not v["valid"] for v in verdicts)
        out.append(f"  killed (caught by testing): {killed} of {n}")
        eq = [v for v in verdicts if v.get("equivalent")]
        if eq:
            live = [v for v in verdicts if not v.get("equivalent")]
            k = sum(v["compiles"] and not v["valid"] for v in live)
            out.append(
                f"  equivalent (no input can kill them): {len(eq)}, "
                f"of which killed {sum(not v['valid'] for v in eq)}"
            )
            out.append(f"  killed among non-equivalent: {k} of {len(live)}")
            for v in live:
                if v["valid"]:
                    out.append(f"    survived: {v['id']}")
    bad = [v for v in verdicts if not v["valid"]]
    if bad:
        out.append(f"  not valid ({len(bad)}), first 10:")
        for v in bad[:10]:
            first = v["mismatches"][0] if v["mismatches"] else v.get("javac", "")
            out.append(f"    {v['id']}: {first}")
    return "\n".join(out)


def mark_equivalent(verdicts: list[dict], path: Path | None) -> None:
    if path is None:
        return
    eq = json.loads(path.read_text())["equivalent"]
    for v in verdicts:
        v["equivalent"] = v["id"] in eq


def main() -> None:
    p = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    p.add_argument("-s", "--sites", type=Path, required=True, help="step 4 sites.json")
    p.add_argument("-e", "--export", type=Path, required=True, help="step 3 export")
    p.add_argument("-o", "--output", type=Path, required=True)
    p.add_argument("--root", type=Path, default=Path.cwd())
    p.add_argument(
        "--build", type=Path, default=None, help="default: ROOT/build/variants"
    )
    p.add_argument("--only", default=None, help="only methods containing this text")
    p.add_argument("--mutants", action="store_true", help="validate wrong rewrites")
    p.add_argument("--image", default=IMAGE)
    p.add_argument(
        "--equivalent",
        type=Path,
        default=None,
        help="JSON of mutants known to be equivalent (for the kill rate)",
    )
    p.add_argument(
        "--summary-only",
        action="store_true",
        help="re-summarize an existing OUTPUT instead of running",
    )
    args = p.parse_args()

    root = args.root.resolve()
    if args.summary_only:
        data = json.loads(args.output.read_text())
        mark_equivalent(data["variants"], args.equivalent)
        args.output.write_text(json.dumps(data, indent=1) + "\n")
        print(summary(data["variants"], "mutants" if data["mutants"] else "variants"))
        return
    sites = json.loads(args.sites.read_text())["sites"]
    if args.only:
        sites = [s for s in sites if args.only in s["method"]]
    if args.mutants:
        sites = mutants(sites, root)
    build = args.build or root / ("build/mutants" if args.mutants else "build/variants")
    build = build.resolve()
    export = json.loads(args.export.read_text())
    cases = read_cases(root / "target/stats/cases.txt")
    dockerbin = shutil.which("podman") or shutil.which("docker")
    docker = DockerRunner((dockerbin,), args.image, str(root))

    verdicts = validate(
        sites,
        export,
        cases,
        root,
        build,
        docker,
        log=lambda m: print(m, file=sys.stderr),
    )
    mark_equivalent(verdicts, args.equivalent)
    data = {
        "sites": str(args.sites),
        "export": str(args.export),
        "mutants": args.mutants,
        "timeout_ms": TIMEOUT_MS,
        "input_cap": CAP,
        "variants": verdicts,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(data, indent=1) + "\n")
    print(summary(verdicts, "mutants" if args.mutants else "variants"))
