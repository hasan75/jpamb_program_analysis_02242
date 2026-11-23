"""Semantics-preserving rewrite rules 1 and 2 of D6.

Each rule is a function ``(node, scope) -> Rewrite`` that checks the rule's
precondition (raising `Rejected` with a reason when it fails) and returns the
text that replaces ``node``. The docstring of each rule gives its equivalence
argument. Shared precondition (D6): every compared operand is a side-effect-free
`int` expression (`javaexpr.classify`), and no rule adds, removes or changes
run-time arithmetic.
"""

from dataclasses import dataclass

import tree_sitter
from javaexpr import (
    COMPARISONS,
    INT_MAX,
    INT_MIN,
    Rejected,
    Scope,
    comparison,
    int_literal,
    text,
)

NEGATE = {"<": ">=", "<=": ">", ">": "<=", ">=": "<", "==": "!=", "!=": "=="}
FLIP = {"<": ">", "<=": ">=", ">": "<", ">=": "<=", "==": "==", "!=": "!="}

# Precedence levels of the negated condition text.
OR, AND, ATOM = 1, 2, 3


@dataclass(frozen=True)
class Rewrite:
    rule: str
    node: tree_sitter.Node  # the node whose text is replaced
    rewritten: str


def op_of(node: tree_sitter.Node) -> str:
    return text(node.child_by_field_name("operator"))


def check_condition(node: tree_sitter.Node, scope: Scope) -> None:
    """A condition built only from int comparisons, `&&`, `||`, `!` and `( )`."""
    match node.type:
        case "parenthesized_expression":
            check_condition(node.named_children[0], scope)
        case "unary_expression" if op_of(node) == "!":
            check_condition(node.child_by_field_name("operand"), scope)
        case "binary_expression" if op_of(node) in ("&&", "||"):
            check_condition(node.child_by_field_name("left"), scope)
            check_condition(node.child_by_field_name("right"), scope)
        case _:
            comparison(node, scope)


def negate(node: tree_sitter.Node) -> tuple[str, int]:
    """The text of the negation of a checked condition, and its precedence.

    Comparisons are negated in place, `!e` becomes `e`, and `&&`/`||` follow
    De Morgan. Operands keep their order, so short-circuit evaluation visits
    the same operands in the same order (see `invert`).
    """
    match node.type:
        case "parenthesized_expression":
            return negate(node.named_children[0])
        case "unary_expression":  # `!e`; `e` is a unary-level expression
            return text(node.child_by_field_name("operand")), ATOM
        case "binary_expression" if op_of(node) in ("&&", "||"):
            left = negate(node.child_by_field_name("left"))
            right = negate(node.child_by_field_name("right"))
            if op_of(node) == "&&":  # !(a && b) = !a || !b
                return f"{left[0]} || {right[0]}", OR

            def wrap(t: tuple[str, int]) -> str:
                return f"({t[0]})" if t[1] < AND else t[0]

            return f"{wrap(left)} && {wrap(right)}", AND  # !(a || b) = !a && !b
        case _:
            left = text(node.child_by_field_name("left"))
            right = text(node.child_by_field_name("right"))
            return f"{left} {NEGATE[op_of(node)]} {right}", ATOM


def block(node: tree_sitter.Node | None) -> str:
    if node is None:
        return "{}"
    return text(node) if node.type == "block" else "{ " + text(node) + " }"


def invert(node: tree_sitter.Node, scope: Scope) -> Rewrite:
    """R1. ``if (c) A else B`` → ``if (¬c) {B} else {A}`` (no else: B = ``{}``).

    Precondition: ``c`` is built from int comparisons of pure operands with
    `&&`, `||`, `!` and parentheses.

    Equivalence: ¬c is computed by De Morgan and by negating each comparison
    (on ints, ``!(a < b)`` is ``a >= b``, etc.). By induction on ``c``, ¬c
    evaluates the same operands in the same order as ``c`` (``!a || !b`` reads
    ``b`` exactly when ``a`` holds, like ``a && b``), so it raises the same
    exception when ``c`` does, and otherwise is true exactly when ``c`` is
    false. Then ``B`` runs exactly when it ran before, and likewise ``A``.
    Braces around both branches keep each ``else`` bound to our ``if`` (else-if
    chains, an inner ``if`` without ``else``). They change no scope, because a
    branch of an ``if`` cannot itself be a declaration.
    """
    if node.type != "if_statement":
        raise Rejected("not an if statement")
    cond = node.child_by_field_name("condition")
    check_condition(cond, scope)
    negated, _ = negate(cond)
    then, other = (
        node.child_by_field_name("consequence"),
        node.child_by_field_name("alternative"),
    )
    return Rewrite(
        "R1-invert", node, f"if ({negated}) {block(other)} else {block(then)}"
    )


