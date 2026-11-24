
#!/usr/bin/env python3
"""Run automated experiments comparing rewrite-site selection strategies."""

import argparse
import csv
import json
import re
import subprocess
import time
from pathlib import Path


PROJECT_DIR = Path(__file__).resolve().parents[1]
REPOSITORY_ROOT = PROJECT_DIR.parents[1]

DEFAULT_METHODS = [
    "jpamb.cases.Dependent.normalizedDistance:(II)I",
    "jpamb.cases.Dependent.badNormalizedDistance:(II)I",
]

STRATEGIES = [
    "analysis-guided",
    "syntax-based",
    "random",
]

CSV_FIELDS = [
    "method",
    "strategy",
    "seed",
    "budget",
    "status",
    "variant_count",
    "validated_variant_count",
    "concrete_equivalent",
    "concrete_not_equivalent",
    "concrete_inconclusive",
    "interval_different",
    "signset_different",
    "abstract_inconsistency_count",
    "abstract_incomplete_variants",
    "time_to_first_inconsistency",
    "validation_seconds",
    "wall_time_seconds",
]


def safe_filename(value):
    return re.sub(r"[^A-Za-z0-9_.-]+", "_", value)


def experiment_key(row):
    """Identify an experiment independently of its CSV position."""
    return (
        row.get("method", ""),
        row.get("strategy", ""),
        str(row.get("seed", "")),
        str(row.get("budget", "")),
    )


def load_existing_results(csv_path):
    """Load previous experiment results."""
    if not csv_path.exists():
        return []

    with csv_path.open("r", newline="", encoding="utf-8") as file:
        return list(csv.DictReader(file))


def save_results(csv_path, rows):
    """Persist all results collected so far."""
    with csv_path.open("w", newline="", encoding="utf-8") as file:
        writer = csv.DictWriter(
            file,
            fieldnames=CSV_FIELDS,
            extrasaction="ignore",
        )
        writer.writeheader()
        writer.writerows(rows)


def update_result(rows, new_row):
    """Insert or replace an experiment result."""
    key = experiment_key(new_row)

    for index, row in enumerate(rows):
        if experiment_key(row) == key:
            rows[index] = new_row
            return

    rows.append(new_row)


def summarize_results(data):
    results = data.get("results", {})
    values = list(results.values())

    concrete_equivalent = sum(
        result.get("concrete_equivalent") is True
        for result in values
    )

    concrete_not_equivalent = sum(
        result.get("concrete_equivalent") is False
        for result in values
    )

    concrete_inconclusive = sum(
        result.get("concrete_equivalent") is None
        for result in values
    )

    interval_different = 0
    signset_different = 0
    abstract_inconsistency_count = 0
    abstract_incomplete_variants = 0
    time_to_first_inconsistency = None

    for result in values:
        comparisons = result.get("abstract", {})

        if result.get("abstract_inconsistency"):
            abstract_inconsistency_count += 1

            if time_to_first_inconsistency is None:
                time_to_first_inconsistency = (
                    result.get("time_to_first_inconsistency")
                    or result.get("cumulative_seconds")
                )

        if any(
            not comparison.get("complete", False)
            for comparison in comparisons.values()
        ):
            abstract_incomplete_variants += 1

        interval = comparisons.get("Interval", {})
        signset = comparisons.get("SignSet", {})

        if interval.get("complete") and interval.get("equivalent") is False:
            interval_different += 1

        if signset.get("complete") and signset.get("equivalent") is False:
            signset_different += 1

    validation_seconds = max(
        (
            result.get("cumulative_seconds", 0)
            for result in values
        ),
        default=0,
    )

    return {
        "variant_count": data.get("variant_count", len(values)),
        "validated_variant_count": len(values),
        "concrete_equivalent": concrete_equivalent,
        "concrete_not_equivalent": concrete_not_equivalent,
        "concrete_inconclusive": concrete_inconclusive,
        "interval_different": interval_different,
        "signset_different": signset_different,
        "abstract_inconsistency_count": abstract_inconsistency_count,
        "abstract_incomplete_variants": abstract_incomplete_variants,
        "time_to_first_inconsistency": time_to_first_inconsistency,
        "validation_seconds": validation_seconds,
    }


