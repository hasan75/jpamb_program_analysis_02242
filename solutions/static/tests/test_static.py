"""Analyzer-level tests for narrowing and the interval domain, on the committed
`target/` (no Docker)."""

from pathlib import Path

import pytest
import static
from abstractions import Interval

import jpamb
from jpamb import jvm
from jpamb.utils import Effect

ROOT = Path(__file__).resolve().parents[3]


@pytest.fixture(scope="module")
def bc() -> jpamb.Bytecode:
    return jpamb.Bytecode(jpamb.Suite.from_workdir(ROOT), Effect(None), {})


def interpreter(bc, method: str, narrow: bool, domain=static.SignSet):
    mid = jvm.AbsMethodID.decode(method)
    return static.AbstractInterpreter.initial(
        bc, mid, None, narrow=narrow, domain=domain
    )


def outcomes(bc, method: str, narrow: bool, domain=static.SignSet) -> set[str]:
    return interpreter(bc, method, narrow, domain).run(10_000)


def test_narrowing_removes_false_divide_by_zero(bc):
    # if (n != 0) return 1 / n;  -- n cannot be 0 at the division
    method = "jpamb.cases.Simple.checkBeforeDivideByN2:(I)I"
    assert "divide by zero" in outcomes(bc, method, narrow=False)
    assert "divide by zero" not in outcomes(bc, method, narrow=True)


def test_narrowing_keeps_real_divide_by_zero(bc):
    method = "jpamb.cases.Simple.divideByN:(I)I"
    assert "divide by zero" in outcomes(bc, method, narrow=True)


def test_interval_removes_false_assertion(bc):
    # if (n > 100 && n < 50) assert false;  -- signs only know n is positive
    method = "jpamb.cases.MagicConstants.unreachableRange:(I)V"
    assert "assertion error" in outcomes(bc, method, narrow=True)
    assert "assertion error" not in outcomes(bc, method, True, Interval)


def test_interval_has_no_holes(bc):
    # if (n != 0) return 1 / n;  -- [-inf, inf] minus 0 is still [-inf, inf] (D8)
    method = "jpamb.cases.Dependent.safeDivByN:(I)I"
    assert "divide by zero" not in outcomes(bc, method, narrow=True)
    assert "divide by zero" in outcomes(bc, method, True, Interval)


@pytest.mark.parametrize(
    "method",
    [
        "jpamb.cases.Loops.terminates:()V",
        "jpamb.cases.Loops.forLoopDivision:(II)I",
        "jpamb.cases.Loops.multiplicationLoop:(I)V",
    ],
)
def test_widening_reaches_fixpoint(bc, method):
    ai = interpreter(bc, method, True, Interval)
    ai.run(1_000)
    assert not ai.worklist, "interval analysis did not reach a fixpoint"