def operands(node: tree_sitter.Node) -> tuple[str, str, str]:
    return (
        text(node.child_by_field_name("left")),
        op_of(node),
        text(node.child_by_field_name("right")),
    )


def swap(node: tree_sitter.Node, scope: Scope) -> Rewrite:
    """R2. ``a op b`` → ``b op' a`` (``a < b`` → ``b > a``; ``==``, ``!=`` stay).

    Precondition: at most one of ``a``, ``b`` may throw.

    Equivalence: the operands are pure, so evaluating them in the other order
    gives the same values, and the mirrored comparison is the same relation.
    Java evaluates the left operand first; if both could throw, swapping could
    change which exception is raised, hence the precondition.
    """
    left, right = comparison(node, scope)
    if left.may_throw and right.may_throw:
        raise Rejected("both operands may throw")
    a, op, b = operands(node)
    return Rewrite("R2-swap", node, f"{b} {FLIP[op]} {a}")


def strict(node: tree_sitter.Node, scope: Scope) -> Rewrite:
    """R2. Strict ↔ non-strict against a literal: ``x > c`` → ``x >= c+1``,
    ``x >= c`` → ``x > c-1``, ``x < c`` → ``x <= c-1``, ``x <= c`` → ``x < c+1``
    (mirrored when the literal is on the left).

    Precondition: ``c`` is a decimal int literal and ``c±1`` is an int.

    Equivalence: on integers ``x > c`` iff ``x >= c+1``, and so on. The new
    literal is computed here, not at run time, so no arithmetic is added, and
    the bound check excludes ``c = MAX_VALUE`` / ``MIN_VALUE`` where ``c±1``
    would not be an int. ``x`` is evaluated once, as before.
    """
    comparison(node, scope)
    a, op, b = operands(node)
    if op in ("==", "!="):
        raise Rejected("equality has no strict form")
    right = int_literal(node.child_by_field_name("right"))
    left = int_literal(node.child_by_field_name("left"))
    # (new operator, delta) for a literal on the right; mirrored on the left.
    on_right = {">": (">=", 1), ">=": (">", -1), "<": ("<=", -1), "<=": ("<", 1)}
    on_left = {"<": ("<=", 1), "<=": ("<", -1), ">": (">=", -1), ">=": (">", 1)}
    if right is not None:
        new_op, d = on_right[op]
        c = right + d
        result = f"{a} {new_op} {c}"
    elif left is not None:
        new_op, d = on_left[op]
        c = left + d
        result = f"{c} {new_op} {b}"
    else:
        raise Rejected("no decimal int literal")
    if not INT_MIN <= c <= INT_MAX:
        raise Rejected("literal at the int limit")
    return Rewrite("R2-strict", node, result)


def split(node: tree_sitter.Node, scope: Scope) -> Rewrite:
    """R2. ``a != b`` → ``(a < b || a > b)``; ``a == b`` → ``(a <= b && a >= b)``.

    Precondition: both operands are pure int expressions.

    Equivalence: on integers ``a != b`` iff ``a < b`` or ``a > b``, and
    ``a == b`` iff ``a <= b`` and ``a >= b``. The operands may be evaluated a
    second time; being pure, they give the same values again, and if one
    throws, it throws already in the first comparison, in the original order.
    The parentheses keep the result one operand wherever ``node`` stood.
    """
    comparison(node, scope)
    a, op, b = operands(node)
    if op == "!=":
        return Rewrite("R2-split", node, f"({a} < {b} || {a} > {b})")
    if op == "==":
        return Rewrite("R2-split", node, f"({a} <= {b} && {a} >= {b})")
    raise Rejected("not an equality")


R1_RULES = (invert,)
R2_RULES = (swap, strict, split)
RULE_NAMES = ("R1-invert", "R2-swap", "R2-strict", "R2-split")


def is_comparison(node: tree_sitter.Node) -> bool:
    return node.type == "binary_expression" and op_of(node) in COMPARISONS
