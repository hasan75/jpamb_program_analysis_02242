from dataclasses import dataclass
from pathlib import Path

import tree_sitter
import tree_sitter_java
import re

JAVA_LANGUAGE = tree_sitter.Language(tree_sitter_java.language())

COMPARISON_OPERATORS = {
    "<",
    "<=",
    ">",
    ">=",
    "==",
    "!=",
}

@dataclass(frozen=True)
class RewriteSite:
    kind: str
    start_byte: int
    end_byte: int
    condition: str
    operator: str
    operator_start_byte: int
    operator_end_byte: int
    left_expression: str
    right_expression: str
    consequence_start_byte: int | None = None
    consequence_end_byte: int | None = None
    alternative_start_byte: int | None = None
    alternative_end_byte: int | None = None
    method_start_byte: int | None = None
    method_end_byte: int | None = None

# Tree-sitter byte offsets are used to preserve the original source while replacing only the selected comparison operator.
def find_rewrite_sites(source: bytes) -> list[RewriteSite]:
    parser = tree_sitter.Parser(JAVA_LANGUAGE)
    tree = parser.parse(source)

    sites = []

    def visit(node, current_method=None):
        if node.type in ("method_declaration", "constructor_declaration"):
            current_method = node

        if node.type in (
            "if_statement",
            "while_statement",
            "for_statement",
            "do_statement",
        ):
            condition_node = node.child_by_field_name("condition")

            if condition_node is not None:
                expression = condition_node

                if expression.type == "parenthesized_expression":
                    if expression.named_children:
                        expression = expression.named_children[0]

                if expression.type == "binary_expression":
                    operator = next(
                        (
                            child
                            for child in expression.children
                            if child.type in COMPARISON_OPERATORS
                        ),
                        None,
                    )

                    left = expression.child_by_field_name("left")
                    right = expression.child_by_field_name("right")

                    if operator is not None and left is not None and right is not None:
                        consequence = (
                            node.child_by_field_name("consequence")
                            if node.type == "if_statement"
                            else None
                        )
                        alternative = (
                            node.child_by_field_name("alternative")
                            if node.type == "if_statement"
                            else None
                        )

                        sites.append(
                            RewriteSite(
                                kind=node.type,
                                start_byte=condition_node.start_byte,
                                end_byte=condition_node.end_byte,
                                condition=condition_node.text.decode(),
                                operator=operator.type,
                                operator_start_byte=operator.start_byte,
                                operator_end_byte=operator.end_byte,
                                left_expression=left.text.decode(),
                                right_expression=right.text.decode(),
                                consequence_start_byte=(
                                    consequence.start_byte if consequence else None
                                ),
                                consequence_end_byte=(
                                    consequence.end_byte if consequence else None
                                ),
                                alternative_start_byte=(
                                    alternative.start_byte if alternative else None
                                ),
                                alternative_end_byte=(
                                    alternative.end_byte if alternative else None
                                ),
                                method_start_byte=(
                                    current_method.start_byte
                                    if current_method is not None
                                    else None
                                ),
                                method_end_byte=(
                                    current_method.end_byte
                                    if current_method is not None
                                    else None
                                ),
                            )
                        )

        for child in node.children:
            visit(child, current_method)

    visit(tree.root_node)
    return sites

def find_integer_variables(method_node) -> set[str]:
    variables = set()

    parameters = method_node.child_by_field_name("parameters")

    if parameters is not None:
        for parameter in parameters.named_children:
            if parameter.type == "formal_parameter":
                type_node = parameter.child_by_field_name("type")
                name_node = parameter.child_by_field_name("name")

                if (
                    type_node is not None
                    and type_node.type == "integral_type"
                    and name_node is not None
                ):
                    variables.add(name_node.text.decode())

    body = method_node.child_by_field_name("body")

    if body is not None:
        def visit(node):
            if node.type == "local_variable_declaration":
                type_node = node.child_by_field_name("type")

                if type_node is not None and type_node.type == "integral_type":
                    for declarator in node.named_children:
                        if declarator.type == "variable_declarator":
                            name_node = declarator.child_by_field_name("name")

                            if name_node is not None:
                                variables.add(name_node.text.decode())

            for child in node.named_children:
                visit(child)

        visit(body)

    return variables

