"""Tests of the selection strategies on the step 4 sites and the step 3 export."""

import json
import math
from pathlib import Path

import pytest
import selection
from javaexpr import parse

ROOT = Path(__file__).resolve().parents[3]
SITES = ROOT / "project/step4/sites.json"
EXPORT = ROOT / "project/step3/static-interval-states.json"


@pytest.fixture(scope="module")
def sites() -> list[dict]:
    return json.loads(SITES.read_text())["sites"]


@pytest.fixture(scope="module")
def distance(sites) -> dict[str, float]:
    return selection.syntax_distances(sites, ROOT)


@pytest.fixture(scope="module")
def strict(sites) -> set[str]:
    return selection.strict_candidates(sites, json.loads(EXPORT.read_text()))


def ids(strategy, seed, sites, distance, strict) -> list[str]:
    return [s["id"] for s in selection.order(strategy, seed, sites, distance, strict)]


@pytest.mark.parametrize("strategy", selection.STRATEGIES)
def test_permutation_and_reproducible(strategy, sites, distance, strict):
    a = ids(strategy, 3, sites, distance, strict)
    assert sorted(a) == sorted(s["id"] for s in sites)
    assert a == ids(strategy, 3, list(reversed(sites)), distance, strict)
    assert a != ids(strategy, 4, sites, distance, strict)


def test_guided_takes_candidates_first(sites, distance, strict):
    unc = {s["id"] for s in sites if s["uncertain"]}
    for seed in selection.SEEDS:
        a = ids("guided", seed, sites, distance, strict)
        assert set(a[: len(unc)]) == unc


def test_guided_strict_takes_its_candidates_first(sites, distance, strict):
    assert strict <= {s["id"] for s in sites if s["uncertain"]}
    for seed in selection.SEEDS:
        a = ids("guided-strict", seed, sites, distance, strict)
        assert set(a[: len(strict)]) == strict


def test_syntax_distance_never_decreases(sites, distance, strict):
    for seed in selection.SEEDS:
        ds = [distance[i] for i in ids("syntax", seed, sites, distance, strict)]
        assert ds == sorted(ds)


def test_syntax_distance_snippet():
    src = b"""class A {
  int f(int x, int y) {
    if (x > 0) {
      y = 1;
    }
    return 10 / y;
  }
  void g(int x) {
    if (x > 0) { return; }
  }
  void h(int x) {
    assert x > 0;
  }
}"""
    tree = parse(src)
    assert selection.syntax_distance(tree, src.index(b"x > 0")) == 3
    g = src.index(b"void g")
    assert selection.syntax_distance(tree, src.index(b"x > 0", g)) == math.inf
    h = src.index(b"assert")
    assert selection.syntax_distance(tree, src.index(b"x > 0", h)) == 0


def test_budgets(sites):
    assert selection.budgets(len(sites)) == {
        "50%": round(len(sites) / 2),
        "25%": round(len(sites) / 4),
    }


def test_settled_takes_settled_sites_first(sites, distance, strict):
    settled = {s["id"] for s in sites if s["joined"] and not s["uncertain"]}
    assert settled and not settled & {s["id"] for s in sites if s["uncertain"]}
    for seed in selection.SEEDS:
        a = ids("settled", seed, sites, distance, strict)
        assert set(a[: len(settled)]) == settled


def test_committed_orders_are_reproduced(sites, distance, strict):
    # The step 5 output matches the code, so adding a strategy did not change
    # the orders of the others (the RNG is keyed by strategy and seed).
    data = json.loads((ROOT / "project/step5/selections.json").read_text())
    for strategy, orders in data["orders"].items():
        for seed, committed in orders.items():
            assert committed == ids(strategy, int(seed), sites, distance, strict)
