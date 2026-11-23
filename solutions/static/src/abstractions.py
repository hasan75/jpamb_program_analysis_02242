import math
from abc import ABC, abstractmethod
from collections.abc import Iterable
from dataclasses import dataclass
from typing import Literal, Self

import jvm
import jvm.state as jvms


class Poset(ABC):
    @abstractmethod
    def __eq__(self, other: Self) -> bool: ...

    @abstractmethod
    def __lt__(self, other: Self) -> bool: ...

    def __le__(self, other: Self) -> bool:
        return self == other or self < other

    @abstractmethod
    def __gt__(self, other: Self) -> bool: ...

    def __ge__(self, other: Self) -> bool:
        return self == other or self > other


def is_reflexive(a: Poset):
    # Checking if the relation is reflexive (a == a)
    assert a == a, f"Reflexivity check failed: Element {a} is not related to itself."  # noqa: PLR0124


def is_antisymmetric(a: Poset, b: Poset):
    if a != b:
        # Checking that if a <= b and b <= a, then a must equal b
        assert not (a <= b <= a), (
            f"Antisymmetry violation: Found elements where {a} <= {b} and {b} <= {a}, "
            f"but {a} != {b}."
        )


def is_transitive(a: Poset, b: Poset, c: Poset):
    if a <= b <= c:
        # Checking that if a <= b and b <= c, then a <= c
        assert a <= c, (
            f"Transitivity violation: Found path {a} <= {b} and {b} <= {c}, "
            f"but {a} is not related to {c}."
        )


def is_poset(a: Poset, b: Poset, c: Poset):
    for x in [a, b, c]:
        is_reflexive(x)

    for x in [b, c]:
        is_antisymmetric(a, x)

    is_transitive(a, b, c)


class Lattice(Poset):
    @classmethod
    @abstractmethod
    def top(cls) -> Self:
        raise NotImplementedError(f"top: {cls}")

    @classmethod
    def bot(cls) -> Self:
        return cls.abstract([])

    @abstractmethod
    def __or__(self, other: Self) -> Self: ...

    @abstractmethod
    def __and__(self, other: Self) -> Self: ...


def is_lattice_identities(a: Lattice):
    # Top element identity checks
    assert (a | a.top()) == a.top(), (
        f"Top identity fail: ({a} | {a.top()}) -> {a | a.top()} != {a.top()}"
    )
    assert (a.top() | a) == a.top(), (
        f"Top identity fail (commute): ({a.top()} | {a}) != {a.top()}"
    )
    assert (a & a.top()) == a, f"Top identity fail (meet): ({a} & {a.top()}) != {a}"
    assert (a.top() & a) == a, (
        f"Top identity fail (meet commute): ({a.top()} & {a}) != {a}"
    )

    # Bottom element identity checks
    assert (a & a.bot()) == a.bot(), (
        f"Bottom identity fail: ({a} & {a.bot()}) != {a.bot()}"
    )
    assert (a.bot() & a) == a.bot(), (
        f"Bottom identity fail (commute): ({a.bot()} & {a}) != {a.bot()}"
    )
    assert (a.bot() | a) == a, f"Bottom identity fail (join): ({a.bot()} | {a}) != {a}"
    assert (a | a.bot()) == a, (
        f"Bottom identity fail (join commute): ({a} | {a.bot()}) != {a}"
    )


def is_lattice(a: Lattice, b: Lattice, c: Lattice):
    for x in [a, b, c]:
        is_lattice_identities(x)

    if not (a | b <= c):
        # Calculate values for the error message
        assert not (a <= c and b <= c), (
            f"Upper bound check failed: ({a} | {b}) -> {a | b} is not <= {c}. "
            f"Check individual bounds: {a <= c=}, {b <= c=}."
        )

    if not (c <= a & b):
        # Calculate values for the error message
        assert not (c <= a and c <= b), (
            f"Lower bound check failed: {c} is not <= ({a} & {b}) -> {a & b}. "
            f"Check individual bounds: {c <= a=}, {c <= b=}."
        )


