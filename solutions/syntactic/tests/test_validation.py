from pathlib import Path
import sys
from types import SimpleNamespace

sys.path.insert(
    0,
    str(Path(__file__).resolve().parents[1] / "src"),
)

import validation
from rewriting import find_rewrite_sites
from jvm.state import PC

class FakeIfz:
    condition = "ge"

class FakeAbstract:
    @staticmethod
    def abstract(values):
        return FakeAbstract()

    def compare(self, other, condition):
        return {True, False}

def test_find_rewrite_sites_rejects_compound_condition():
    source = b"""
    class Example {
        static int test(int i) {
            if (i == 0 || i == 1) {
                return i;
            }
            return -1;
        }
    }
    """

    assert find_rewrite_sites(source) == []

def test_is_site_uncertain_accepts_simple_comparison(monkeypatch):
    source = b"""
    class Example {
        static int test(int i) {
            if (i < 0) {
                return 0;
            }
            return 1;
        }
    }
    """

    sites = find_rewrite_sites(source)
    assert len(sites) == 1
    site = sites[0]
    methodid = "Example.test:(I)I"

    monkeypatch.setattr(validation.jvm, "Ifz", FakeIfz)

    state = SimpleNamespace(stack=(FakeAbstract(),))

    bc = SimpleNamespace(
        getmethod=lambda _: SimpleNamespace(opcodes=[FakeIfz()])
    )

    ai = SimpleNamespace(
        states={PC(methodid, 0): state}
    )

    result = validation.is_site_uncertain(
        bc, ai, methodid, source, site
    )

    assert result is True

def test_is_site_uncertain_rejects_mismatched_branches():
    source = b"""
    class Example {
        static int test(int i) {
            if (i < 0) {
                return 0;
            }
            if (i > 10) {
                return 1;
            }
            return 2;
        }
    }
    """

    sites = find_rewrite_sites(source)
    assert len(sites) == 2

    methodid = "Example.test:(I)I"

    bc = SimpleNamespace(
        getmethod=lambda _: SimpleNamespace(
            opcodes=[FakeIfz()]
        )
    )

    ai = SimpleNamespace(states={})

    result = validation.is_site_uncertain(
        bc, ai, methodid, source, sites[0]
    )

    assert result is None
