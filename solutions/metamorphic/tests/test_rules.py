"""Unit tests of the rewrite rules and their preconditions on small snippets."""

import pytest
import rules
from javaexpr import (
    Rejected,
    Scope,
    declared_types,
    field_names,
    int_literal,
    parse,
)

HEADER = b"class A { int fld; static void f(int x, int y, int[] a, int[] b, long l, double d, char[] cs) { "


def snippet(body: str):
    """Parse ``body`` as the body of ``f`` and return (tree, scope, nodes)."""
    src = HEADER + body.encode() + b" } }"
    tree = parse(src)
    assert not tree.root_node.has_error, body
    cls = tree.root_node.named_children[0]
    body = cls.child_by_field_name("body").named_children
    method = next(m for m in body if m.type == "method_declaration")
    scope = Scope(declared_types(method), field_names(tree.root_node))
    nodes = []
    stack = [method]
    while stack:
        n = stack.pop()
        nodes.append(n)
        stack.extend(reversed(n.children))
    return tree, scope, nodes


def first_if(body: str):
    _, scope, nodes = snippet(body)
    return next(n for n in nodes if n.type == "if_statement"), scope


def first_cmp(body: str):
    _, scope, nodes = snippet(body)
    return next(n for n in nodes if rules.is_comparison(n)), scope


def reparses(stmt: str) -> bool:
    return not parse(HEADER + stmt.encode() + b" } }").root_node.has_error


# R1 invert -----------------------------------------------------------------


def test_invert_simple():
    node, scope = first_if("if (x > 0) y = 1; else y = 2;")
    rw = rules.invert(node, scope)
    assert rw.rewritten == "if (x <= 0) { y = 2; } else { y = 1; }"
    assert reparses(rw.rewritten)


def test_invert_without_else():
    node, scope = first_if("if (x == 0) { return; }")
    assert rules.invert(node, scope).rewritten == "if (x != 0) {} else { return; }"


def test_invert_de_morgan_precedence():
    node, scope = first_if("if (x > 0 && y < 1 || x == 2) return;")
    # !((A && B) || C) = (!A || !B) && !C
    assert rules.invert(node, scope).rewritten == (
        "if ((x <= 0 || y >= 1) && x != 2) {} else { return; }"
    )
    node, scope = first_if("if (x > 0 && (y < 1 || x == 2)) return;")
    assert rules.invert(node, scope).rewritten == (
        "if (x <= 0 || y >= 1 && x != 2) {} else { return; }"
    )


def test_invert_not():
    node, scope = first_if("if (!(x < y)) return;")
    assert rules.invert(node, scope).rewritten == "if ((x < y)) {} else { return; }"


def test_invert_else_if_chain_keeps_binding():
    node, scope = first_if("if (x > 0) y = 1; else if (x < 0) y = 2;")
    rw = rules.invert(node, scope)
    assert rw.rewritten == "if (x <= 0) { if (x < 0) y = 2; } else { y = 1; }"
    assert reparses(rw.rewritten)


def test_invert_inner_if_without_else():
    node, scope = first_if("if (x > 0) if (y > 0) y = 1; else y = 2;")
    # the else belongs to the inner if; the outer if has no else
    rw = rules.invert(node, scope)
    assert rw.rewritten == "if (x <= 0) {} else { if (y > 0) y = 1; else y = 2; }"


@pytest.mark.parametrize(
    "cond",
    [
        "x > 0 && d > 0",
        "l > 0",
        "foo(x) > 0",
        "x++ > 0",
        "fld > 0",
        "true",
        "cs[0] == 'a'",
    ],
)
def test_invert_rejects(cond):
    node, scope = first_if(f"if ({cond}) return;")
    with pytest.raises(Rejected):
        rules.invert(node, scope)


# R2 swap -------------------------------------------------------------------


def test_swap():
    node, scope = first_cmp("boolean c = x + 1 < y * 2;")
    assert rules.swap(node, scope).rewritten == "y * 2 > x + 1"
    node, scope = first_cmp("boolean c = a[x] != y;")
    assert rules.swap(node, scope).rewritten == "y != a[x]"


def test_swap_rejects_two_throwing_operands():
    node, scope = first_cmp("boolean c = a[x] < b[y];")
    with pytest.raises(Rejected):
        rules.swap(node, scope)
    node, scope = first_cmp("boolean c = x / y < a.length;")
    with pytest.raises(Rejected):
        rules.swap(node, scope)


# R2 strict -----------------------------------------------------------------


@pytest.mark.parametrize(
    "cmp,expected",
    [
        ("x > 0", "x >= 1"),
        ("x >= 1", "x > 0"),
        ("x < 50", "x <= 49"),
        ("x <= 49", "x < 50"),
        ("x > -5", "x >= -4"),
        ("0 < x", "1 <= x"),
        ("0 <= x", "-1 < x"),
        ("10 > x", "9 >= x"),
        ("10 >= x", "11 > x"),
        ("x > 1_000", "x >= 1001"),
    ],
)
def test_strict(cmp, expected):
    node, scope = first_cmp(f"boolean c = {cmp};")
    assert rules.strict(node, scope).rewritten == expected