# Only variables declared in scopes visible at the rewrite site are considered when checking whether a comparison is safe.
def find_integer_variables_for_site(
    source: bytes,
    site: RewriteSite,
) -> set[str]:
    if site.method_start_byte is None or site.method_end_byte is None:
        return set()

    parser = tree_sitter.Parser(JAVA_LANGUAGE)
    tree = parser.parse(source)

    def find_method(node):
        if (
            node.type in ("method_declaration", "constructor_declaration")
            and node.start_byte == site.method_start_byte
            and node.end_byte == site.method_end_byte
        ):
            return node

        for child in node.children:
            result = find_method(child)

            if result is not None:
                return result

        return None

    method = find_method(tree.root_node)

    if method is None:
        return set()

    variables = set()

    parameters = method.child_by_field_name("parameters")

    if parameters is not None:
        for parameter in parameters.named_children:
            if parameter.type == "formal_parameter":
                type_node = parameter.child_by_field_name("type")
                name_node = parameter.child_by_field_name("name")

                if (
                    type_node is not None
                    and type_node.type == "integral_type"
                    and name_node is not None
                ):
                    variables.add(name_node.text.decode())

    body = method.child_by_field_name("body")

    if body is None:
        return variables

    scope_types = {
        "block",
        "for_statement",
        "enhanced_for_statement",
        "catch_clause",
        "lambda_expression",
    }

    def find_site_scope(node, current_scope=None):
        if node.type in scope_types:
            current_scope = node

        for child in node.children:
            if child.start_byte <= site.start_byte <= child.end_byte:
                return find_site_scope(child, current_scope)

        return current_scope

    site_scope = find_site_scope(body)

    def visit(node):
        if (
            node.type == "local_variable_declaration"
            and node.start_byte < site.start_byte
        ):
            declaration_scope = node.parent

            while (
                declaration_scope is not None
                and declaration_scope.type not in scope_types
            ):
                declaration_scope = declaration_scope.parent

            is_visible_scope = False
            current_scope = site_scope

            while current_scope is not None:
                if (
                    declaration_scope is not None
                    and declaration_scope.start_byte == current_scope.start_byte
                    and declaration_scope.end_byte == current_scope.end_byte
                ):
                    is_visible_scope = True
                    break

                current_scope = current_scope.parent

            if is_visible_scope:
                type_node = node.child_by_field_name("type")

                if type_node is not None and type_node.type == "integral_type":
                    for declarator in node.named_children:
                        if declarator.type == "variable_declarator":
                            name_node = declarator.child_by_field_name("name")

                            if name_node is not None:
                                variables.add(name_node.text.decode())

        for child in node.named_children:
            visit(child)

    visit(body)

    return variables

def find_rewrite_sites_in_file(path: Path) -> list[RewriteSite]:
    return find_rewrite_sites(path.read_bytes())

INVERTED_OPERATORS = {
    "<": ">=",
    "<=": ">",
    ">": "<=",
    ">=": "<",
    "==": "!=",
    "!=": "==",
}

def invert_comparison(source: bytes, site: RewriteSite) -> bytes:
    if site.operator not in INVERTED_OPERATORS:
        raise ValueError(f"Unsupported operator: {site.operator}")

    inverted_operator = INVERTED_OPERATORS[site.operator]

    return (
        source[:site.operator_start_byte]
        + inverted_operator.encode()
        + source[site.operator_end_byte:]
    )

def invert_if_comparison(
    source: bytes,
    site: RewriteSite,
    integer_variables: set[str] | None = None,
) -> bytes:
    if site.kind != "if_statement":
        raise ValueError("Only if statements can be inverted")

    if site.consequence_start_byte is None or site.consequence_end_byte is None:
        raise ValueError("Missing consequence branch")

    if site.operator not in INVERTED_OPERATORS:
        raise ValueError(f"Unsupported operator: {site.operator}")

    if integer_variables is None:
        if site.method_start_byte is None or site.method_end_byte is None:
            return source

        integer_variables = find_integer_variables_for_site(source, site)

    if not is_safe_comparison(site, integer_variables):
        return source

    consequence = source[
        site.consequence_start_byte:site.consequence_end_byte
    ]

    inverted_operator = INVERTED_OPERATORS[site.operator].encode()

    if site.alternative_start_byte is None:
        replacement = b"{ } else " + consequence

        return (
            source[:site.operator_start_byte]
            + inverted_operator
            + source[site.operator_end_byte:site.consequence_start_byte]
            + replacement
            + source[site.consequence_end_byte:]
        )

    alternative = source[
        site.alternative_start_byte:site.alternative_end_byte
    ]

    return (
        source[:site.operator_start_byte]
        + inverted_operator
        + source[site.operator_end_byte:site.consequence_start_byte]
        + alternative
        + source[site.consequence_end_byte:site.alternative_start_byte]
        + consequence
        + source[site.alternative_end_byte:]
    )

# Restrict rewrites to integer variables and integer literals to avoid changing the semantics of other Java comparisons.
def is_integer_operand(expression, integer_variables: set[str]) -> bool:
    expression = expression.strip()

    if expression in integer_variables:
        return True

    integer_literal = (
        r"(?:"
        r"0"
        r"|[1-9](?:_?[0-9])*"
        r"|0[xX][0-9a-fA-F](?:_?[0-9a-fA-F])*"
        r"|0[bB][01](?:_?[01])*"
        r"|0[0-7](?:_?[0-7])*"
        r")[lL]?"
    )

    return re.fullmatch(integer_literal, expression) is not None

def is_safe_comparison(site: RewriteSite, integer_variables: set[str]) -> bool:
    if site.operator not in INVERTED_OPERATORS:
        return False

    return (
        is_integer_operand(site.left_expression, integer_variables)
        and is_integer_operand(site.right_expression, integer_variables)
    )