"""Find rewrite sites in JPAMB Java sources (tree-sitter-java)."""
import os
import re
from dataclasses import dataclass
import tree_sitter_java as tsj
from tree_sitter import Language, Parser

PARSER = Parser(Language(tsj.language()))
CMP = {">", ">=", "<", "<=", "==", "!="}


@dataclass
class Site:
    file: str
    cls: str
    method: str
    line: int
    var: str
    op: str
    const: int
    const_text: str
    start: int  # byte span of the condition expression
    end: int
    method_start: int


@dataclass
class MethodInfo:
    cls: str
    name: str
    arity: int
    all_int: bool
    case_inputs: list


def walk(n):
    yield n
    for c in n.children:
        yield from walk(c)


def int_literal(n):
    """Return (value, text) for `5` or `-5`, else None."""
    if n.type == "decimal_integer_literal":
        t = n.text.decode()
        if t.isdigit():
            return int(t), t
    if n.type == "unary_expression" and n.children[0].text == b"-":
        inner = n.children[-1]
        if inner.type == "decimal_integer_literal" and inner.text.decode().isdigit():
            return -int(inner.text), "-" + inner.text.decode()
    return None


def int_vars(method):
    names = set()
    for n in walk(method):
        if n.type == "formal_parameter":
            t = n.child_by_field_name("type")
            if t is not None and t.text == b"int":
                names.add(n.child_by_field_name("name").text.decode())
        if n.type == "local_variable_declaration":
            t = n.child_by_field_name("type")
            if t is not None and t.text == b"int":
                for d in n.children_by_field_name("declarator"):
                    names.add(d.child_by_field_name("name").text.decode())
    return names


def scan(path):
    """Return (src_bytes, [Site], [MethodInfo])."""
    src = open(path, "rb").read()
    tree = PARSER.parse(src)
    sites, infos = [], []
    for cd in walk(tree.root_node):
        if cd.type != "class_declaration":
            continue
        cls = cd.child_by_field_name("name").text.decode()
        for m in walk(cd.child_by_field_name("body")):
            if m.type != "method_declaration":
                continue
            name = m.child_by_field_name("name").text.decode()
            params = m.child_by_field_name("parameters").named_children
            all_int = all(
                p.type == "formal_parameter" and p.child_by_field_name("type").text == b"int"
                for p in params
            )
            cases = []
            for mm in re.finditer(r'@Case\("\(([^)]*)\)', m.text.decode()):
                try:
                    cases.append([int(x) for x in mm.group(1).split(",") if x.strip()])
                except ValueError:
                    pass
            infos.append(MethodInfo(cls, name, len(params), all_int, cases))
            ivars = int_vars(m)
            for n in walk(m):
                if n.type != "if_statement":
                    continue
                cond = n.child_by_field_name("condition").named_children[0]
                if cond.type != "binary_expression":
                    continue
                op = cond.child_by_field_name("operator").text.decode()
                l, r = cond.child_by_field_name("left"), cond.child_by_field_name("right")
                lit = int_literal(r)
                if (op in CMP and l.type == "identifier" and l.text.decode() in ivars
                        and lit is not None):
                    sites.append(Site(os.path.basename(path), cls, name, n.start_point[0] + 1,
                                      l.text.decode(), op, lit[0], lit[1],
                                      cond.start_byte, cond.end_byte, m.start_byte))
    return src, sites, infos