class Abstraction(ABC):
    """This is the minimal interface for an abstraction."""

    @classmethod
    @abstractmethod
    def abstract(cls, values: Iterable[jvms.StackValue]) -> Self:
        raise NotImplementedError(f"abstract: {cls}")

    @abstractmethod
    def __contains__(self, value: jvms.StackValue) -> bool: ...


def is_galoi(a: set[jvms.StackValue], b: Abstraction):
    alpha_a = b.abstract(a)

    for value in a:
        assert value in alpha_a, f"{value} not in {a}"

    if alpha_a <= b:
        for value in a:
            assert value in b, f"{value} not in {b}"


type Sign = Literal[-1, 0, 1]


def to_sign(value: jvms.StackValue) -> Sign:
    match value:
        case jvms.StackInt(v):
            return (v > 0) - (v < 0)
        case a:
            raise NotImplementedError(f"Unsupported value {value!r}")


@dataclass(frozen=True, order=True)
class SignSet(Abstraction, Lattice):
    signs: frozenset[Sign]

    def __str__(self):
        return f"{{{''.join(z for z, b in zip('-0+', [-1, 0, 1]) if b in self.signs)}}}"

    def __sexpr__(self):
        return str(self)

    def to_json(self) -> list[str]:
        """The signs as a list, e.g. ``["-", "+"]``; ``[]`` is bottom."""
        return [z for z, b in zip("-0+", [-1, 0, 1]) if b in self.signs]

    @classmethod
    def from_sign(cls, code):
        return cls(frozenset(b for z, b in zip("-0+", [-1, 0, 1]) if z in code))

    @classmethod
    def abstract(cls, values: Iterable[jvms.StackValue]) -> Self:
        signs = set()
        for value in values:
            signs.add(to_sign(value))
        return cls(frozenset(signs))

    def __contains__(self, value: jvms.StackValue) -> bool:
        return to_sign(value) in self.signs

    @classmethod
    def top(cls) -> Self:
        return cls(frozenset([-1, 0, 1]))

    @classmethod
    def positive(cls) -> Self:
        return cls.from_sign("+")

    @classmethod
    def nonnegative(cls) -> Self:
        return cls.from_sign("0+")

    def widen(self, other: "SignSet") -> "SignSet":
        """The sign lattice is finite, so the join already terminates."""
        return self | other

    def __or__(self, other: "SignSet") -> "SignSet":
        if not isinstance(other, SignSet):
            return NotImplemented

        return SignSet(self.signs | other.signs)

    def __and__(self, other: "SignSet") -> "SignSet":
        if not isinstance(other, SignSet):
            return NotImplemented

        return SignSet(self.signs & other.signs)

    def arithmetic(
        self, other: "SignSet", opr: jvm.BinaryOpr
    ) -> tuple["SignSet", set[str]]:
        output = set()
        errors = set()
        for x in self.signs:
            for y in other.signs:
                if y == 0 and opr in (jvm.BinaryOpr.Div, jvm.BinaryOpr.Rem):
                    errors.add("divide by zero")
                    continue
                for a in REPRESENTATIVES[x]:
                    for b in REPRESENTATIVES[y]:
                        output.add(sign_of(java_binary(opr, a, b)))
        return (SignSet(frozenset(output)), errors)

    def compare(self, other: "SignSet", opr: jvm.CmpOpr) -> Iterable[bool]:
        cases = set()
        for x in self.signs:
            for y in other.signs:
                for a in REPRESENTATIVES[x]:
                    for b in REPRESENTATIVES[y]:
                        cases.add(java_compare(opr, a, b))
        return cases

    def refine(
        self, other: "SignSet", opr: jvm.CmpOpr, outcome: bool
    ) -> tuple["SignSet", "SignSet"]:
        """Narrowing at a branch: the parts of ``self`` and ``other`` for which
        ``self opr other`` can evaluate to ``outcome``.

        A sign is kept only if some pair of representatives witnesses the
        outcome, so the result is consistent with ``compare``.
        """
        left: set[Sign] = set()
        right: set[Sign] = set()
        for x in self.signs:
            for y in other.signs:
                if any(
                    java_compare(opr, a, b) == outcome
                    for a in REPRESENTATIVES[x]
                    for b in REPRESENTATIVES[y]
                ):
                    left.add(x)
                    right.add(y)
        return SignSet(frozenset(left)), SignSet(frozenset(right))


