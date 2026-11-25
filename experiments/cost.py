"""Step 8, RQ2: wall-clock cost of each pipeline stage.

Reruns the whole pipeline into a scratch folder (the committed step 3-8
outputs are not touched), timing each program, and checks that the rerun
reproduces the committed results (ignoring timing fields).

Usage: uv run python experiments/cost.py [SCRATCH] [-o experiments/results/cost.json]
SCRATCH defaults to build/cost (gitignored).
Needs Docker for the validation stage.
"""

import argparse
import json
import os
import platform
import subprocess
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
STATIC = ROOT / "solutions/static/.venv/bin"
META = ROOT / "solutions/metamorphic/.venv/bin"


def strip_times(x):
    if isinstance(x, dict):
        return {
            k: strip_times(v)
            for k, v in x.items()
            if k not in ("seconds", "sites", "export", "validation", "outcomes")
            or not isinstance(v, (int, float, str))
        }
    if isinstance(x, list):
        return [strip_times(v) for v in x]
    return x


def timed(cmd: list[str], log: Path) -> float:
    start = time.perf_counter()
    with log.open("w") as fp:
        subprocess.run(cmd, cwd=ROOT, stdout=fp, stderr=subprocess.STDOUT, check=True)
    return time.perf_counter() - start


def machine() -> dict:
    cpu = next(
        (
            line.split(":", 1)[1].strip()
            for line in Path("/proc/cpuinfo").read_text().splitlines()
            if line.startswith("model name")
        ),
        platform.processor(),
    )
    java = subprocess.run(
        [
            "docker",
            "run",
            "--rm",
            "ghcr.io/kalhauge/jvm2json:jdk-latest",
            "java",
            "-version",
        ],
        capture_output=True,
        text=True,
        check=False,
    ).stderr.splitlines()
    return {
        "cpu": cpu,
        "cores": os.cpu_count(),
        "os": f"{platform.system()} {platform.release()}",
        "python": platform.python_version(),
        "java": java[0] if java else "unknown",
    }


def main() -> None:
    p = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    p.add_argument(
        "scratch",
        type=Path,
        nargs="?",
        default=ROOT / "build/cost",
        help="inside the repository (mounted into the container)",
    )
    p.add_argument(
        "-o", "--output", type=Path, default=ROOT / "experiments/results/cost.json"
    )
    args = p.parse_args()
    s = args.scratch.resolve()
    s.mkdir(parents=True, exist_ok=True)
    export, sites, sel, val, out = (
        s / "export.json",
        s / "sites.json",
        s / "selections.json",
        s / "validation.json",
        s / "outcomes.json",
    )
    stages = {
        "export (guide analysis)": [str(STATIC / "static-export"), "-o", str(export)],
        "site finding": [
            str(META / "metamorphic-sites"),
            "-e",
            str(export),
            "-o",
            str(sites),
        ],
        "selection (all strategies, seeds)": [
            str(META / "metamorphic-select"),
            "-s",
            str(sites),
            "-e",
            str(export),
            "-o",
            str(sel),
        ],
        "validation (compile + inputs)": [
            str(META / "metamorphic-validate"),
            "-s",
            str(sites),
            "-e",
            str(export),
            "-o",
            str(val),
            "--build",
            str(s / "variants"),
        ],
        "analysis (3 analyzers, originals + variants)": [
            str(STATIC / "python"),
            "experiments/run.py",
            "-o",
            str(out),
            "--variants",
            str(s / "variants"),
        ],
    }
    seconds = {}
    for name, cmd in stages.items():
        seconds[name] = timed(cmd, s / (cmd[0].rsplit("/", 1)[-1] + ".log"))
        print(f"{name}: {seconds[name]:.1f} s", flush=True)

    committed = {
        "project/step4/sites.json": sites,
        "project/step5/selections.json": sel,
        "project/step6/validation.json": val,
        "experiments/results/outcomes.json": out,
    }
    reproduced = {
        k: strip_times(json.loads((ROOT / k).read_text()))
        == strip_times(json.loads(v.read_text()))
        for k, v in committed.items()
    }
    variants = len(json.loads(val.read_text())["variants"])
    data = {
        "seconds": seconds,
        "variants": variants,
        "reproduced": reproduced,
        "machine": machine(),
    }
    args.output.write_text(json.dumps(data, indent=1) + "\n")
    print(json.dumps(data, indent=1))


if __name__ == "__main__":
    main()
