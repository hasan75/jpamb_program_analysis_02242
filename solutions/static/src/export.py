"""Export per-PC abstract states and uncertain sites as JSON (step 3, D14).

The guided strategy reads which program points are *uncertain* from the
interval analysis: a branch whose condition can still be true and false, a
divisor that may be zero and nonzero, or an array access (array lengths are not
tracked, so no access is proven in bounds). Every instruction is mapped to its
source line through the method's line table. jvm2json writes the table's
``offset`` as an instruction index (the same as ``PC.offset`` and jump targets),
not as the class file's byte offset, which ``Opcode.offset`` keeps.
"""

import argparse
import bisect
import contextlib
import io
import json
import sys
import time
from collections import Counter
from pathlib import Path

from abstractions import Interval, SignSet
from static import STEP_CAP, AbstractInterpreter, Domain

import jpamb
from jpamb import jvm
from jvm.state import PC, StackInt

DOMAINS: dict[str, Domain] = {"interval": Interval, "sign": SignSet}


def line_table(suite: jpamb.Suite, methodid: jvm.AbsMethodID, eff) -> list[dict]:
    lines = suite.findmethod(methodid, eff=eff)["code"]["lines"]
    return sorted(lines, key=lambda e: e["offset"])


def line_of(lines: list[dict], index: int) -> int | None:
    """The source line of the instruction at ``index``."""
    starts = [e["offset"] for e in lines]
    i = bisect.bisect_right(starts, index) - 1
    return lines[i]["line"] if i >= 0 else None


def source_file(suite: jpamb.Suite, methodid: jvm.AbsMethodID) -> str | None:
    path = Path("cases") / (methodid.classname.slashed() + ".java")
    return str(path) if (suite.workdir / path).exists() else None


def site(opr: jvm.Opcode, index: int, state, domain: Domain) -> dict | None:
    """The site at one reachable instruction, or None if it is not a site."""
    zero = domain.abstract([StackInt(0)])
    match opr:
        case jvm.If(condition=op, target=target) | jvm.Ifz(condition=op, target=target):
            n = 2 if isinstance(opr, jvm.If) else 1
            values = state.stack[-n:]
            origins = list(state.origins[-n:])
            v1, v2 = (values[0], values[1]) if n == 2 else (values[0], zero)
            outcomes = sorted(v1.compare(v2, op))
            return {
                "kind": "branch",
                "cmp": op.name.lower(),
                "operands": [v1.to_json(), v2.to_json()],
                "origins": origins + [None] * (2 - n),
                "outcomes": outcomes,
                "backward": target <= index,
                "uncertain": outcomes == [False, True],
            }
        case jvm.Binary(operant=jvm.BinaryOpr.Div | jvm.BinaryOpr.Rem as op):
            divisor = state.stack[-1]
            may_be_zero = StackInt(0) in divisor
            may_be_nonzero = not divisor <= zero
            return {
                "kind": "divisor",
                "opr": op.name.lower(),
                "divisor": divisor.to_json(),
                "origin": state.origins[-1],
                "may_be_zero": may_be_zero,
                "may_be_nonzero": may_be_nonzero,
                "uncertain": may_be_zero and may_be_nonzero,
            }
        case jvm.ArrayLoad() | jvm.ArrayStore():
            k = 2 if isinstance(opr, jvm.ArrayLoad) else 3
            ref, idx = state.stack[-k], state.stack[-k + 1]
            return {
                "kind": "array",
                "index": idx.to_json(),
                "may_be_null": StackInt(0) in ref,
                "uncertain": True,
            }
        case jvm.Goto(target=target):
            return {"kind": "goto", "backward": target <= index, "uncertain": False}
    return None


def export_method(
    bc: jpamb.Bytecode,
    methodid: jvm.AbsMethodID,
    domain: Domain = Interval,
    narrow: bool = True,
) -> dict:
    """Run the analyzer on one method and return its states and sites."""
    suite, eff = bc.suite, bc.eff
    opcodes = bc.getmethod(methodid).opcodes
    lines = line_table(suite, methodid, eff)

    start = time.perf_counter()
    ai = AbstractInterpreter.initial(bc, methodid, None, narrow=narrow, domain=domain)
    finals: set[str] = set()
    steps = 0
    with contextlib.redirect_stderr(io.StringIO()):
        while steps < STEP_CAP and ai.worklist:
            _pc, f = ai.step()
            finals |= f
            steps += 1
    seconds = time.perf_counter() - start

    pcs, sites = [], []
    for index, opr in enumerate(opcodes):
        line = line_of(lines, index)
        state = ai.states.get(PC(methodid, index))
        entry = {
            "pc": index,
            "line": line,
            "op": str(opr),
            "reachable": state is not None,
        }
        if state is not None:
            entry["state"] = {
                "locals": [v.to_json() for v in state.locals],
                "stack": [v.to_json() for v in state.stack],
            }
            s = site(opr, index, state, domain)
            if s is not None:
                sites.append({"pc": index, "line": line, **s})
        pcs.append(entry)

    return {
        "source": source_file(suite, methodid),
        "fixpoint": not ai.worklist,
        "steps": steps,
        "seconds": seconds,
        "outcomes": sorted(finals),
        "uncertain_lines": sorted(
            {s["line"] for s in sites if s["uncertain"] and s["line"] is not None}
        ),
        "sites": sites,
        "pcs": pcs,
    }


def benchmark_methods(suite: jpamb.Suite, eff) -> list[jvm.AbsMethodID]:
    """The distinct methods with cases, i.e. those `jpamb analyse` scores."""
    return sorted({c.methodid for c in suite.cases(eff=eff)}, key=lambda m: m.encode())


def export_all(bc: jpamb.Bytecode, domain: Domain, narrow: bool) -> dict:
    methods = {
        m.encode(): export_method(bc, m, domain, narrow)
        for m in benchmark_methods(bc.suite, bc.eff)
    }
    name = "static-interval" if domain is Interval else "static-sign"
    if domain is SignSet and narrow:
        name += "-narrow"
    return {
        "analyzer": name,
        "domain": "interval" if domain is Interval else "sign",
        "narrow": narrow,
        "step_cap": STEP_CAP,
        "methods": methods,
    }


def summary(export: dict) -> str:
    methods = export["methods"].values()
    kinds, uncertain = Counter(), Counter()
    for m in methods:
        for s in m["sites"]:
            kinds[s["kind"]] += 1
            uncertain[s["kind"]] += s["uncertain"]
    out = [
        f"analyzer {export['analyzer']} (domain {export['domain']}, narrow {export['narrow']})",
        f"methods: {len(methods)}",
        f"without fixpoint: {sum(not m['fixpoint'] for m in methods)}",
        f"methods with an uncertain site: {sum(bool(m['uncertain_lines']) for m in methods)}",
    ]
    for k in ("branch", "divisor", "array", "goto"):
        out.append(f"{k} sites: {kinds[k]} (uncertain {uncertain[k]})")
    out.append(f"total seconds: {sum(m['seconds'] for m in methods):.3f}")
    return "\n".join(out)


def main() -> None:
    p = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    p.add_argument("--domain", choices=DOMAINS, default="interval")
    p.add_argument("--no-narrow", dest="narrow", action="store_false")
    p.add_argument("-o", "--output", type=Path, required=True)
    args = p.parse_args()

    suite, eff = jpamb.setup()
    bc = jpamb.Bytecode(suite, eff, {})
    export = export_all(bc, DOMAINS[args.domain], args.narrow)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(export, indent=1) + "\n")
    print(summary(export))
    print(f"wrote {args.output}", file=sys.stderr)