REPRESENTATIVES: dict[Sign, tuple[int, ...]] = {-1: (-1, -2), 0: (0,), 1: (1, 2)}


def sign_of(v: int) -> Sign:
    return (v > 0) - (v < 0)


def java_binary(opr: jvm.BinaryOpr, a: int, b: int) -> int:
    """Integer semantics of the JVM (division truncates towards zero)."""
    match opr:
        case jvm.BinaryOpr.Add:
            return a + b
        case jvm.BinaryOpr.Sub:
            return a - b
        case jvm.BinaryOpr.Mul:
            return a * b
        case jvm.BinaryOpr.Div:
            q = abs(a) // abs(b)
            return q if (a < 0) == (b < 0) else -q
        case jvm.BinaryOpr.Rem:
            return a - b * java_binary(jvm.BinaryOpr.Div, a, b)
        case _:
            raise NotImplementedError(f"TODO: {opr}")


def java_compare(opr: jvm.CmpOpr, a: int, b: int) -> bool:
    match opr:
        case jvm.CmpOpr.Eq | jvm.CmpOpr.Is:
            # `Is` compares references; the analysis encodes null as 0.
            return a == b
        case jvm.CmpOpr.Ne:
            return a != b
        case jvm.CmpOpr.Lt:
            return a < b
        case jvm.CmpOpr.Le:
            return a <= b
        case jvm.CmpOpr.Gt:
            return a > b
        case jvm.CmpOpr.Ge:
            return a >= b
        case _:
            raise NotImplementedError(f"TODO: {opr}")


INT_MIN, INT_MAX = -(2**31), 2**31 - 1

NEGATED: dict[jvm.CmpOpr, jvm.CmpOpr] = {
    jvm.CmpOpr.Eq: jvm.CmpOpr.Ne,
    jvm.CmpOpr.Ne: jvm.CmpOpr.Eq,
    jvm.CmpOpr.Lt: jvm.CmpOpr.Ge,
    jvm.CmpOpr.Ge: jvm.CmpOpr.Lt,
    jvm.CmpOpr.Le: jvm.CmpOpr.Gt,
    jvm.CmpOpr.Gt: jvm.CmpOpr.Le,
    jvm.CmpOpr.Is: jvm.CmpOpr.Ne,
}


