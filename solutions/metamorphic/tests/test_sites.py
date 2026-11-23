"""Tests of the site finder on the real benchmark and the step 3 export."""

import json
from pathlib import Path

import pytest
import sites
from javaexpr import parse

ROOT = Path(__file__).resolve().parents[3]
EXPORT = ROOT / "project/step3/static-interval-states.json"


@pytest.fixture(scope="module")
def export() -> dict:
    return json.loads(EXPORT.read_text())


@pytest.fixture(scope="module")
def found(export) -> sites.Found:
    return sites.find_sites(export, ROOT)


def of(found, method: str) -> list[dict]:
    return [s for s in found.sites if s["method"] == method]


def test_every_method_matched(found):
    assert found.unmatched_methods == []


def test_unreachable_range(found):
    # if (n > 100 && n < 50) { assert false; }   (line 137)
    ss = of(found, "jpamb.cases.MagicConstants.unreachableRange:(I)V")
    assert {s["rule"] for s in ss} == {"R1-invert", "R2-swap", "R2-strict"}
    assert all(s["line"] == 137 and s["joined"] and s["uncertain"] for s in ss)
    (inv,) = [s for s in ss if s["rule"] == "R1-invert"]
    assert inv["rewritten"].startswith("if (n <= 100 || n >= 50) {} else {")


def test_assert_has_no_branch_inversion(found):
    # assert n > 0;
    ss = of(found, "jpamb.cases.Simple.assertPositive:(I)V")
    assert sorted(s["rule"] for s in ss) == ["R2-strict", "R2-swap"]
    assert all(s["uncertain"] for s in ss)


def test_settled_branch_is_not_uncertain(found, export):
    # A site is uncertain only on a line in the export's uncertain_lines.
    for s in found.sites:
        m = export["methods"][s["method"]]
        assert s["uncertain"] == (s["joined"] and s["line"] in m["uncertain_lines"])


def test_every_variant_reparses(found):
    cache = {}
    for s in found.sites:
        src = cache.setdefault(s["source"], (ROOT / s["source"]).read_bytes())
        assert src[s["start_byte"] : s["end_byte"]].decode() == s["original"]
        variant = sites.apply(src, s)
        assert not parse(variant).root_node.has_error, s["id"]


def test_ids_unique_and_deterministic(found, export):
    ids = [s["id"] for s in found.sites]
    assert len(ids) == len(set(ids))
    assert sites.find_sites(export, ROOT).sites == found.sites
