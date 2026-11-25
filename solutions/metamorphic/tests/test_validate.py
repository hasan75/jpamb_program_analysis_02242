"""Tests of the validation helpers that need no Docker."""

import json
import re
from pathlib import Path

import pytest
import validate
from javaexpr import parse

ROOT = Path(__file__).resolve().parents[3]
EXPORT = ROOT / "project/step3/static-interval-states.json"
SITES = ROOT / "project/step4/sites.json"


@pytest.fixture(scope="module")
def export() -> dict:
    return json.loads(EXPORT.read_text())


@pytest.fixture(scope="module")
def cases() -> dict:
    return validate.read_cases(ROOT / "target/stats/cases.txt")


def test_param_types():
    assert validate.param_types("a.B.f:(IZ[ILjava/lang/String;)V") == [
        "I", "Z", "[I", "Ljava/lang/String;"
    ]  # fmt: skip
    assert validate.param_types("a.B.f:()I") == []


def test_vid_is_filesystem_safe():
    v = validate.vid("cases/jpamb/cases/Arrays.java:27:12:R2-split")
    assert v == "cases_jpamb_cases_Arrays_java_27_12_R2_split"


def test_synthesis_deterministic_and_in_range(export, cases):
    mid = "jpamb.cases.Simple.checkBeforeDivideByN2:(I)I"
    a = validate.synthesize(mid, export["methods"][mid], cases[mid])
    assert a == validate.synthesize(mid, export["methods"][mid], cases[mid])
    assert a[: len(cases[mid])] == cases[mid]
    assert len(a) == len(set(a)) <= validate.CAP
    for inp in a:
        (x,) = validate.parse_args(inp, ["I"])
        assert validate.INT_MIN <= x <= validate.INT_MAX


def test_synthesis_hits_both_sides_of_a_constant():
    # one branch `x > 5` on parameter 0
    method = {
        "sites": [
            {
                "kind": "branch",
                "operands": [{"min": None, "max": None}, {"min": 5, "max": 5}],
                "origins": [0, None],
            }
        ]
    }
    xs = {
        validate.parse_args(i, ["I"])[0]
        for i in validate.synthesize("a.B.f:(I)V", method, [])
    }
    assert {4, 5, 6, validate.INT_MIN, validate.INT_MAX} <= xs


def test_synthesis_non_int_params_uses_cases():
    assert validate.synthesize("a.B.f:([I)V", None, ["([I: 1])"]) == ["([I: 1])"]
    smith = validate.synthesize("a.B.f:(Ljpamb/utils/Smith;)V", None, ["(r'1')"])
    assert smith[0] == "(r'1')" and len(smith) == 1 + validate.SMITH_INPUTS
    assert all(re.fullmatch(r"\(r'[01]+'\)", s) for s in smith)


SRC = b"""class A {
  static int f(int x, int y) {
    if (x > 0 && y != 3) { return 1; }
    return 0;
  }
  static int g(int x) {
    x = x + 1;
    if (x > 0) { return 1; }
    return 0;
  }
}"""


def site(src: bytes, snippet: bytes, rule: str, start: int = 0) -> dict:
    i = src.index(snippet, start)
    return {"start_byte": i, "end_byte": i + len(snippet), "rule": rule,
            "source": "A.java"}  # fmt: skip


def test_condition_values():
    tree = parse(SRC)
    s = site(SRC, b"y != 3", "R2-swap")
    assert (
        validate.condition_values(tree, s, ["(0, 3)", "(0, 4)"], ["I", "I"]) == "both"
    )
    assert validate.condition_values(tree, s, ["(0, 3)", "(1, 3)"], ["I", "I"]) == "one"
    if_start = SRC.index(b"if (x > 0 &&")
    r1 = {"start_byte": if_start, "end_byte": SRC.index(b"}", if_start) + 1,
          "rule": "R1-invert", "source": "A.java"}  # fmt: skip
    assert (
        validate.condition_values(tree, r1, ["(1, 4)", "(1, 3)"], ["I", "I"]) == "both"
    )
    # x is assigned in g, so its value at the branch is not the input
    g = site(SRC, b"x > 0", "R2-swap", SRC.index(b"static int g"))
    assert validate.condition_values(tree, g, ["(0)", "(1)"], ["I"]) == "unknown"


