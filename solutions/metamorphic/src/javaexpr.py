"""Syntactic checks shared by all rewrite rules (D6 preconditions).

A rule may only touch a comparison whose operands are side-effect-free `int`
expressions. tree-sitter gives no types, so types come from the declarations in
the enclosing method; anything this module cannot prove to be a pure `int`
expression is rejected. Rejecting is always safe: it only removes a site.
"""

from dataclasses import dataclass

import tree_sitter
import tree_sitter_java

LANGUAGE = tree_sitter.Language(tree_sitter_java.language())
PARSER = tree_sitter.Parser(LANGUAGE)

COMPARISONS = {"<", "<=", ">", ">=", "==", "!="}
# int operators; `/` and `%` throw on a zero divisor.
ARITHMETIC = {"+", "-", "*", "/", "%", "&", "|", "^", "<<", ">>", ">>>"}
THROWING = {"/", "%"}

INT_MIN, INT_MAX = -(2**31), 2**31 - 1


def parse(source: bytes) -> tree_sitter.Tree:
    return PARSER.parse(source)


def text(node: tree_sitter.Node) -> str:
    return node.text.decode()


class Rejected(Exception):
    """An expression or statement fails a precondition; `args[0]` is the reason."""


@dataclass(frozen=True)
class Expr:
    """A pure `int` expression; `may_throw` if evaluating it can raise."""

    may_throw: bool


def _type_of(type_node: tree_sitter.Node, declarator: tree_sitter.Node | None) -> str:
    t = text(type_node).replace(" ", "")
    if declarator is not None:
        dims = declarator.child_by_field_name("dimensions")
        if dims is not None:  # C-style `int a[]`
            t += text(dims).replace(" ", "")
    return t


@dataclass(frozen=True)
class Decl:
    """One declaration of a name: its type, and the node and byte position
    from which it is in scope (to the end of ``container``)."""

    type: str
    container: tree_sitter.Node
    start: int


def declared_types(method: tree_sitter.Node) -> dict[str, list[Decl]]:
    """Every name declared anywhere in the method, with each declaration.

    Pattern variables, lambda parameters and resources are recorded with the
    unknown type ``?``, which makes every use of that name non-`int`.
    """
    decls: dict[str, list[Decl]] = {}

    def add(name: tree_sitter.Node | None, t: str, container: tree_sitter.Node) -> None:
        if name is not None:
            decls.setdefault(text(name), []).append(Decl(t, container, name.start_byte))

    def unknown(name: tree_sitter.Node | None) -> None:
        add(name, "?", method)

    def walk(n: tree_sitter.Node) -> None:
        match n.type:
            case "formal_parameter" if (
                n.parent is not None and n.parent.parent == method
            ):
                tnode = n.child_by_field_name("type")
                add(n.child_by_field_name("name"), _type_of(tnode, n), method)
            case "catch_formal_parameter":
                tnode = n.child_by_field_name("type")
                add(
                    n.child_by_field_name("name"),
                    _type_of(tnode, n) if tnode else "?",
                    n.parent,
                )
            case "local_variable_declaration":
                tnode = n.child_by_field_name("type")
                for d in n.children_by_field_name("declarator"):
                    add(d.child_by_field_name("name"), _type_of(tnode, d), n.parent)
            case "enhanced_for_statement":
                tnode = n.child_by_field_name("type")
                add(n.child_by_field_name("name"), _type_of(tnode, n), n)
            case "instanceof_expression":
                unknown(n.child_by_field_name("name"))
            case t if "pattern" in t:
                for c in n.children:
                    if c.type == "identifier":
                        unknown(c)
            case (
                "formal_parameter"
                | "spread_parameter"
                | "lambda_expression"
                | "resource"
                | "field_declaration"
            ):
                # Other binders (lambda or nested-class parameters, fields of
                # local classes): their names are never taken as `int`.
                for c in n.children:
                    if c.type == "identifier":
                        unknown(c)
                    elif c.type == "variable_declarator":
                        unknown(c.child_by_field_name("name"))
                    elif c.type in ("inferred_parameters", "formal_parameters"):
                        for p in c.named_children:
                            if p.type == "identifier":
                                unknown(p)
        for c in n.children:
            walk(c)

    walk(method)
    return decls


FIELD_LIKE = {"field_declaration", "constant_declaration"}


