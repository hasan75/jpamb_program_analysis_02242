"""Semantics-preserving rewrites of `var op const` (int only). Each returns new text or None.

Preconditions (checked here, before applying):
  * var is an int variable and const an int literal (guaranteed by sites.py),
  * |const| < 2**30 so const +/- 1 cannot overflow,
  * the condition has no side effects (a bare variable and a literal never do).
"""

MIRROR = {">": "<", ">=": "<=", "<": ">", "<=": ">=", "==": "==", "!=": "!="}
SHIFT = {">": (">=", 1), "<=": ("<", 1), "<": ("<=", -1), ">=": (">", -1)}
SAFE = 2 ** 30


def shift(s):
    if s.op not in SHIFT or abs(s.const) >= SAFE:
        return None
    op, d = SHIFT[s.op]
    return f"{s.var} {op} {s.const + d}"


def swap(s):
    return f"{s.const_text} {MIRROR[s.op]} {s.var}"


def ne_split(s):
    if s.op != "!=":
        return None
    return f"({s.var} < {s.const_text} || {s.var} > {s.const_text})"


def eq_negate(s):
    if s.op != "==":
        return None
    return f"!({s.var} != {s.const_text})"


def double_negate(s):
    return f"!(!({s.var} {s.op} {s.const_text}))"


def bad_shift(s):
    """CONTROL: deliberately wrong (off by one). The validator MUST reject this."""
    if s.op != ">":
        return None
    return f"{s.var} >= {s.const_text}"


REWRITES = {"shift": shift, "swap": swap, "ne_split": ne_split,
            "eq_negate": eq_negate, "double_negate": double_negate}
CONTROLS = {"bad_shift": bad_shift}


def apply(src: bytes, site, new_cond: str) -> bytes:
    return src[:site.start] + new_cond.encode() + src[site.end:]