def test_mutants():
    tree = parse(SRC)
    m = validate.mutant(tree, site(SRC, b"y != 3", "R2-split"))
    assert m["rewritten"] == "y == 3" and m["mutated_rule"] == "R2-split"
    if_start = SRC.index(b"if (x > 0 &&")
    r1 = {"start_byte": if_start, "end_byte": SRC.index(b"}", if_start) + 1,
          "rule": "R1-invert", "source": "A.java", "id": "x"}  # fmt: skip
    assert validate.mutant(tree, r1)["rewritten"].startswith(
        "if (!(x > 0 && y != 3)) {"
    )
    assert set(validate.MUTATE) == set(validate.MUTATE.values())


def test_one_mutant_per_node():
    sites = json.loads(SITES.read_text())["sites"]
    ms = validate.mutants(sites, ROOT)
    keys = [(m["source"], m["start_byte"], m["rule"]) for m in ms]
    assert len(keys) == len(set(keys))
    r2_nodes = {
        (s["source"], s["start_byte"]) for s in sites if s["rule"] != "R1-invert"
    }
    assert sum(m["mutated_rule"] != "R1-invert" for m in ms) == len(r2_nodes)


def test_bytecode_ignores_lines():
    a = {
        "methods": [
            {"name": "f", "params": [], "code": {"bytecode": [1], "lines": [1]}}
        ]
    }
    b = {
        "methods": [
            {"name": "f", "params": [], "code": {"bytecode": [1], "lines": [2]}}
        ]
    }
    c = {
        "methods": [
            {"name": "f", "params": [], "code": {"bytecode": [2], "lines": [1]}}
        ]
    }
    assert validate.bytecode(a) == validate.bytecode(b) != validate.bytecode(c)


CONST_SRC = b"""class A {
  static void f(int n, Smith smith) {
    int[] a = {0, 1, 2, 3, 4, 5, 6, 7};
    int v = smith.draw(4);
    assert (n >> 4) < 64 && ~n > -256 && v >= 5;
  }
}"""


def test_source_constants():
    tree = parse(CONST_SRC)
    decl = selection_method(tree)
    src = validate.source_constants(decl)
    assert {8, 4, 64, -256, 5} <= src.literals and src.widths == {4}
    derived = src.derived()
    assert {64 << 4, ~-256} <= derived  # 1024, 255


def selection_method(tree):
    from selection import enclosing_method

    return enclosing_method(tree.root_node, CONST_SRC.index(b"int[] a"))


def test_synthesis_uses_source_constants():
    src = validate.SourceConstants(frozenset({8, 64, 4}), frozenset({4}))
    xs = {
        validate.parse_args(i, ["I"])[0]
        for i in validate.synthesize("a.B.f:(I)V", None, ["(3)"], src)
    }
    assert {8, 1024} <= xs and 0 in xs
    arrays = validate.synthesize(
        "a.B.f:([I)V", None, [], validate.SourceConstants(frozenset({300}))
    )
    assert "([I: 300])" in arrays and "([I: 301])" in arrays
    smith = validate.synthesize("a.B.f:(Ljpamb/utils/Smith;)V", None, [], src)
    assert "(r'0101')" in smith and "(r'1000')" in smith


def test_zero_base_added_with_cases():
    two = validate.synthesize(
        "a.B.f:(II)V", None, ["(10000, 2)"], validate.SourceConstants(frozenset({256}))
    )
    assert "(256, 0)" in two


def test_cap_keeps_analysis_values_first(export, cases):
    # many source literals must not push out the interval boundaries
    mid = "jpamb.cases.MagicConstants.tableLookupSafe:(I)I"
    src = validate.SourceConstants(frozenset(range(1, 200)))
    xs = validate.synthesize(mid, export["methods"][mid], cases[mid], src)
    assert len(xs) == validate.CAP
    assert {"(999989)", "(999990)", "(999995)", "(999996)"} <= set(xs)
