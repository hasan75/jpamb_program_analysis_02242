import subprocess
from itertools import product
from pathlib import Path

import jpamb
from jpamb.utils import DockerRunner, Effect

from abstractions import Interval

# Java integer limits (32-bit signed integers).
INT_MIN = -(1 << 31)
INT_MAX = (1 << 31) - 1


def representative_values(interval: Interval) -> tuple[int, ...]:
    """Generate representative Java int values within an interval."""

    if interval.is_bottom():
        return ()

    lower = INT_MIN if interval.min is None else max(interval.min, INT_MIN)
    upper = INT_MAX if interval.max is None else min(interval.max, INT_MAX)

    if lower > upper:
        return ()

    # Include interval boundaries, nearby values, midpoint and values around zero.
    candidates = {
        lower,
        upper,
        lower + 1,
        upper - 1,
        (lower + upper) // 2,
        -1,
        0,
        1,
    }

    return tuple(sorted(
        value
        for value in candidates
        if lower <= value <= upper
    ))


def synthesize_integer_inputs(
    intervals: tuple[Interval, ...],
) -> tuple[jpamb.case.Input, ...]:
    """Generate concrete inputs from abstract integer parameter intervals."""

    if any(interval.is_bottom() for interval in intervals):
        return ()

    values_per_parameter = [
        representative_values(interval)
        for interval in intervals
    ]

    # Generate all combinations of representative parameter values.
    combinations = product(*values_per_parameter)

    return tuple(
        jpamb.case.Input(
            tuple(jpamb.case.Int(value) for value in combination)
        )
        for combination in combinations
    )


def execute_input(
    docker: DockerRunner,
    workdir: Path,
    classfiles_folder: Path,
    methodid: jpamb.jvm.AbsMethodID,
    test_input: jpamb.case.Input,
    eff: Effect,
) -> str:
    """Execute a concrete input for a Java method."""

    folder = classfiles_folder

    try:
        result = docker.run(
            [
                "java",
                "-cp",
                folder.relative_to(workdir).as_posix(),
                "-ea",
                "jpamb.Runtime",
                methodid.encode(),
                test_input.encode(),
            ],
            timeout=5,
            eff=eff,
        )
    except subprocess.TimeoutExpired:
        # Use a special marker to identify executions that exceed the timeout.
        return "*"

    return result.strip()


def check_rewrite_equivalence(
    docker: DockerRunner,
    workdir: Path,
    original_folder: Path,
    rewritten_folder: Path,
    methodid: jpamb.jvm.AbsMethodID,
    inputs: tuple[jpamb.case.Input, ...],
    eff: Effect,
) -> bool:
    """Check whether a rewritten method preserves the original behavior."""

    if not inputs:
        return False

    for test_input in inputs:
        original_result = execute_input(
            docker, workdir, original_folder, methodid, test_input, eff
        )

        rewritten_result = execute_input(
            docker, workdir, rewritten_folder, methodid, test_input, eff
        )

        # Reject the rewrite if execution results differ or time out.
        if original_result != rewritten_result or original_result == "*":
            return False

    return True