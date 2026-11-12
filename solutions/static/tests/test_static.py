from pathlib import Path

import jpamb
import pytest
from abstractions import Interval
from jpamb import jvm
from jpamb.utils import Effect
from jvm.state import PC
from static import State, manystep, run_analysis

def make_if_bytecode(condition, second_index=1):
    methodid = jvm.AbsMethodID.decode("Test.method:()V")

    opcodes = [
        jvm.Load(type=jvm.Int(), index=0, offset=0),
        jvm.Load(type=jvm.Int(), index=second_index, offset=1),
        jvm.If(condition=condition, target=4, offset=2),
    ]

    method = jvm.Method(methodid, opcodes, 2)

    bc = jpamb.Bytecode(
        jpamb.Suite(Path.cwd()),
        Effect(None),
        {methodid: method},
    )

    return bc, PC(methodid, 2)


def test_interval_if_lt_refines_both_branches():
    bc, pc = make_if_bytecode(jvm.CmpOpr.Lt)

    state = State(
        locals=(
            Interval(5, 20),
            Interval(10, 15),
        ),
        stack=(
            Interval(5, 20),
            Interval(10, 15),
        ),
    )

    branches = {
        next_pc.offset: refined
        for next_pc, refined in manystep(bc, pc, state, Interval)
    }

    assert branches[4].locals == (
        Interval(5, 14),
        Interval(10, 15),
    )

    assert branches[3].locals == (
        Interval(10, 20),
        Interval(10, 15),
    )

def test_interval_if_eq_refines_true_branch():
    bc, pc = make_if_bytecode(jvm.CmpOpr.Eq)

    state = State(
        locals=(
            Interval(1, 10),
            Interval(5, 15),
        ),
        stack=(
            Interval(1, 10),
            Interval(5, 15),
        ),
    )

    branches = {
        next_pc.offset: refined
        for next_pc, refined in manystep(bc, pc, state, Interval)
    }

    assert branches[4].locals == (
        Interval(5, 10),
        Interval(5, 10),
    )


def test_interval_if_eq_discards_impossible_true_branch():
    bc, pc = make_if_bytecode(jvm.CmpOpr.Eq)

    state = State(
        locals=(
            Interval(1, 3),
            Interval(5, 8),
        ),
        stack=(
            Interval(1, 3),
            Interval(5, 8),
        ),
    )

    branches = {
        next_pc.offset: refined
        for next_pc, refined in manystep(bc, pc, state, Interval)
    }

    assert 4 not in branches
    assert 3 in branches

def test_interval_if_ne_refines_false_branch():
    bc, pc = make_if_bytecode(jvm.CmpOpr.Ne)

    state = State(
        locals=(
            Interval(1, 10),
            Interval(5, 15),
        ),
        stack=(
            Interval(1, 10),
            Interval(5, 15),
        ),
    )

    branches = {
        next_pc.offset: refined
        for next_pc, refined in manystep(bc, pc, state, Interval)
    }

    assert branches[4].locals == (
        Interval(1, 10),
        Interval(5, 15),
    )

    assert branches[3].locals == (
        Interval(5, 10),
        Interval(5, 10),
    )

def test_interval_if_le_refines_both_branches():
    bc, pc = make_if_bytecode(jvm.CmpOpr.Le)

    state = State(
        locals=(
            Interval(5, 15),
            Interval(10, 12),
        ),
        stack=(
            Interval(5, 15),
            Interval(10, 12),
        ),
    )

    branches = {
        next_pc.offset: refined
        for next_pc, refined in manystep(bc, pc, state, Interval)
    }

    assert branches[4].locals == (
        Interval(5, 12),
        Interval(10, 12),
    )

    assert branches[3].locals == (
        Interval(11, 15),
        Interval(10, 12),
    )

def test_interval_if_ge_refines_both_branches():
    bc, pc = make_if_bytecode(jvm.CmpOpr.Ge)

    state = State(
        locals=(
            Interval(5, 15),
            Interval(10, 12),
        ),
        stack=(
            Interval(5, 15),
            Interval(10, 12),
        ),
    )

    branches = {
        next_pc.offset: refined
        for next_pc, refined in manystep(bc, pc, state, Interval)
    }

    assert branches[4].locals == (
        Interval(10, 15),
        Interval(10, 12),
    )

    assert branches[3].locals == (
        Interval(5, 11),
        Interval(10, 12),
    )