def field_names(root: tree_sitter.Node) -> set[str]:
    """Names of all fields, interface constants, enum constants and record
    components declared in the file; such names are never trusted as locals."""
    names = set()

    def walk(n: tree_sitter.Node) -> None:
        if n.type in FIELD_LIKE:
            for d in n.children_by_field_name("declarator"):
                names.add(text(d.child_by_field_name("name")))
        elif n.type == "enum_constant":
            names.add(text(n.child_by_field_name("name")))
        elif n.type == "record_declaration":
            for p in n.child_by_field_name("parameters").named_children:
                if (name := p.child_by_field_name("name")) is not None:
                    names.add(text(name))
        for c in n.children:
            walk(c)

    walk(root)
    return names


@dataclass
class Scope:
    decls: dict[str, list[Decl]]
    fields: set[str]

    def type_at(self, use: tree_sitter.Node) -> str | None:
        """The type of the name used at ``use``, or None if unsure.

        Known only if every declaration of the name in the method has the same
        type, no field has the name, and one declaration is in scope at the use
        (its container encloses the use and it comes before it). A name used
        outside all its local declarations may be a field from another file or
        a static import, so it is not trusted.
        """
        name = text(use)
        ds = self.decls.get(name, [])
        if name in self.fields or not ds or len({d.type for d in ds}) != 1:
            return None
        in_scope = any(
            d.container.start_byte <= use.start_byte
            and use.end_byte <= d.container.end_byte
            and d.start <= use.start_byte
            for d in ds
        )
        return ds[0].type if in_scope else None


def int_literal(node: tree_sitter.Node) -> int | None:
    """The value of a decimal `int` literal, possibly negated (`-27183`).

    Hex, octal and binary literals are left out: their value is the 32-bit
    two's complement of the digits (`0xFFFFFFFF` is -1), so reading them is
    error-prone and no rule needs them.
    """
    sign = 1
    while node.type == "parenthesized_expression":
        node = node.named_children[0]
    if (
        node.type == "unary_expression"
        and text(node.child_by_field_name("operator")) == "-"
    ):
        sign, node = -1, node.child_by_field_name("operand")
    if node.type != "decimal_integer_literal":
        return None
    digits = text(node).replace("_", "")
    if digits[-1] in "lL":
        return None
    value = sign * int(digits)
    return value if INT_MIN <= value <= INT_MAX else None


def classify(node: tree_sitter.Node, scope: Scope) -> Expr:
    """Check that ``node`` is a pure `int` expression, or raise `Rejected`."""
    match node.type:
        case "identifier":
            t = scope.type_at(node)
            if t != "int":
                raise Rejected(f"not an int local: {text(node)}")
            return Expr(may_throw=False)
        case (
            "decimal_integer_literal"
            | "hex_integer_literal"
            | "octal_integer_literal"
            | "binary_integer_literal"
        ):
            if text(node)[-1] in "lL":
                raise Rejected("long literal")
            return Expr(may_throw=False)
        case "parenthesized_expression":
            return classify(node.named_children[0], scope)
        case "unary_expression":
            op = text(node.child_by_field_name("operator"))
            if op not in ("-", "+", "~"):
                raise Rejected(f"unary {op}")
            return classify(node.child_by_field_name("operand"), scope)
        case "binary_expression":
            op = text(node.child_by_field_name("operator"))
            if op not in ARITHMETIC:
                raise Rejected(f"operator {op} in operand")
            left = classify(node.child_by_field_name("left"), scope)
            right = classify(node.child_by_field_name("right"), scope)
            return Expr(may_throw=left.may_throw or right.may_throw or op in THROWING)
        case "field_access":
            obj = node.child_by_field_name("object")
            field = text(node.child_by_field_name("field"))
            if field == "length" and obj.type == "identifier":
                t = scope.type_at(obj)
                if t is not None and t.endswith("[]"):
                    return Expr(may_throw=True)  # null array
            raise Rejected("field access")
        case "array_access":
            array = node.child_by_field_name("array")
            if array.type != "identifier" or scope.type_at(array) != "int[]":
                raise Rejected("not an int[] access")
            classify(node.child_by_field_name("index"), scope)
            return Expr(may_throw=True)  # null array or index out of bounds
        case "method_invocation":
            raise Rejected("method call")
        case "update_expression":
            raise Rejected("++/--")
        case "assignment_expression":
            raise Rejected("assignment")
        case "character_literal":
            raise Rejected("char")
        case _:
            raise Rejected(node.type)


def comparison(node: tree_sitter.Node, scope: Scope) -> tuple[Expr, Expr]:
    """Check that ``node`` compares two pure `int` expressions."""
    if node.type != "binary_expression":
        raise Rejected(f"not a comparison: {node.type}")
    op = text(node.child_by_field_name("operator"))
    if op not in COMPARISONS:
        raise Rejected(f"not a comparison: {op}")
    return (
        classify(node.child_by_field_name("left"), scope),
        classify(node.child_by_field_name("right"), scope),
    )
