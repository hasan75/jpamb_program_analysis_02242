import subprocess
from itertools import product
from pathlib import Path

import jpamb
from jpamb import jvm
from jpamb.utils import DockerRunner, Effect
from jvm.state import PC

from abstractions import Interval
from static import run_analysis

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

def filter_values_by_condition(
    values: tuple[int, ...],
    condition: str,
) -> tuple[int, ...]:
    """Filter representative values according to a branch condition."""

    conditions = {
        "eq": lambda value: value == 0,
        "ne": lambda value: value != 0,
        "lt": lambda value: value < 0,
        "le": lambda value: value <= 0,
        "gt": lambda value: value > 0,
        "ge": lambda value: value >= 0,
    }

    if condition not in conditions:
        raise ValueError(f"Unsupported condition: {condition}")

    return tuple(
        value for value in values if conditions[condition](value)
    )

def branch_condition(
    condition: jvm.CmpOpr,
    branch_taken: bool,
) -> str:
    """Return the effective condition for a branch outcome."""

    conditions = {
        jvm.CmpOpr.Eq: "eq",
        jvm.CmpOpr.Ne: "ne",
        jvm.CmpOpr.Lt: "lt",
        jvm.CmpOpr.Le: "le",
        jvm.CmpOpr.Gt: "gt",
        jvm.CmpOpr.Ge: "ge",
    }

    inverse_conditions = {
        "eq": "ne",
        "ne": "eq",
        "lt": "ge",
        "le": "gt",
        "gt": "le",
        "ge": "lt",
    }

    if condition not in conditions:
        raise ValueError(f"Unsupported condition: {condition}")

    result = conditions[condition]

    return result if branch_taken else inverse_conditions[result]

def get_ifz_branch_conditions(
    bc: jpamb.Bytecode,
    pc: PC,
) -> tuple[int, str, PC, str] | None:
    """Get the local variable and conditions of an Ifz instruction."""

    instruction = bc[pc]

    if not isinstance(instruction, jvm.Ifz):
        return None

    previous = bc[pc + (-1)]

    if not isinstance(previous, jvm.Load):
        return None

    true_condition = branch_condition(instruction.condition, True)
    false_condition = branch_condition(instruction.condition, False)

    return (
        previous.index,
        true_condition,
        pc % instruction.target,
        false_condition,
    )

def representative_values_for_condition(
    interval: Interval,
    condition: str,
) -> tuple[int, ...]:
    """Generate representative values satisfying an interval and condition."""

    values = representative_values(interval)

    return filter_values_by_condition(values, condition)

def synthesize_ifz_branch_inputs(
    intervals: tuple[Interval, ...],
    local_index: int,
    condition: str,
) -> tuple[jpamb.case.Input, ...]:
    """Generate concrete inputs satisfying a specific Ifz branch."""

    if any(interval.is_bottom() for interval in intervals):
        return ()

    if not 0 <= local_index < len(intervals):
        raise IndexError(f"Invalid local variable index: {local_index}")

    values_per_parameter = [
        representative_values(interval)
        for interval in intervals
    ]

    values_per_parameter[local_index] = representative_values_for_condition(
        intervals[local_index],
        condition,
    )

    if not values_per_parameter[local_index]:
        return ()

    combinations = product(*values_per_parameter)

    return tuple(
        jpamb.case.Input(
            tuple(jpamb.case.Int(value) for value in combination)
        )
        for combination in combinations
    )

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

    # Compare both implementations using the same concrete inputs.
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

def is_parameter_unmodified(
    method: jvm.Method,
    parameter_index: int,
    pc: PC,
) -> bool:
    """Check whether a parameter is not modified before a given PC."""

    # Reject parameters modified before the branch.
    for instruction in method.opcodes:
        if instruction.offset >= pc.offset:
            break

        match instruction:
            case jvm.Store(index=index) | jvm.Incr(index=index):
                if index == parameter_index:
                    return False

    return True

def synthesize_inputs_for_ifz(
    bc: jpamb.Bytecode,
    methodid: jvm.AbsMethodID,
    pc: PC,
) -> tuple[
    tuple[jpamb.case.Input, ...],
    tuple[jpamb.case.Input, ...],
]:
    """Synthesize inputs for both branches of an Ifz instruction."""

    branch_info = get_ifz_branch_conditions(bc, pc)

    if branch_info is None:
        return (), ()

    local_index, true_condition, _, false_condition = branch_info

    # Only support integer parameters to ensure correct local-to-parameter mapping.
    if not all(
        isinstance(param, jvm.Int)
        for param in methodid.extension.params
    ):
        return (), ()

    # Use interval analysis to obtain the abstract state at the branch.
    ai, _ = run_analysis(bc, methodid, abstraction=Interval)

    # Do not synthesize inputs from an incomplete analysis.
    if ai.worklist:
        return (), ()

    state = ai.states.get(pc)

    method = bc.getmethod(methodid)

    if (
        state is None
        or local_index >= len(methodid.extension.params)
        or not is_parameter_unmodified(method, local_index, pc)
    ):
        return (), ()

    intervals = tuple(
        local
        for local in state.locals[:len(methodid.extension.params)]
    )

    true_inputs = synthesize_ifz_branch_inputs(
        intervals,
        local_index,
        true_condition,
    )

    false_inputs = synthesize_ifz_branch_inputs(
        intervals,
        local_index,
        false_condition,
    )

    return true_inputs, false_inputs