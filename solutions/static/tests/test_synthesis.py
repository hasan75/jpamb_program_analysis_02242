import jpamb

from abstractions import Interval
from synthesis import (
    check_rewrite_equivalence,
    representative_values,
    synthesize_integer_inputs,
)

def test_representative_values_bounded_interval():
    result = representative_values(Interval(2, 5))

    assert result == (2, 3, 4, 5)


def test_representative_values_single_value():
    result = representative_values(Interval(4, 4))

    assert result == (4,)


def test_representative_values_interval_containing_zero():
    result = representative_values(Interval(-2, 2))

    assert result == (-2, -1, 0, 1, 2)


def test_representative_values_bottom():
    result = representative_values(Interval(1, 0))

    assert result == ()


def test_representative_values_unbounded_interval():
    result = representative_values(Interval(None, None))

    assert result == (
        -(1 << 31),
        -(1 << 31) + 1,
        -1,
        0,
        1,
        (1 << 31) - 2,
        (1 << 31) - 1,
    )

def test_synthesize_integer_inputs():
    intervals = (Interval(1, 2), Interval(5, 6))

    inputs = synthesize_integer_inputs(intervals)

    values = tuple(
        tuple(value.value for value in input.values)
        for input in inputs
    )

    assert values == (
        (1, 5),
        (1, 6),
        (2, 5),
        (2, 6),
    )


def test_synthesize_integer_inputs_bottom():
    intervals = (Interval(1, 2), Interval(1, 0))

    assert synthesize_integer_inputs(intervals) == ()


def test_synthesize_integer_inputs_no_parameters():
    assert synthesize_integer_inputs(()) == (jpamb.case.Input(()),)

def test_check_rewrite_equivalence_same_results(monkeypatch):
    results = iter(["ok", "ok", "assertion error", "assertion error"])

    def fake_execute_input(*args, **kwargs):
        return next(results)

    monkeypatch.setattr("synthesis.execute_input", fake_execute_input)

    inputs = (
        jpamb.case.Input((jpamb.case.Int(1),)),
        jpamb.case.Input((jpamb.case.Int(-1),)),
    )

    assert check_rewrite_equivalence(
        None, None, None, None, None, inputs, None
    )


def test_check_rewrite_equivalence_different_results(monkeypatch):
    results = iter(["ok", "assertion error"])

    def fake_execute_input(*args, **kwargs):
        return next(results)

    monkeypatch.setattr("synthesis.execute_input", fake_execute_input)

    inputs = (jpamb.case.Input((jpamb.case.Int(1),)),)

    assert not check_rewrite_equivalence(
        None, None, None, None, None, inputs, None
    )


def test_check_rewrite_equivalence_timeout(monkeypatch):
    results = iter(["*", "*"])

    def fake_execute_input(*args, **kwargs):
        return next(results)

    monkeypatch.setattr("synthesis.execute_input", fake_execute_input)

    inputs = (jpamb.case.Input((jpamb.case.Int(1),)),)

    assert not check_rewrite_equivalence(
        None, None, None, None, None, inputs, None
    )


def test_check_rewrite_equivalence_no_inputs():
    assert not check_rewrite_equivalence(
        None, None, None, None, None, (), None
    )