@pytest.mark.parametrize(
    "cmp",
    ["x > 2147483647", "x < -2147483648", "x == 0", "x > y", "x > 0x10", "l > 0"],
)
def test_strict_rejects(cmp):
    node, scope = first_cmp(f"boolean c = {cmp};")
    with pytest.raises(Rejected):
        rules.strict(node, scope)


# R2 split ------------------------------------------------------------------


def test_split():
    node, scope = first_cmp("boolean c = x != 0;")
    assert rules.split(node, scope).rewritten == "(x < 0 || x > 0)"
    node, scope = first_cmp("boolean c = a[x] == y;")
    assert rules.split(node, scope).rewritten == "(a[x] <= y && a[x] >= y)"
    node, scope = first_cmp("boolean c = x < 0;")
    with pytest.raises(Rejected):
        rules.split(node, scope)


# Shared precondition -------------------------------------------------------


@pytest.mark.parametrize(
    "cmp",
    [
        "d > 0",
        "l != 0",
        "foo(x) == 0",
        "(y = 1) == x",
        "fld == 0",
        "cs[0] == x",
        "(int) d > 0",
    ],
)
def test_comparison_rejects(cmp):
    node, scope = first_cmp(f"boolean c = {cmp};")
    for rule in rules.R2_RULES:
        with pytest.raises(Rejected):
            rule(node, scope)


def test_shadowed_or_mixed_declarations_are_not_int():
    # `z` is declared as int in one scope and long in another
    node, scope = first_cmp("{ int z = 0; } { long z = 0; boolean c = z > 0; }")
    with pytest.raises(Rejected):
        rules.swap(node, scope)


def test_int_literal():
    _, _, nodes = snippet("int z = -27183; int w = 0x10; long v = 5L;")
    values = [
        int_literal(n.child_by_field_name("value"))
        for n in nodes
        if n.type == "variable_declarator"
    ]
    assert values == [-27183, None, None]


# Audit counterexamples (rewrite-auditor, step 4) ---------------------------


def scoped(src: bytes, method_name: str = "m"):
    tree = parse(src)
    stack, method = [tree.root_node], None
    while stack:
        n = stack.pop()
        if (
            n.type == "method_declaration"
            and n.child_by_field_name("name").text == method_name.encode()
        ):
            method = n
        stack.extend(n.children)
    scope = Scope(declared_types(method), field_names(tree.root_node))
    nodes, stack = [], [method]
    while stack:
        n = stack.pop()
        nodes.append(n)
        stack.extend(reversed(n.children))
    return tree, method, scope, nodes


@pytest.mark.parametrize(
    "body",
    [
        # pattern variable named like an int local in a closed scope
        "for (int d = 0; d < 1; d++) {} if (o instanceof Double d && d > 0) return 1; return 0;",
        "{ int d = 0; } if (!(o instanceof Double d)) return 0; if (d > 0) return 1; return 2;",
        "{ int i = 0; } switch (o) { case Integer i when i > 0 -> { return 1; } default -> { return 0; } }",
        # a name used outside its local's scope (may be a field from elsewhere)
        "{ int X = 0; } if (X > 0) return 1; return 0;",
    ],
)
def test_names_outside_an_int_scope_are_rejected(body):
    src = b"class A { static int m(Object o) { " + body.encode() + b" } }"
    _, _, scope, nodes = scoped(src)
    target = [
        n
        for n in nodes
        if rules.is_comparison(n)
        and n.child_by_field_name("left").text in (b"d", b"i", b"X")
    ][-1]
    for rule in rules.R2_RULES:
        with pytest.raises(Rejected):
            rule(target, scope)


def test_interface_constant_is_a_field():
    src = b"interface K { double X = 0.5; } class A implements K { static int m(int X) { return X > 0 ? 1 : 0; } }"
    _, _, scope, nodes = scoped(src)
    cmp = next(n for n in nodes if rules.is_comparison(n))
    with pytest.raises(Rejected):
        rules.swap(cmp, scope)


def test_int_local_in_scope_is_accepted():
    src = b"class A { static int m(int n) { int x = n; for (int i = 0; i < n; i++) { if (x > i) return 1; } return 0; } }"
    _, _, scope, nodes = scoped(src)
    for cmp in (n for n in nodes if rules.is_comparison(n)):
        rules.swap(cmp, scope)


def test_parse_error_method_is_skipped():
    from collections import Counter

    import sites

    src = b"class A { static int m(int x) { int _10 = 3; if (x <= 0_10) return 1; return 0; } }"
    _, method, _, _ = scoped(src)
    assert method.has_error
    rejected = Counter()
    assert (
        sites.method_sites(
            method,
            "A.m",
            {"sites": [], "uncertain_lines": []},
            "A.java",
            set(),
            rejected,
        )
        == []
    )
    assert rejected[("all", "parse error in method")] == 1
