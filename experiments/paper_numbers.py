"""Write every number and generated table the paper uses to paper/generated/.

Reads only committed results (steps 3-8); the paper's sections use the macros
in numbers.tex and \\input the tables, so no number is typed by hand.

Usage: uv run python experiments/paper_numbers.py
"""

import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "paper/generated"
GUARDS = "/Guards.java:"
ANALYZERS = ["static-sign", "static-sign-narrow", "static-interval"]
SHORT = {
    "static-sign": "sign",
    "static-sign-narrow": "sign-narrow",
    "static-interval": "interval",
}
STRATEGIES = {
    "random": "Random",
    "syntax": "Syntax",
    "guided": "Guided",
    "guided-strict": "GuidedStrict",
    "settled": "Settled",
}
BUDGET = {"50%": "Half", "25%": "Quarter"}
SUBSET = {"all": "", "without Guards": "NoGuards"}
OUTCOME = {
    "ok": "ok",
    "divide by zero": "DZ",
    "assertion error": "AE",
    "out of bounds": "OB",
    "null pointer": "NP",
    "*": "$\\ast$",
}
TOTAL = "all analyzers"


def load(path: str) -> dict:
    return json.loads((ROOT / path).read_text())


def tex(s: str) -> str:
    for a, b in [
        ("\\", "\\textbackslash{}"),
        ("&", "\\&"),
        ("%", "\\%"),
        ("_", "\\_"),
        ("{", "\\{"),
        ("}", "\\}"),
        ("#", "\\#"),
    ]:
        s = s.replace(a, b)
    return s


def pval(p: float | None) -> str:
    if p is None:
        return "--"
    return "$<0.001$" if p < 0.001 else f"{p:.3f}"


def ptext(p: float | None) -> str:
    """For running text: "$p=0.002$", "$p<0.001$", or no test."""
    if p is None:
        return "no test (identical samples)"
    return "$p<0.001$" if p < 0.001 else f"$p={p:.3f}$"


def oset(xs) -> str:
    order = list(OUTCOME)
    xs = sorted(xs, key=order.index)
    return "\\{" + ", ".join(OUTCOME[x] for x in xs) + "\\}"


def strict_candidates(sites: list[dict], export: dict) -> set[str]:
    """As `metamorphic.selection.strict_candidates`."""
    risky = {
        mid
        for mid, m in export["methods"].items()
        if any(x["uncertain"] and x["kind"] in ("divisor", "array") for x in m["sites"])
    }
    return {s["id"] for s in sites if s["uncertain"] and s["method"] in risky}


