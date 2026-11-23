import abstractions as ab
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
    if opr in (jvm.BinaryOpr.Div, jvm.BinaryOpr.Rem) and y.value == 0:
        return None
    return jvms.StackInt(ab.java_binary(opr, x.value, y.value))


@given(
    st.sampled_from(list(jvm.BinaryOpr)),
    st.sets(st_stack_ints()),
    st.sets(
        st_stack_ints(),
    ),
)
def test_signset_arithmetic(
    opr: jvm.BinaryOpr, xs: set[jvms.StackInt], ys: set[jvms.StackInt]
):
    results = [arithmetic(opr, x, y) for x in xs for y in ys]
    real = ab.SignSet.abstract(r for r in results if r is not None)
    (abstracted, errs) = ab.SignSet.abstract(xs).arithmetic(
        ab.SignSet.abstract(ys), opr
    )
    assert real <= abstracted
    if None in results:
        assert "divide by zero" in errs


def compare(opr, x, y):
    return ab.java_compare(opr, x.value, y.value)


@given(
    st.sampled_from(list(jvm.CmpOpr)),
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


def st_int32():
    return st.integers(min_value=ab.INT_MIN, max_value=ab.INT_MAX)


@st.composite
def st_interval(draw):
    lo, hi = sorted([draw(st_int32()), draw(st_int32())])
    if draw(st.booleans()):
        lo = None
    if draw(st.booleans()):
        hi = None
    return ab.Interval.of(lo, hi)


@st.composite
def st_int32_sets(draw):
    """Small sets of int32 values, biased towards limits and small numbers."""
    special = st.sampled_from([ab.INT_MIN, ab.INT_MIN + 1, -1, 0, 1, ab.INT_MAX])
    value = st.one_of(special, st.integers(-10, 10), st_int32())
    return {jvms.StackInt(v) for v in draw(st.sets(value, max_size=6))}


@given(st_interval(), st_interval(), st_interval())
def test_interval_is_poset(a: ab.Interval, b: ab.Interval, c: ab.Interval):
    ab.is_poset(a, b, c)


@given(st_interval(), st_interval(), st_interval())
def test_interval_is_lattice(a: ab.Interval, b: ab.Interval, c: ab.Interval):
    ab.is_lattice(a, b, c)


@given(st.sets(st_stack_ints()), st_interval())
def test_interval_is_galoi(a: set[jvms.StackInt], b: ab.Interval):
    ab.is_galoi(a, b)


def java_arithmetic(opr, x, y):
    """Concrete Java semantics: None for a division by zero, else wrapped."""
    if opr in (jvm.BinaryOpr.Div, jvm.BinaryOpr.Rem) and y.value == 0:
        return None
    return jvms.StackInt(ab.wrap32(ab.java_binary(opr, x.value, y.value)))


@given(st.sampled_from(list(jvm.BinaryOpr)), st_int32_sets(), st_int32_sets())
def test_interval_arithmetic(opr: jvm.BinaryOpr, xs, ys):
    abstracted, errs = ab.Interval.abstract(xs).arithmetic(
        ab.Interval.abstract(ys), opr
    )
    for x in xs:
        for y in ys:
            r = java_arithmetic(opr, x, y)
            if r is None:
                assert "divide by zero" in errs
            else:
                assert r in abstracted, f"{x} {opr} {y} = {r} not in {abstracted}"


@given(st.sampled_from(list(jvm.CmpOpr)), st_int32_sets(), st_int32_sets())
def test_interval_compare(opr: jvm.CmpOpr, xs, ys):
    real = {compare(opr, x, y) for x in xs for y in ys}
    abstracted = set(ab.Interval.abstract(xs).compare(ab.Interval.abstract(ys), opr))
    assert real <= abstracted


@given(
    st.sampled_from(list(jvm.CmpOpr)), st.booleans(), st_int32_sets(), st_int32_sets()
)
def test_interval_refine_is_sound(opr: jvm.CmpOpr, outcome: bool, xs, ys):
    left, right = ab.Interval.abstract(xs).refine(
        ab.Interval.abstract(ys), opr, outcome
    )
    for x in xs:
        for y in ys:
            if compare(opr, x, y) == outcome:
                assert x in left
                assert y in right


@given(st.sampled_from(list(jvm.CmpOpr)), st.booleans(), st_interval(), st_interval())
def test_interval_refine_is_reductive(
    opr: jvm.CmpOpr, outcome: bool, a: ab.Interval, b: ab.Interval
):
    left, right = a.refine(b, opr, outcome)
    assert left <= a
    assert right <= b


@given(st_interval(), st_interval())
def test_interval_widen_is_upper_bound(a: ab.Interval, b: ab.Interval):
    w = a.widen(b)
    assert a <= w
    assert b <= w


def test_interval_refine_examples():
    I = ab.Interval.of
    top, zero = ab.Interval.top(), I(0, 0)
    # No holes (D8): x != 0 cannot remove 0 from the middle of an interval.
    assert top.refine(zero, jvm.CmpOpr.Ne, True) == (top, zero)
    # ... but it trims an endpoint.
    assert I(0, 9).refine(zero, jvm.CmpOpr.Ne, True)[0] == I(1, 9)
    assert top.refine(I(5, 5), jvm.CmpOpr.Gt, True)[0] == I(6, None)
    assert top.refine(I(5, 5), jvm.CmpOpr.Lt, False)[0] == I(5, None)


def test_interval_overflow_goes_to_top():
    top = ab.Interval.top()
    big = ab.Interval.of(0, None)  # up to INT_MAX
    assert big.arithmetic(ab.Interval.of(1, 1), jvm.BinaryOpr.Add)[0] == top


@given(
    st.sampled_from(list(jvm.CmpOpr)),
    st.booleans(),
    st.sets(st_stack_ints()),
    st.sets(st_stack_ints()),
)
def test_signset_refine_is_sound(
    opr: jvm.CmpOpr, outcome: bool, xs: set[jvms.StackInt], ys: set[jvms.StackInt]
):
    """Every concrete pair with the given outcome survives narrowing."""
    left, right = ab.SignSet.abstract(xs).refine(ab.SignSet.abstract(ys), opr, outcome)
    for x in xs:
        for y in ys:
            if compare(opr, x, y) == outcome:
                assert x in left
                assert y in right


@given(st.sampled_from(list(jvm.CmpOpr)), st.booleans(), st_signset(), st_signset())
def test_signset_refine_is_reductive(
    opr: jvm.CmpOpr, outcome: bool, a: ab.SignSet, b: ab.SignSet
):
    left, right = a.refine(b, opr, outcome)
    assert left <= a
    assert right <= b


def test_signset_refine_ne_zero():
    top, zero = ab.SignSet.top(), ab.SignSet.from_sign("0")
    assert top.refine(zero, jvm.CmpOpr.Eq, False) == (ab.SignSet.from_sign("-+"), zero)
    assert top.refine(zero, jvm.CmpOpr.Eq, True) == (zero, zero)
    assert top.refine(zero, jvm.CmpOpr.Gt, True)[0] == ab.SignSet.from_sign("+")
