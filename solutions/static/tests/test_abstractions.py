import abstractions as ab
import pytest
from hypothesis import given
from hypothesis import strategies as st

import jvm
import jvm.state as jvms


def st_i32():
    return st.integers(min_value=-(2**31) - 1, max_value=2**31)


def st_u32():
    return st.integers(min_value=0, max_value=2**32)


def st_stack_ints():
    return st_i32().map(jvms.StackInt)


def st_stack_refs():
    return st_u32().map(jvms.StackReference)


def st_signset():
    return (
        st.sets(st.integers(min_value=-1, max_value=1)).map(frozenset).map(ab.SignSet)
    )


@given(st_signset(), st_signset(), st_signset())
def test_signset_is_poset(a: ab.SignSet, b: ab.SignSet, c: ab.SignSet):
    ab.is_poset(a, b, c)


@given(st_signset(), st_signset(), st_signset())
def test_signset_is_lattice(a: ab.SignSet, b: ab.SignSet, c: ab.SignSet):
    ab.is_lattice(a, b, c)


@given(st.sets(st_stack_ints()), st_signset())
def test_signset_is_galoi(a: set[jvms.StackInt], b: ab.SignSet):
    ab.is_galoi(a, b)


def arithmetic(opr, x, y):
    match opr:
        case jvm.BinaryOpr.Add:
            return jvms.StackInt(x.value + y.value)
        case _:
            raise NotImplementedError("TODO")


@given(
    st.sampled_from([jvm.BinaryOpr.Add]),
    st.sets(st_stack_ints()),
    st.sets(
        st_stack_ints(),
    ),
)
def test_signset_arithmetic(
    opr: jvm.BinaryOpr, xs: set[jvms.StackInt], ys: set[jvms.StackInt]
):
    real = ab.SignSet.abstract(arithmetic(opr, x, y) for x in xs for y in ys)
    (abstracted, _errs) = ab.SignSet.abstract(xs).arithmetic(
        ab.SignSet.abstract(ys), opr
    )
    assert real <= abstracted


def compare(opr, x, y):
    match opr:
        case jvm.CmpOpr.Le:
            return x.value <= y.value
        case _:
            raise NotImplementedError("TODO")


@given(
    st.sampled_from([jvm.CmpOpr.Le]),
    st.sets(st_stack_ints()),
    st.sets(
        st_stack_ints(),
    ),
)
def test_signset_compare(
    opr: jvm.CmpOpr, xs: set[jvms.StackInt], ys: set[jvms.StackInt]
):
    real = {compare(opr, x, y) for x in xs for y in ys}
    abstracted = set(ab.SignSet.abstract(xs).compare(ab.SignSet.abstract(ys), opr))
    assert real <= abstracted


@st.composite
def st_interval(draw):
    min = draw(st.one_of(st.none(), st_i32()))
    max = draw(st.one_of(st.none(), st_i32()))

    if min is not None and max is not None and min > max:
        min, max = max, min

    return ab.Interval(min, max)


@given(st_interval(), st_interval(), st_interval())
def test_interval_is_poset(a: ab.Interval, b: ab.Interval, c: ab.Interval):
    ab.is_poset(a, b, c)


@given(st_interval(), st_interval(), st_interval())
def test_interval_is_lattice(a: ab.Interval, b: ab.Interval, c: ab.Interval):
    ab.is_lattice(a, b, c)


@given(st.sets(st_stack_ints()), st_interval())
def test_lnterval_is_galoi(a: set[jvms.StackInt], b: ab.Interval):
    ab.is_galoi(a, b)

