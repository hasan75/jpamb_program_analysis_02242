# /// script
# requires-python = ">=3.12"
# dependencies = ["scipy>=1.11"]
# ///
"""Step 8 statistics: distinct inconsistencies found by each strategy under a
rewrite budget (RQ1, D10, D11), with and without the Guards cases (D12).

For every subset, budget, strategy and seed, the first N sites of the step 5
order are rewritten; the distinct D10 tuples among them are counted per
analyzer and in total. Guided strategies are compared with the baselines by a
two-sided Mann-Whitney U test over the seeds, with Vargha-Delaney A12.

Without Guards, each order is filtered to the other sites (a filtered uniform
shuffle is a uniform shuffle, and candidates stay first) and N is recomputed
from the smaller eligible count with the same fractions.

Usage: uv run experiments/stats.py [--outcomes F] [--seeds K] [-o F]
"""

import argparse
import json
import statistics
from pathlib import Path

from scipy.stats import mannwhitneyu

ROOT = Path(__file__).resolve().parents[1]
BUDGET_FRACTIONS = {"50%": 0.5, "25%": 0.25}  # D11, as in metamorphic.selection
SUBSETS = {"all": lambda i: True, "without Guards": lambda i: "/Guards.java:" not in i}
# (strategy, baseline, pre-registered?)
COMPARISONS = [
    ("guided", "random", True),
    ("guided", "syntax", True),
    ("guided-strict", "random", True),
    ("guided-strict", "syntax", True),
    ("settled", "random", False),
]
TOTAL = "all analyzers"


def budgets(eligible: int) -> dict[str, int]:
    return {k: round(f * eligible) for k, f in BUDGET_FRACTIONS.items()}


def tuples_of(outcomes: dict) -> dict[str, set[tuple]]:
    """Per variant id, its D10 tuples (empty if no analyzer changes)."""
    orig = outcomes["originals"]
    out = {}
    for v in outcomes["variants"]:
        out[v["id"]] = {
            (
                a,
                v["method"],
                v["rule"],
                tuple(orig[v["method"]][a]["outcomes"]),
                tuple(r["outcomes"]),
            )
            for a, r in v["analyses"].items()
            if r["outcomes"] != orig[v["method"]][a]["outcomes"]
        }
    return out


def count(found: set[tuple], analyzers: list[str]) -> dict[str, int]:
    c = {a: sum(t[0] == a for t in found) for a in analyzers}
    c[TOTAL] = len(found)
    return c


def a12(a: list[int], b: list[int]) -> float:
    """Vargha-Delaney A12: P(A > B) + P(A = B) / 2."""
    wins = sum((x > y) + 0.5 * (x == y) for x in a for y in b)
    return wins / (len(a) * len(b))


def test(a: list[int], b: list[int]) -> dict:
    if len(set(a) | set(b)) == 1:  # identical constant samples: no test
        return {"U": None, "p": None, "A12": 0.5}
    u = mannwhitneyu(a, b, alternative="two-sided")
    return {"U": float(u.statistic), "p": float(u.pvalue), "A12": a12(a, b)}


def compute(selections: dict, outcomes: dict, seeds: list[str]) -> dict:
    per_variant = tuples_of(outcomes)
    analyzers = sorted(next(iter(outcomes["originals"].values())))
    assert budgets(selections["eligible"]) == selections["budgets"]
    results = {}
    for subset, keep in SUBSETS.items():
        eligible = [
            i for i in next(iter(selections["orders"]["random"].values())) if keep(i)
        ]
        res = {"eligible": len(eligible), "budgets": budgets(len(eligible))}
        found_all: set[tuple] = set()
        for i in eligible:
            found_all |= per_variant.get(i, set())
        res["pool"] = count(found_all, analyzers)
        for label, n in res["budgets"].items():
            runs = {}
            for strategy, orders in selections["orders"].items():
                runs[strategy] = {}
                for seed in seeds:
                    picked = [i for i in orders[seed] if keep(i)][:n]
                    found = set().union(*(per_variant.get(i, set()) for i in picked))
                    runs[strategy][seed] = count(found, analyzers)
            means = {
                s: {
                    a: {
                        "mean": statistics.mean(r[seed][a] for seed in seeds),
                        "sd": statistics.pstdev([r[seed][a] for seed in seeds]),
                    }
                    for a in [*analyzers, TOTAL]
                }
                for s, r in runs.items()
            }
            tests = []
            for s, base, pre in COMPARISONS:
                for a in [*analyzers, TOTAL]:
                    x = [runs[s][seed][a] for seed in seeds]
                    y = [runs[base][seed][a] for seed in seeds]
                    tests.append(
                        {
                            "strategy": s,
                            "baseline": base,
                            "analyzer": a,
                            "pre_registered": pre,
                            **test(x, y),
                        }
                    )
            res[label] = {"N": n, "runs": runs, "means": means, "tests": tests}
        results[subset] = res
    return {"seeds": seeds, "analyzers": analyzers, "subsets": results}


def fmt_p(p: float | None) -> str:
    return "  -  " if p is None else f"{p:.3f}"


def summary(data: dict) -> str:
    out = [f"seeds: {len(data['seeds'])}"]
    cols = [*data["analyzers"], TOTAL]
    for subset, res in data["subsets"].items():
        pool = ", ".join(f"{a} {n}" for a, n in res["pool"].items())
        out.append(f"\n== {subset}: {res['eligible']} eligible sites; pool {pool}")
        for label in res["budgets"]:
            r = res[label]
            out.append(f"budget {label}: N = {r['N']}  (mean distinct, sd)")
            out.append("  strategy       " + "".join(f"{c:>22}" for c in cols))
            for s, m in r["means"].items():
                cells = "".join(
                    f"{m[c]['mean']:>15.1f} ({m[c]['sd']:.2f})" for c in cols
                )
                out.append(f"  {s:14} {cells}")
            for t in r["tests"]:
                if t["analyzer"] != TOTAL:
                    continue
                tag = "" if t["pre_registered"] else "  [post-hoc]"
                out.append(
                    f"  {t['strategy']} vs {t['baseline']}: p = {fmt_p(t['p'])},"
                    f" A12 = {t['A12']:.2f}{tag}"
                )
    return "\n".join(out)


def main() -> None:
    p = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    p.add_argument(
        "--selections", type=Path, default=ROOT / "project/step5/selections.json"
    )
    p.add_argument(
        "--outcomes", type=Path, default=ROOT / "experiments/results/outcomes.json"
    )
    p.add_argument("--seeds", type=int, default=None, help="only the first K seeds")
    p.add_argument(
        "-o", "--output", type=Path, default=ROOT / "experiments/results/stats.json"
    )
    args = p.parse_args()
    selections = json.loads(args.selections.read_text())
    outcomes = json.loads(args.outcomes.read_text())
    seeds = [str(s) for s in selections["seeds"]][: args.seeds]
    data = compute(selections, outcomes, seeds)
    data["selections"] = str(args.selections.resolve().relative_to(ROOT))
    data["outcomes"] = str(args.outcomes.resolve().relative_to(ROOT, walk_up=True))
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(data, indent=1) + "\n")
    print(summary(data))


if __name__ == "__main__":
    main()
