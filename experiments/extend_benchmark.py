"""Add coverage entries for new case classes to target/stats/benchmark.sexp.

`jpamb build --benchmark` regenerates the whole file with one interpreter;
this adds only the cases whose method id matches FILTER and checks that
every existing entry is unchanged (compared parsed, not as text).

Usage: uv run python experiments/extend_benchmark.py INTERPRETER FILTER
"""

import re
import sys
from collections import OrderedDict
from pathlib import Path

import jpamb
import jpamb.interpret
import sexpr
from jpamb.case import Benchmark, Control, Coverage
from jpamb.utils import Effect


def parse(text: str) -> Benchmark:
    """Parsed contents (the text form orders sets arbitrarily)."""
    return Benchmark.from_sexpr(sexpr.from_string(text)[0])


def main() -> None:
    interpreter, pattern = sys.argv[1], re.compile(sys.argv[2])
    eff = Effect(sys.stderr)
    suite = jpamb.Suite.from_workdir(Path.cwd())
    benchmark = suite.benchmark(eff=eff)
    old = dict(suite.benchmark(eff=eff).experiments)
    if parse(sexpr.pretty(sexpr.sexpr(benchmark), indent=2)).experiments != old:
        sys.exit("benchmark.sexp does not round-trip; refusing to rewrite it")

    config = jpamb.interpret.Config.from_cmd(
        (interpreter,), experiments=[], max_steps=100, timeout=5.0, eff=eff,
        abstract=False,
    )  # fmt: skip
    added = 0
    for case in suite.cases(eff=eff):
        if not pattern.search(str(case.methodid)):
            continue
        result = config.run_experiment(case.experiment, workdir=suite.workdir, eff=eff)
        if result.response is None:
            sys.exit(f"no response for {case.experiment}")
        reachable = {step.pc for step in result.response.steps}
        coverage = OrderedDict(
            (m, Coverage(reachable={pc.offset for pc in reachable if pc.method == m}))
            for m in sorted({pc.method for pc in reachable})
        )
        benchmark[case.experiment] = Control(coverage=coverage, results={case.result})
        added += 1
    out = sexpr.pretty(sexpr.sexpr(benchmark), indent=2)
    new = parse(out).experiments
    changed = [
        e for e, c in old.items() if new.get(e) != c and pattern.search(str(e)) is None
    ]
    if changed:
        sys.exit(f"{len(changed)} existing entries would change; refusing")
    suite.benchmark_file.write_text(out)
    print(f"added {added} cases; {len(old)} existing entries unchanged")


if __name__ == "__main__":
    main()