# Interval comparison tests.
@pytest.mark.parametrize(
    "a, b, opr, expected",
    [
        (ab.Interval(1, 3), ab.Interval(4, 6), jvm.CmpOpr.Lt, {True}),
        (ab.Interval(4, 6), ab.Interval(1, 3), jvm.CmpOpr.Lt, {False}),
        (ab.Interval(1, 5), ab.Interval(3, 7), jvm.CmpOpr.Lt, {True, False}),
        (ab.Interval(1, 3), ab.Interval(4, 6), jvm.CmpOpr.Le, {True}),
        (ab.Interval(4, 6), ab.Interval(1, 3), jvm.CmpOpr.Le, {False}),
        (ab.Interval(5, 5), ab.Interval(5, 5), jvm.CmpOpr.Eq, {True}),
        (ab.Interval(1, 3), ab.Interval(4, 6), jvm.CmpOpr.Eq, {False}),
        (ab.Interval(1, 5), ab.Interval(3, 7), jvm.CmpOpr.Eq, {True, False}),
        (ab.Interval(1, 3), ab.Interval(4, 6), jvm.CmpOpr.Ne, {True}),
        (ab.Interval(5, 5), ab.Interval(5, 5), jvm.CmpOpr.Ne, {False}),
        (ab.Interval(4, 6), ab.Interval(1, 3), jvm.CmpOpr.Gt, {True}),
        (ab.Interval(1, 3), ab.Interval(4, 6), jvm.CmpOpr.Ge, {False}),
    ],
)
def test_interval_compare(a, b, opr, expected):
    assert set(a.compare(b, opr)) == expected

# Interval arithmetic tests.
@pytest.mark.parametrize(
    "a, b, opr, expected",
    [
        (ab.Interval(1, 3), ab.Interval(2, 4), jvm.BinaryOpr.Add, ab.Interval(3, 7)),
        (ab.Interval(1, 3), ab.Interval(2, 4), jvm.BinaryOpr.Sub, ab.Interval(-3, 1)),
        (ab.Interval(2, 3), ab.Interval(4, 5), jvm.BinaryOpr.Mul, ab.Interval(8, 15)),
        (ab.Interval(-3, -2), ab.Interval(4, 5), jvm.BinaryOpr.Mul, ab.Interval(-15, -8)),
        (ab.Interval(7, 9), ab.Interval(2, 3), jvm.BinaryOpr.Div, ab.Interval(2, 4)),
        (ab.Interval(-9, -7), ab.Interval(2, 3), jvm.BinaryOpr.Div, ab.Interval(-4, -2)),
    ],
)
def test_interval_arithmetic(a, b, opr, expected):
    result, errors = a.arithmetic(b, opr)

    assert result == expected
    assert errors == set()

def test_interval_division_by_zero():
    result, errors = ab.Interval(10, 20).arithmetic(
        ab.Interval(0, 0), jvm.BinaryOpr.Div
    )

    assert result == ab.Interval.top()
    assert errors == {"divide by zero"}


def test_interval_division_interval_containing_zero():
    result, errors = ab.Interval(10, 20).arithmetic(
        ab.Interval(-2, 3), jvm.BinaryOpr.Div
    )

    assert result == ab.Interval.top()
    assert errors == {"divide by zero"}


def test_interval_arithmetic_with_bottom():
    bottom = ab.Interval(1, 0)

    result, errors = ab.Interval(2, 5).arithmetic(
        bottom, jvm.BinaryOpr.Add
    )

    assert result.is_bottom()
    assert errors == set()


def test_interval_addition_with_unbounded_values():
    result, errors = ab.Interval(None, 3).arithmetic(
        ab.Interval(1, 2), jvm.BinaryOpr.Add
    )

    assert result == ab.Interval(None, 5)
    assert errors == set()


def test_interval_multiplication_with_unbounded_values():
    result, errors = ab.Interval(1, 3).arithmetic(
        ab.Interval(None, 2), jvm.BinaryOpr.Mul
    )

    assert result == ab.Interval.top()
    assert errors == set()

# Interval remainder tests.
@pytest.mark.parametrize(
    "a, b, expected",
    [
        (ab.Interval(7, 9), ab.Interval(2, 3), ab.Interval(0, 2)),
        (ab.Interval(-9, -7), ab.Interval(2, 3), ab.Interval(-2, 0)),
        (ab.Interval(-5, 5), ab.Interval(2, 3), ab.Interval(-2, 2)),
        (ab.Interval(0, 0), ab.Interval(2, 3), ab.Interval(0, 0)),
    ],
)
def test_interval_remainder(a, b, expected):
    result, errors = a.arithmetic(b, jvm.BinaryOpr.Rem)

    assert result == expected
    assert errors == set()