def run_experiment(method, strategy, seed, budget, output_dir):
    method_name = method.rsplit(".", 1)[-1].split(":")[0]
    seed_label = str(seed) if strategy == "random" else "deterministic"

    experiment_name = (
        f"{safe_filename(method_name)}_"
        f"{strategy}_{seed_label}_"
        f"budget_{budget}"
    )

    json_path = output_dir / "json" / f"{experiment_name}.json"
    log_path = output_dir / "logs" / f"{experiment_name}.log"

    json_path.parent.mkdir(parents=True, exist_ok=True)
    log_path.parent.mkdir(parents=True, exist_ok=True)

    command = [
        "uv",
        "run",
        "--project",
        str(PROJECT_DIR),
        "python",
        "-m",
        "syntactic_treesitter",
        "--strategy",
        strategy,
        "--budget",
        str(budget),
        "--seed",
        str(seed),
        "--results-json",
        str(json_path),
        method,
    ]

    print(f"\n[{strategy}] {method} (seed={seed})", flush=True)

    # Avoid accidentally reading results from an older execution.
    json_path.unlink(missing_ok=True)

    start = time.perf_counter()

    try:
        process = subprocess.run(
            command,
            cwd=REPOSITORY_ROOT,
            capture_output=True,
            text=True,
            encoding="utf-8",
            errors="replace",
            check=False,
        )

        wall_time = time.perf_counter() - start

        log_path.write_text(
            process.stdout + "\n" + process.stderr,
            encoding="utf-8",
        )

        if process.returncode != 0:
            print(f"  FAILED (exit code {process.returncode})")
            print(f"  Log: {log_path}")

            return {
                "method": method,
                "strategy": strategy,
                "seed": seed if strategy == "random" else "",
                "budget": budget,
                "status": f"failed ({process.returncode})",
                "wall_time_seconds": round(wall_time, 3),
            }

        if not json_path.exists():
            print("  FAILED (JSON results file was not created)")

            return {
                "method": method,
                "strategy": strategy,
                "seed": seed if strategy == "random" else "",
                "budget": budget,
                "status": "missing JSON",
                "wall_time_seconds": round(wall_time, 3),
            }

        with json_path.open("r", encoding="utf-8") as file:
            data = json.load(file)

        metrics = summarize_results(data)

        row = {
            "method": method,
            "strategy": strategy,
            "seed": seed if strategy == "random" else "",
            "budget": budget,
            "status": "success",
            **metrics,
            "validation_seconds": round(
                metrics["validation_seconds"], 3
            ),
            "wall_time_seconds": round(wall_time, 3),
        }

        print(
            f"  Variants: {row['variant_count']} | "
            f"Equivalent: {row['concrete_equivalent']} | "
            f"Inconsistent: {row['abstract_inconsistency_count']} | "
            f"Wall time: {row['wall_time_seconds']}s"
        )

        return row

    except OSError as error:
        wall_time = time.perf_counter() - start

        print(f"  FAILED: {error}")

        return {
            "method": method,
            "strategy": strategy,
            "seed": seed if strategy == "random" else "",
            "budget": budget,
            "status": f"execution error: {error}",
            "wall_time_seconds": round(wall_time, 3),
        }


