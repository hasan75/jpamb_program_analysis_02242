"""Step 8: analyze every original method and every valid variant with the three
analyzers under test (D7), and record the outcome sets.

An outcome set depends only on the (analyzer, method version) pair, not on the
strategy or seed, so each pair is analyzed once here; `stats.py` then replays
the step 5 orders against these results.

Usage (the analyzers live in the `static` package):
    solutions/static/.venv/bin/python experiments/run.py \
        [--only TEXT] [-o experiments/results/outcomes.json]
"""

import argparse
import contextlib
import json
import os
import re
import sys
import time
from collections import Counter
from dataclasses import dataclass
from pathlib import Path

from static import ANALYZERS, predict

import jpamb
from jpamb import jvm
from jpamb.utils import Effect

ROOT = Path(__file__).resolve().parents[1]
SITES = ROOT / "project/step4/sites.json"
VALIDATION = ROOT / "project/step6/validation.json"
VARIANTS = ROOT / "build/variants"


def vid(site_id: str) -> str:
    """Folder name of a variant (same as `metamorphic.validate.vid`)."""
    return re.sub(r"[^A-Za-z0-9]+", "_", site_id).strip("_")


@dataclass(frozen=True)
class VariantSuite(jpamb.Suite):
    """The benchmark, with the decompiled classes of one variant."""

    variant: Path = Path()

    @property
    def decompiled_folder(self) -> Path:
        return self.variant / "decompiled"


def analyze(suite: jpamb.Suite, method: str) -> dict[str, dict]:
    """Outcome set and analysis time of every analyzer on one method version."""
    out = {}
    for name, (narrow, domain) in ANALYZERS.items():
        bc = jpamb.Bytecode(suite, Effect(None), {})
        start = time.perf_counter()
        # the analyzers trace every step to stderr
        with open(os.devnull, "w") as null, contextlib.redirect_stderr(null):
            outcomes = predict(bc, jvm.AbsMethodID.decode(method), narrow, domain)
        out[name] = {
            "outcomes": sorted(outcomes),
            "seconds": time.perf_counter() - start,
        }
    return out


def distinct(variants: list[dict], originals: dict) -> set[tuple]:
    """The D10 tuples (analyzer, method, rule, original set, variant set)."""
    return {
        (
            a,
            v["method"],
            v["rule"],
            tuple(originals[v["method"]][a]["outcomes"]),
            tuple(r["outcomes"]),
        )
        for v in variants
        for a, r in v["analyses"].items()
        if r["outcomes"] != originals[v["method"]][a]["outcomes"]
    }


def summary(data: dict) -> str:
    vs, orig = data["variants"], data["originals"]
    pool = distinct(vs, orig)
    secs = sum(r["seconds"] for v in vs for r in v["analyses"].values())
    secs += sum(r["seconds"] for m in orig.values() for r in m.values())
    out = [
        f"original methods analyzed: {len(orig)}",
        f"valid variants analyzed: {len(vs)} (skipped, not valid: {data['skipped']})",
        f"analysis time, all analyzers: {secs:.1f} s",
        f"distinct inconsistencies (D10), all sites rewritten: {len(pool)}",
    ]
    for a in ANALYZERS:
        n_var = sum(
            v["analyses"][a]["outcomes"] != orig[v["method"]][a]["outcomes"] for v in vs
        )
        n_pool = sum(t[0] == a for t in pool)
        out.append(f"  {a}: {n_pool} distinct, from {n_var} variants")
    out.append(f"  by rule: {dict(sorted(Counter(t[2] for t in pool).items()))}")
    out.append("inconsistent variants:")
    for v in vs:
        for a, r in v["analyses"].items():
            o = orig[v["method"]][a]["outcomes"]
            if r["outcomes"] != o:
                guide = (
                    "uncertain"
                    if v["uncertain"]
                    else ("settled" if v["joined"] else "no state")
                )
                out.append(f"  {a:18} {v['id']:45} {guide:9} {o} -> {r['outcomes']}")
    return "\n".join(out)


def main() -> None:
    p = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    p.add_argument("--only", default="", help="only methods containing this text")
    p.add_argument(
        "-o", "--output", type=Path, default=ROOT / "experiments/results/outcomes.json"
    )
    p.add_argument(
        "--variants",
        type=Path,
        default=VARIANTS,
        help="variant folders of metamorphic-validate",
    )
    args = p.parse_args()

    sites = {s["id"]: s for s in json.loads(SITES.read_text())["sites"]}
    checked = json.loads(VALIDATION.read_text())["variants"]
    valid = [v for v in checked if v["valid"] and args.only in v["method"]]
    skipped = sum(not v["valid"] for v in checked if args.only in v["method"])

    original = jpamb.Suite.from_workdir(ROOT)
    methods = sorted(
        {
            line.split()[0]
            for line in (ROOT / "target/stats/cases.txt").read_text().splitlines()
            if line.strip() and args.only in line.split()[0]
        }
    )
    originals = {m: analyze(original, m) for m in methods}

    variants = []
    for v in valid:
        folder = args.variants / vid(v["id"])
        if not (folder / "decompiled").is_dir():
            sys.exit(f"missing {folder}/decompiled: rerun metamorphic-validate")
        s = sites[v["id"]]
        variants.append(
            {
                "id": v["id"],
                "method": v["method"],
                "rule": v["rule"],
                "uncertain": s["uncertain"],
                "joined": s["joined"],
                "analyses": analyze(VariantSuite(ROOT, folder), v["method"]),
            }
        )

    data = {
        "sites": str(SITES.relative_to(ROOT)),
        "validation": str(VALIDATION.relative_to(ROOT)),
        "only": args.only,
        "skipped": skipped,
        "originals": originals,
        "variants": variants,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(data, indent=1) + "\n")
    print(summary(data))


if __name__ == "__main__":
    main()