def main() -> None:
    export = load("project/step3/static-interval-states.json")
    sites = load("project/step4/sites.json")["sites"]
    selections = load("project/step5/selections.json")
    validation = load("project/step6/validation.json")["variants"]
    mutants = load("project/step6/mutants.json")["variants"]
    outcomes = load("experiments/results/outcomes.json")
    stats = load("experiments/results/stats.json")
    cost_file = ROOT / "experiments/results/cost.json"
    cost = json.loads(cost_file.read_text()) if cost_file.exists() else None
    cases = [
        line.split()[0]
        for line in (ROOT / "target/stats/cases.txt").read_text().splitlines()
        if line.strip()
    ]

    n: dict[str, object] = {}
    methods = set(export["methods"])
    guards = {m for m in methods if ".Guards." in m}
    n["NumMethods"] = len(methods)
    n["NumMethodsOrig"] = len(methods - guards)
    n["NumGuardsMethods"] = len(guards)
    n["NumCases"] = len(cases)
    n["NumGuardsCases"] = sum(".Guards." in c for c in cases)

    # sites (step 4) and candidates (D14, D15)
    n["NumSites"] = len(sites)
    n["NumSitesNoGuards"] = sum(GUARDS not in s["id"] for s in sites)
    n["NumSiteMethods"] = len({s["method"] for s in sites})
    n["NumUncertain"] = sum(s["uncertain"] for s in sites)
    n["NumNoState"] = sum(not s["joined"] for s in sites)
    n["NumSettled"] = sum(s["joined"] and not s["uncertain"] for s in sites)
    strict = strict_candidates(sites, export)
    n["NumStrict"] = len(strict)
    n["NumStrictMethods"] = len({s["method"] for s in sites if s["id"] in strict})
    for rule, name in [
        ("R1-invert", "Invert"),
        ("R2-swap", "Swap"),
        ("R2-strict", "Strict"),
        ("R2-split", "Split"),
    ]:
        n[f"NumRule{name}"] = sum(s["rule"] == rule for s in sites)
    n["UncertainPercent"] = round(100 * n["NumUncertain"] / n["NumSites"])

    # validation (step 6, D16)
    n["NumCompile"] = sum(v["compiles"] for v in validation)
    n["NumValid"] = sum(v["valid"] for v in validation)
    n["InputsMin"] = min(v["inputs"] for v in validation)
    n["InputsMax"] = max(v["inputs"] for v in validation)
    for value, name in [("both", "Both"), ("one", "One"), ("unknown", "Unknown")]:
        n[f"NumCond{name}"] = sum(v["condition_values"] == value for v in validation)
    n["NumOneInput"] = len({v["method"] for v in validation if v["inputs"] == 1})
    n["NumMutants"] = len(mutants)
    n["NumMutantsEquivalent"] = sum(m.get("equivalent", False) for m in mutants)
    n["NumMutantsNonEquivalent"] = n["NumMutants"] - n["NumMutantsEquivalent"]
    n["NumMutantsKilled"] = sum(not m["valid"] for m in mutants)
    n["NumMutantsSurvived"] = sum(
        m["valid"] and not m.get("equivalent", False) for m in mutants
    )

    # precision of the analyzers on the original methods (Background)
    orig = outcomes["originals"]
    for label, keep in [("", lambda m: True), ("Orig", lambda m: m not in guards)]:
        ms = [m for m in orig if keep(m)]
        sn = [set(orig[m]["static-sign-narrow"]["outcomes"]) for m in ms]
        iv = [set(orig[m]["static-interval"]["outcomes"]) for m in ms]
        n[f"NumNarrowBeatsInterval{label}"] = sum(a < b for a, b in zip(sn, iv))
        n[f"NumIntervalBeatsNarrow{label}"] = sum(b < a for a, b in zip(sn, iv))
        n[f"NumNarrowIntervalIncomparable{label}"] = sum(
            a != b and not a < b and not b < a for a, b in zip(sn, iv)
        )

    # RQ1
    n["NumSeeds"] = len(stats["seeds"])
    inconsistent = [
        (v, a)
        for v in outcomes["variants"]
        for a in ANALYZERS
        if v["analyses"][a]["outcomes"] != orig[v["method"]][a]["outcomes"]
    ]
    n["NumInconsistentVariants"] = len({v["id"] for v, _ in inconsistent})
    n["NumInconsistentPairs"] = len(inconsistent)
    for subset, sfx in SUBSET.items():
        res = stats["subsets"][subset]
        n[f"Eligible{sfx}"] = res["eligible"]
        n[f"Pool{sfx}"] = res["pool"][TOTAL]
        for a in ANALYZERS:
            key = "".join(w.capitalize() for w in SHORT[a].split("-"))
            n[f"Pool{key}{sfx}"] = res["pool"][a]
        for budget, b in BUDGET.items():
            r = res[budget]
            n[f"Budget{b}{sfx}"] = r["N"]
            for s, S in STRATEGIES.items():
                n[f"Mean{S}{b}{sfx}"] = f"{r['means'][s][TOTAL]['mean']:.1f}"
            for t in r["tests"]:
                if t["analyzer"] != TOTAL:
                    continue
                k = f"{STRATEGIES[t['strategy']]}{STRATEGIES[t['baseline']]}{b}{sfx}"
                n[f"P{k}"] = ptext(t["p"])
                n[f"A{k}"] = f"{t['A12']:.2f}"

    n["NumDiscarded"] = sum(not v["valid"] for v in validation)
    n["NumBytecodeIdentical"] = sum(v["bytecode_identical"] for v in validation)
    by_site = {s["id"]: s for s in sites}
    pool_tuples = {
        (
            a,
            v["method"],
            v["rule"],
            tuple(orig[v["method"]][a]["outcomes"]),
            tuple(v["analyses"][a]["outcomes"]),
        )
        for v, a in inconsistent
    }
    for rule, name in [
        ("R1-invert", "Invert"),
        ("R2-swap", "Swap"),
        ("R2-strict", "Strict"),
        ("R2-split", "Split"),
    ]:
        n[f"PoolRule{name}"] = sum(t[2] == rule for t in pool_tuples)
    inc_sites = {v["id"]: v for v, _ in inconsistent}
    n["NumInconsistentSitesSettled"] = sum(
        v["joined"] and not v["uncertain"] for v in inc_sites.values()
    )
    n["NumInconsistentSitesUncertain"] = sum(v["uncertain"] for v in inc_sites.values())
    from_uncertain = {
        (
            a,
            v["method"],
            v["rule"],
            tuple(orig[v["method"]][a]["outcomes"]),
            tuple(v["analyses"][a]["outcomes"]),
        )
        for v, a in inconsistent
        if v["uncertain"]
    }
    n["PoolFromSettledOnly"] = len(pool_tuples - from_uncertain)

    # R2-strict sites whose literal changes to or from 0 (the sign domain
    # abstracts 0 exactly and +-1 to a sign): the mechanism of the findings
    def changed_literal(site: dict) -> tuple[int, int] | None:
        a = re.findall(r"-?\d+", site["original"])
        b = re.findall(r"-?\d+", site["rewritten"])
        d = [(int(x), int(y)) for x, y in zip(a, b, strict=False) if x != y]
        return d[0] if len(a) == len(b) and len(d) == 1 else None

    zero = {
        s["id"]
        for s in sites
        if s["rule"] == "R2-strict" and 0 in (changed_literal(s) or ())
    }
    n["NumStrictCrossZero"] = len(zero)
    n["NumStrictCrossZeroSettled"] = sum(
        by_site[i]["joined"] and not by_site[i]["uncertain"] for i in zero
    )
    n["NumInconsistentSitesCrossZero"] = len(zero & set(inc_sites))
    assert len(zero & set(inc_sites)) == len(inc_sites)  # the claim in Sec. 6.6

    # multiple comparisons over the planned (not post-hoc) tests on the total
    planned = [
        t
        for sub in stats["subsets"].values()
        for b in BUDGET
        for t in sub[b]["tests"]
        if t["pre_registered"] and t["analyzer"] == TOTAL and t["p"] is not None
    ]
    n["NumPlannedTests"] = len(planned)
    n["NumPlannedNoTest"] = sum(
        1
        for sub in stats["subsets"].values()
        for b in BUDGET
        for t in sub[b]["tests"]
        if t["pre_registered"] and t["analyzer"] == TOTAL and t["p"] is None
    )
    worst = max(t["p"] for t in planned)
    assert worst * len(planned) < 0.05  # Bonferroni claim in Sec. 6.3
    n["MaxPlannedP"] = f"{worst:.3f}"
    n["BonferroniAlpha"] = f"{0.05 / len(planned):.4f}"

    # RQ2
    if cost:
        m = cost.get("machine")
        if m:
            java = re.search(r'"([^"]+)"', m["java"])
            java = f"OpenJDK {java.group(1)}" if java else m["java"]
            n["Machine"] = tex(
                f"{m['cpu']} ({m['cores']} threads), {m['os']}, "
                f"Python {m['python']}, {java}"
            )
        n["CostTotal"] = f"{sum(cost['seconds'].values()):.1f}"
        for stage, sec in cost["seconds"].items():
            key = {
                "export": "Export",
                "site": "Sites",
                "selection": "Selection",
                "validation": "Validation",
                "analysis": "Analysis",
            }[stage.split()[0]]
            n[f"Cost{key}"] = f"{sec:.1f}"

    # Worked example (Sec. 3): Guards.assertDerivedRange
    ex = "jpamb.cases.Guards.assertDerivedRange:(II)V"
    branches = [x for x in export["methods"][ex]["sites"] if x["kind"] == "branch"]

    def interval(op: dict) -> str:
        lo = "-\\infty" if op["min"] is None else str(op["min"])
        hi = "\\infty" if op["max"] is None else str(op["max"])
        return f"[{lo},{hi}]"

    # the conditions x >= 0 (line 138) and y > 0 (line 139, after the
    # $assertionsDisabled check, whose operands are [0,0])
    cond_x = next(x for x in branches if x["line"] == 138 and x["origins"][0] == 0)
    cond_y = next(x for x in branches if x["line"] == 139 and x["origins"][0] == 1)
    assert cond_x["uncertain"] and not cond_y["uncertain"]
    n["OverviewStateX"] = interval(cond_x["operands"][0])
    n["OverviewStateY"] = interval(cond_y["operands"][0])
    ex_variants = [v for v in outcomes["variants"] if v["method"] == ex]
    n["OverviewNumSites"] = len(ex_variants)
    ex_valid = [v for v in validation if v["method"] == ex]
    assert all(v["valid"] and v["condition_values"] == "both" for v in ex_valid)
    for v in ex_variants:
        for a in ANALYZERS:
            changed = v["analyses"][a]["outcomes"] != orig[ex][a]["outcomes"]
            expect = a == "static-sign-narrow" and v["rule"] == "R2-strict"
            assert changed == expect, (v["id"], a)  # what Sec. 3 states
    rows = [
        "% Generated by experiments/paper_numbers.py -- do not edit by hand.",
        "\\begin{tabular}{@{}lllll@{}}",
        "\\toprule",
        "Version & Guide & "
        + " & ".join(f"\\texttt{{{SHORT[a]}}}" for a in ANALYZERS)
        + " \\\\",
        "\\midrule",
        "original & & "
        + " & ".join(oset(orig[ex][a]["outcomes"]) for a in ANALYZERS)
        + " \\\\",
    ]
    for v in sorted(ex_variants, key=lambda v: (by_site[v["id"]]["line"], v["rule"])):
        site = by_site[v["id"]]
        if v["rule"] == "R1-invert":
            what = f"R1-invert: the \\texttt{{if}} on line {site['line']}"
        else:
            what = (
                f"{v['rule']}: \\texttt{{{tex(site['original'])}}} $\\to$ "
                f"\\texttt{{{tex(site['rewritten'])}}}"
            )
        guide = "uncertain" if site["uncertain"] else "settled"
        cells = []
        for a in ANALYZERS:
            o = v["analyses"][a]["outcomes"]
            c = oset(o)
            cells.append(f"\\textbf{{{c}}}" if o != orig[ex][a]["outcomes"] else c)
        rows.append(" & ".join([what, guide, *cells]) + " \\\\")
    rows += ["\\bottomrule", "\\end{tabular}"]
    OUT.mkdir(parents=True, exist_ok=True)
    (OUT / "tab-overview.tex").write_text("\n".join(rows) + "\n")

    OUT.mkdir(parents=True, exist_ok=True)
    lines = ["% Generated by experiments/paper_numbers.py -- do not edit by hand."]
    lines += [f"\\newcommand{{\\{k}}}{{{v}}}" for k, v in n.items()]
    (OUT / "numbers.tex").write_text("\n".join(lines) + "\n")

    # Table: RQ1, mean distinct inconsistencies (sd) at the 50% budget
    rows = [
        "% Generated by experiments/paper_numbers.py -- do not edit by hand.",
        "\\begin{tabular}{@{}l" + "r" * (len(ANALYZERS) + 1) + "rr@{}}",
        "\\toprule",
        "Strategy & "
        + " & ".join(f"\\texttt{{{SHORT[a]}}}" for a in ANALYZERS)
        + " & total & $p$ vs.\\ random & $\\hat{A}_{12}$ \\\\",
    ]
    for subset in SUBSET:
        res = stats["subsets"][subset]
        r = res["50%"]
        rows.append("\\midrule")
        rows.append(
            f"\\multicolumn{{{len(ANALYZERS) + 4}}}{{@{{}}l}}{{\\emph{{"
            f"{'all' if subset == 'all' else 'without Guards'}: "
            f"{res['eligible']} sites, $N={r['N']}$, pool "
            f"{res['pool'][TOTAL]}}}}} \\\\"
        )
        tests = {
            t["strategy"]: t
            for t in r["tests"]
            if t["analyzer"] == TOTAL and t["baseline"] == "random"
        }
        for s in STRATEGIES:
            m = r["means"][s]
            cells = [
                f"{m[a]['mean']:.1f} ({m[a]['sd']:.1f})" for a in [*ANALYZERS, TOTAL]
            ]
            t = tests.get(s)
            p = pval(t["p"]) if t else ""
            a12 = f"{t['A12']:.2f}" if t else ""
            name = f"\\texttt{{{s}}}" + ("$^\\dagger$" if s == "settled" else "")
            rows.append(" & ".join([name, *cells, p, a12]) + " \\\\")
    rows += ["\\bottomrule", "\\end{tabular}"]
    (OUT / "tab-rq1.tex").write_text("\n".join(rows) + "\n")

    # Table: the inconsistent variants (case study)
    by_id = {s["id"]: s for s in sites}
    rows = [
        "% Generated by experiments/paper_numbers.py -- do not edit by hand.",
        "\\begin{tabular}{@{}lllll@{}}",
        "\\toprule",
        "Site & Rewrite & Guide & Analyzers & Original $\\to$ variant \\\\",
        "\\midrule",
    ]
    seen: dict[str, list[str]] = {}
    for v, a in inconsistent:
        seen.setdefault(v["id"], []).append(a)
    for vid, ans in seen.items():
        v = next(x for x in outcomes["variants"] if x["id"] == vid)
        s = by_id[vid]
        cls = s["source"].rsplit("/", 1)[-1].removesuffix(".java")
        guide = (
            "uncertain"
            if s["uncertain"]
            else ("settled" if s["joined"] else "no state")
        )
        o = orig[v["method"]][ans[0]]["outcomes"]
        w = v["analyses"][ans[0]]["outcomes"]
        assert all(orig[v["method"]][a]["outcomes"] == o for a in ans)
        assert all(v["analyses"][a]["outcomes"] == w for a in ans)
        rows.append(
            f"\\texttt{{{cls}:{s['line']}}} & \\texttt{{{tex(s['original'])}}} $\\to$ "
            f"\\texttt{{{tex(s['rewritten'])}}} & {guide} & "
            + ", ".join(f"\\texttt{{{SHORT[a]}}}" for a in ans)
            + f" & {oset(o)} $\\to$ {oset(w)} \\\\"
        )
    rows += ["\\bottomrule", "\\end{tabular}"]
    (OUT / "tab-inconsistencies.tex").write_text("\n".join(rows) + "\n")

    print(
        f"{len(n)} macros; tables: "
        + ", ".join(p.name for p in sorted(OUT.glob("tab-*.tex")))
    )
    assert selections["eligible"] == n["NumSites"]


if __name__ == "__main__":
    main()