def main():
    parser = argparse.ArgumentParser(
        description="Compare rewrite-site selection strategies."
    )

    parser.add_argument(
        "--methods",
        nargs="+",
        default=DEFAULT_METHODS,
        help="JPAMB method identifiers to evaluate",
    )

    parser.add_argument(
        "--seeds",
        nargs="+",
        type=int,
        default=list(range(10)),
        help="Seeds used by the random strategy",
    )

    parser.add_argument(
        "--budget",
        type=int,
        default=10,
        help="Maximum number of rewrite variants per experiment",
    )

    parser.add_argument(
        "--output-dir",
        type=Path,
        default=PROJECT_DIR / "evaluation_runs",
    )

    parser.add_argument(
        "--restart",
        action="store_true",
        help="Ignore previous CSV results and start a new evaluation",
    )

    args = parser.parse_args()

    if args.budget < 0:
        parser.error("--budget must be non-negative")

    if not args.seeds:
        parser.error("At least one random seed is required")

    output_dir = args.output_dir.resolve()
    output_dir.mkdir(parents=True, exist_ok=True)

    csv_path = output_dir / "evaluation_results.csv"

    if args.restart:
        rows = []
    else:
        rows = load_existing_results(csv_path)

    total_runs = len(args.methods) * (
        len(STRATEGIES) - 1 + len(args.seeds)
    )

    def has_json_result(row):
        method_name = row.get("method", "").rsplit(".", 1)[-1].split(":")[0]
        strategy = row.get("strategy", "")

        seed_label = (
            str(row.get("seed", ""))
            if strategy == "random"
            else "deterministic"
        )

        json_path = (
            output_dir
            / "json"
            / f"{safe_filename(method_name)}_{strategy}_{seed_label}_budget_{args.budget}.json"
        )

        return json_path.is_file()

    successful_keys = {
        experiment_key(row)
        for row in rows
        if row.get("status") == "success"
        and row.get("method") in args.methods
        and str(row.get("budget")) == str(args.budget)
        and row.get("strategy") in STRATEGIES
        and (
            row.get("strategy") != "random"
            or str(row.get("seed")) in {
                str(seed) for seed in args.seeds
            }
        )
        and has_json_result(row)
    }

    print("Experimental evaluation")
    print(f"Methods: {len(args.methods)}")
    print(f"Strategies: {', '.join(STRATEGIES)}")
    print(f"Random seeds: {args.seeds}")
    print(f"Variant budget: {args.budget}")
    print(f"Total experiments: {total_runs}")
    print(f"Already completed: {len(successful_keys)}")
    print(f"Remaining: {total_runs - len(successful_keys)}")
    print(f"Output directory: {output_dir}")

    # Save existing results immediately.
    save_results(csv_path, rows)

    interrupted = False

    try:
        for method in args.methods:
            for strategy in STRATEGIES:
                seeds = args.seeds if strategy == "random" else [42]

                for seed in seeds:
                    expected_row = {
                        "method": method,
                        "strategy": strategy,
                        "seed": seed if strategy == "random" else "",
                        "budget": args.budget,
                    }

                    key = experiment_key(expected_row)

                    if key in successful_keys:
                        print(
                            f"\n[SKIP] {strategy} {method} "
                            f"(seed={seed}) - already completed"
                        )
                        continue

                    row = run_experiment(
                        method,
                        strategy,
                        seed,
                        args.budget,
                        output_dir,
                    )

                    update_result(rows, row)
                    save_results(csv_path, rows)

                    if row.get("status") == "success":
                        successful_keys.add(key)

    except KeyboardInterrupt:
        interrupted = True
        print("\n\nEvaluation interrupted by user.")

    successful = sum(
        row.get("status") == "success"
        for row in rows
        if experiment_key(row) in {
            experiment_key({
                "method": method,
                "strategy": strategy,
                "seed": seed if strategy == "random" else "",
                "budget": args.budget,
            })
            for method in args.methods
            for strategy in STRATEGIES
            for seed in (args.seeds if strategy == "random" else [42])
        }
    )

    print("\nEvaluation summary")
    print(f"Successful experiments: {successful}/{total_runs}")
    print(f"Remaining experiments: {total_runs - successful}")
    print(f"CSV results: {csv_path}")
    print(f"Individual JSON files: {output_dir / 'json'}")
    print(f"Execution logs: {output_dir / 'logs'}")

    if interrupted:
        print("Run the same command again to resume the evaluation.")


if __name__ == "__main__":
    main()
