"""Tests for the per-PC state and uncertain-site export (step 3), on the
committed `target/` (no Docker)."""

import json
from pathlib import Path

import export
import pytest
from abstractions import Interval, SignSet

import jpamb
from jpamb import jvm
from jpamb.utils import Effect

ROOT = Path(__file__).resolve().parents[3]


@pytest.fixture(scope="module")
def bc() -> jpamb.Bytecode:
    return jpamb.Bytecode(jpamb.Suite.from_workdir(ROOT), Effect(None), {})


def run(bc, method: str, domain=Interval) -> dict:
    return export.export_method(bc, jvm.AbsMethodID.decode(method), domain)


def sites(result: dict, kind: str) -> list[dict]:
    return [s for s in result["sites"] if s["kind"] == kind]


def test_lines_come_from_instruction_indices(bc):
    # assert false;  (line 9)  }  (line 10): the line table starts line 10 at
    # instruction index 6, the return, not at byte offset 6.
    result = run(bc, "jpamb.cases.Simple.assertFalse:()V")
    assert [p["line"] for p in result["pcs"]] == [9] * 6 + [10]
    # return 1 / n;  is line 10 of Dependent.java
    result = run(bc, "jpamb.cases.Dependent.safeDivByN:(I)I")
    assert [s["line"] for s in sites(result, "divisor")] == [10]


def test_unreachable_range(bc):
    # if (n > 100 && n < 50) { assert false; }
    result = run(bc, "jpamb.cases.MagicConstants.unreachableRange:(I)V")
    first, second = sites(result, "branch")
    assert first["uncertain"] and first["outcomes"] == [False, True]
    assert not second["uncertain"] and second["outcomes"] == [True]
    assert second["operands"][0] == {"min": 101, "max": None}
    assert first["origins"] == [0, None]
    assert result["uncertain_lines"] == [137]
    unreachable = [p["pc"] for p in result["pcs"] if not p["reachable"]]
    assert unreachable == list(range(6, 12))
    assert all("state" not in result["pcs"][i] for i in unreachable)


def test_divisor_sites(bc):
    (zero,) = sites(run(bc, "jpamb.cases.Simple.divideByZero:()I"), "divisor")
    assert zero["may_be_zero"] and not zero["may_be_nonzero"]
    assert not zero["uncertain"]  # settled: certainly zero
    # n != 0 cannot remove 0 from an interval (D8), so this stays uncertain.
    (guarded,) = sites(run(bc, "jpamb.cases.Dependent.safeDivByN:(I)I"), "divisor")
    assert guarded["uncertain"]
    # ... while the sign domain with narrowing settles it.
    (sign,) = sites(
        run(bc, "jpamb.cases.Dependent.safeDivByN:(I)I", SignSet), "divisor"
    )
    assert not sign["may_be_zero"] and not sign["uncertain"]


def test_every_method_exports(bc):
    data = export.export_all(bc, Interval, narrow=True)
    cases = (ROOT / "target/stats/cases.txt").read_text().splitlines()
    assert len(data["methods"]) == len({c.split()[0] for c in cases if c.strip()})
    assert all(m["fixpoint"] for m in data["methods"].values())
    assert json.loads(json.dumps(data)) == data


def test_to_json():
    assert Interval.top().to_json() == {"min": None, "max": None}
    assert Interval.of(1, 5).to_json() == {"min": 1, "max": 5}
    assert Interval.BOT.to_json() == "bot"
    assert SignSet.top().to_json() == ["-", "0", "+"]
    assert SignSet.bot().to_json() == []
    assert SignSet.from_sign("0+").to_json() == ["0", "+"]