@dataclass(frozen=True, eq=False)
class Interval(Abstraction, Lattice):
    """An interval of Java ints. ``None`` is a missing bound, i.e. the int32 limit.

    Build values with ``Interval.of``: it maps bounds at or beyond the int32
    limits to ``None`` and every empty interval to ``Interval.BOT``.
    """

    min: int | None
    max: int | None

    # -- construction -------------------------------------------------------

    @classmethod
    def of(cls, lo: float | None, hi: float | None) -> "Interval":
        if lo is None or lo <= INT_MIN:
            lo = None
        if hi is None or hi >= INT_MAX:
            hi = None
        if (lo is not None and lo == math.inf) or (hi is not None and hi == -math.inf):
            return BOT
        if lo is not None and hi is not None and lo > hi:
            return BOT
        return cls(None if lo is None else int(lo), None if hi is None else int(hi))

    @property
    def lo(self) -> float:
        return -math.inf if self.min is None else self.min

    @property
    def hi(self) -> float:
        return math.inf if self.max is None else self.max

    def is_bot(self) -> bool:
        return self.lo > self.hi

    def bounds32(self) -> tuple[int, int]:
        """The bounds as concrete int32 values (``None`` read as the limit)."""
        return (
            INT_MIN if self.min is None else self.min,
            INT_MAX if self.max is None else self.max,
        )

    def __str__(self):
        if self.is_bot():
            return "_|_"
        lo = "-inf" if self.min is None else self.min
        hi = "inf" if self.max is None else self.max
        return f"{lo}:{hi}"

    def __sexpr__(self):
        return str(self)

    def to_json(self) -> dict[str, int | None] | str:
        """``{"min", "max"}`` with ``None`` for a missing (int32) bound, or ``"bot"``."""
        if self.is_bot():
            return "bot"
        return {"min": self.min, "max": self.max}

    # -- lattice ------------------------------------------------------------

    def __eq__(self, other) -> bool:
        if not isinstance(other, Interval):
            return NotImplemented
        if self.is_bot() or other.is_bot():
            return self.is_bot() and other.is_bot()
        return (self.min, self.max) == (other.min, other.max)

    def __hash__(self):
        return hash(None) if self.is_bot() else hash((self.min, self.max))

    def _includes(self, other: "Interval") -> bool:
        return other.is_bot() or (self.lo <= other.lo and other.hi <= self.hi)

    def __lt__(self, other: "Interval") -> bool:
        return other._includes(self) and self != other

    def __gt__(self, other: "Interval") -> bool:
        return other < self

    @classmethod
    def abstract(cls, values: Iterable[jvms.StackValue]) -> "Interval":
        ints = []
        for value in values:
            match value:
                case jvms.StackInt(v):
                    ints.append(v)
                case _:
                    raise NotImplementedError(f"Unsupported value {value!r}")
        if not ints:
            return BOT
        return cls.of(min(ints), max(ints))

    def __contains__(self, value: jvms.StackValue) -> bool:
        match value:
            case jvms.StackInt(v):
                return self.lo <= v <= self.hi
            case _:
                raise NotImplementedError(f"Unsupported value {value!r}")

    @classmethod
    def top(cls) -> "Interval":
        return cls(None, None)

    @classmethod
    def positive(cls) -> "Interval":
        return cls.of(1, None)

    @classmethod
    def nonnegative(cls) -> "Interval":
        return cls.of(0, None)

    def __or__(self, other: "Interval") -> "Interval":
        if not isinstance(other, Interval):
            return NotImplemented
        if self.is_bot():
            return other
        if other.is_bot():
            return self
        return Interval.of(min(self.lo, other.lo), max(self.hi, other.hi))

    def __and__(self, other: "Interval") -> "Interval":
        if not isinstance(other, Interval):
            return NotImplemented
        return Interval.of(max(self.lo, other.lo), min(self.hi, other.hi))

    def widen(self, other: "Interval") -> "Interval":
        """Standard widening: a bound that grew is dropped (set to the limit)."""
        if self.is_bot():
            return other
        if other.is_bot():
            return self
        lo = self.lo if other.lo >= self.lo else None
        hi = self.hi if other.hi <= self.hi else None
        return Interval.of(lo, hi)

    # -- transfer functions -------------------------------------------------

    @staticmethod
    def _exact(values: Iterable[int]) -> "Interval":
        """Hull of exact results; ``top`` if any of them overflows int32 (Java wraps)."""
        values = list(values)
        if not values:
            return BOT
        lo, hi = min(values), max(values)
        if lo < INT_MIN or hi > INT_MAX:
            return Interval.top()
        return Interval.of(lo, hi)

    def arithmetic(
        self, other: "Interval", opr: jvm.BinaryOpr
    ) -> tuple["Interval", set[str]]:
        if self.is_bot() or other.is_bot():
            return BOT, set()
        a1, a2 = self.bounds32()
        b1, b2 = other.bounds32()
        errors: set[str] = set()
        match opr:
            case jvm.BinaryOpr.Add:
                return Interval._exact([a1 + b1, a2 + b2]), errors
            case jvm.BinaryOpr.Sub:
                return Interval._exact([a1 - b2, a2 - b1]), errors
            case jvm.BinaryOpr.Mul:
                return Interval._exact(
                    a * b for a in (a1, a2) for b in (b1, b2)
                ), errors
            case jvm.BinaryOpr.Div:
                if b1 <= 0 <= b2:
                    errors.add("divide by zero")
                # Truncating division is monotone in each argument on a divisor
                # range of one sign, so the corners give the extremes.
                result = BOT
                for c1, c2 in nonzero_parts(b1, b2):
                    result |= Interval._exact(
                        java_binary(opr, a, c) for a in (a1, a2) for c in (c1, c2)
                    )
                return result, errors
            case jvm.BinaryOpr.Rem:
                if b1 <= 0 <= b2:
                    errors.add("divide by zero")
                if not nonzero_parts(b1, b2):
                    return BOT, errors
                # |a % b| < |b|, and the result has the sign of the dividend.
                m = max(abs(b1), abs(b2)) - 1
                lo = 0 if a1 >= 0 else max(a1, -m)
                hi = 0 if a2 <= 0 else min(a2, m)
                return Interval.of(lo, hi), errors
            case _:
                return Interval.top(), errors

    def compare(self, other: "Interval", opr: jvm.CmpOpr) -> Iterable[bool]:
        return {
            outcome
            for outcome in (True, False)
            if not self.refine(other, opr, outcome)[0].is_bot()
        }

    def refine(
        self, other: "Interval", opr: jvm.CmpOpr, outcome: bool
    ) -> tuple["Interval", "Interval"]:
        """Narrowing at a branch by boundary refinement (same contract as
        ``SignSet.refine``). Intervals have no holes, so ``x != c`` only removes
        ``c`` when it is an endpoint of ``x`` (D8)."""
        if not outcome:
            opr = NEGATED[opr]
        x, y = self, other
        if x.is_bot() or y.is_bot():
            return BOT, BOT
        match opr:
            case jvm.CmpOpr.Eq | jvm.CmpOpr.Is:
                rx = ry = x & y
            case jvm.CmpOpr.Ne:
                rx, ry = x.without(y), y.without(x)
            case jvm.CmpOpr.Lt:
                rx = x & Interval.of(None, y.hi - 1)
                ry = y & Interval.of(x.lo + 1, None)
            case jvm.CmpOpr.Le:
                rx = x & Interval.of(None, y.hi)
                ry = y & Interval.of(x.lo, None)
            case jvm.CmpOpr.Gt:
                ry, rx = y.refine(x, jvm.CmpOpr.Lt, True)
            case jvm.CmpOpr.Ge:
                ry, rx = y.refine(x, jvm.CmpOpr.Le, True)
            case _:
                raise NotImplementedError(f"TODO: {opr}")
        if rx.is_bot() or ry.is_bot():
            return BOT, BOT
        return rx, ry

    def without(self, point: "Interval") -> "Interval":
        """``self`` minus the single value of ``point``, if that is an endpoint."""
        if point.min is None or point.min != point.max:
            return self
        c = point.min
        if self.min == c:
            return Interval.of(c + 1, self.hi)
        if self.max == c:
            return Interval.of(self.lo, c - 1)
        return self


BOT = Interval(1, 0)
Interval.BOT = BOT


def nonzero_parts(lo: int, hi: int) -> list[tuple[int, int]]:
    """The negative and positive sub-ranges of ``[lo, hi]``."""
    parts = []
    if lo <= -1:
        parts.append((lo, min(hi, -1)))
    if hi >= 1:
        parts.append((max(lo, 1), hi))
    return parts


def wrap32(v: int) -> int:
    """Two's-complement wrap-around of a Python int to Java ``int``."""
    return (v - INT_MIN) % 2**32 + INT_MIN