def test_interval_if_gt_refines_both_branches():
    bc, pc = make_if_bytecode(jvm.CmpOpr.Gt)

    state = State(
        locals=(
            Interval(5, 15),
            Interval(10, 12),
        ),
        stack=(
            Interval(5, 15),
            Interval(10, 12),
        ),
    )

    branches = {
        next_pc.offset: refined
        for next_pc, refined in manystep(bc, pc, state, Interval)
    }

    assert branches[4].locals == (
        Interval(11, 15),
        Interval(10, 12),
    )

    assert branches[3].locals == (
        Interval(5, 12),
        Interval(10, 12),
    )

@pytest.mark.parametrize(
    ("condition", "expected_offset"),
    [
        (jvm.CmpOpr.Eq, 4),
        (jvm.CmpOpr.Ne, 3),
        (jvm.CmpOpr.Lt, 3),
        (jvm.CmpOpr.Le, 4),
        (jvm.CmpOpr.Ge, 4),
        (jvm.CmpOpr.Gt, 3),
    ],
)
def test_interval_if_same_variable(condition, expected_offset):
    bc, pc = make_if_bytecode(condition, second_index=0)

    state = State(
        locals=(Interval(2, 8),),
        stack=(Interval(2, 8), Interval(2, 8)),
    )

    branches = list(manystep(bc, pc, state, Interval))

    assert len(branches) == 1
    assert branches[0][0].offset == expected_offset
    assert branches[0][1].locals == (Interval(2, 8),)

def test_interval_if_lt_discards_impossible_false_branch():
    bc, pc = make_if_bytecode(jvm.CmpOpr.Lt)

    state = State(
        locals=(
            Interval(1, 3),
            Interval(5, 8),
        ),
        stack=(
            Interval(1, 3),
            Interval(5, 8),
        ),
    )

    branches = list(manystep(bc, pc, state, Interval))

    assert len(branches) == 1
    assert branches[0][0].offset == 4
    assert branches[0][1].locals == (
        Interval(1, 3),
        Interval(5, 8),
    )

def test_interval_if_gt_discards_impossible_true_branch():
    bc, pc = make_if_bytecode(jvm.CmpOpr.Gt)

    state = State(
        locals=(
            Interval(1, 3),
            Interval(5, 8),
        ),
        stack=(
            Interval(1, 3),
            Interval(5, 8),
        ),
    )

    branches = list(manystep(bc, pc, state, Interval))

    assert len(branches) == 1
    assert branches[0][0].offset == 3
    assert branches[0][1].locals == (
        Interval(1, 3),
        Interval(5, 8),
    )

def test_interval_if_lt_with_unbounded_intervals():
    bc, pc = make_if_bytecode(jvm.CmpOpr.Lt)

    state = State(
        locals=(Interval(None, 5), Interval(10, None)),
        stack=(Interval(None, 5), Interval(10, None)),
    )

    branches = list(manystep(bc, pc, state, Interval))

    assert len(branches) == 1
    assert branches[0][0].offset == 4
    assert branches[0][1].locals == (
        Interval(None, 5),
        Interval(10, None),
    )

def test_interval_if_gt_with_unbounded_intervals():
    bc, pc = make_if_bytecode(jvm.CmpOpr.Gt)

    state = State(
        locals=(Interval(None, 5), Interval(10, None)),
        stack=(Interval(None, 5), Interval(10, None)),
    )

    branches = list(manystep(bc, pc, state, Interval))

    assert len(branches) == 1
    assert branches[0][0].offset == 3
    assert branches[0][1].locals == (
        Interval(None, 5),
        Interval(10, None),
    )

def test_interval_if_lt_refines_unbounded_intervals():
    bc, pc = make_if_bytecode(jvm.CmpOpr.Lt)

    state = State(
        locals=(Interval(None, 10), Interval(5, None)),
        stack=(Interval(None, 10), Interval(5, None)),
    )

    branches = list(manystep(bc, pc, state, Interval))

    assert len(branches) == 2

    true_branch = next(branch for branch in branches if branch[0].offset == 4)
    false_branch = next(branch for branch in branches if branch[0].offset == 3)

    assert true_branch[1].locals == (
        Interval(None, 10),
        Interval(5, None),
    )

    assert false_branch[1].locals == (
        Interval(5, 10),
        Interval(5, 10),
    )

def test_run_analysis_returns_states_and_final_results():
    methodid = jvm.AbsMethodID.decode("Test.method:(I)V")

    method = jvm.Method(
        methodid,
        [jvm.Return(type=None, offset=0)],
        1,
    )

    bc = jpamb.Bytecode(
        jpamb.Suite(Path.cwd()),
        Effect(None),
        {methodid: method},
    )

    ai, final = run_analysis(bc, methodid)

    assert final == {"ok"}
    assert ai.states[PC(methodid, 0)].locals == (Interval.top(),)
    assert not ai.worklist