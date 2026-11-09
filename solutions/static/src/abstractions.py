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

    @abstractmethod
    def is_bottom(self) -> bool: ...


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

    def is_bottom(self) -> bool:
        return not self.signs

    @classmethod
    def top(cls) -> bool:
        return cls(frozenset([-1, 0, 1]))

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

        # Computes the possible results for every pair of signs.
        for x in self.signs:
            for y in other.signs:
                match opr:
                    case jvm.BinaryOpr.Add:
                        if x == 0:
                            output.add(y)
                        elif y == 0:
                            output.add(x)
                        elif x == y:
                            output.add(x)
                        else:
                            output.update([-1, 0, 1])

                    case jvm.BinaryOpr.Sub:
                        if x == 0:
                            output.add(-y)
                        elif y == 0:
                            output.add(x)
                        elif x == y:
                            output.update([-1, 0, 1])
                        else:
                            output.add(x)

                    case jvm.BinaryOpr.Mul:
                        output.add(x * y)

                    case jvm.BinaryOpr.Div:
                        if y == 0:
                            errors.add("divide by zero")
                        else:
                            output.add(x * y)

                    case jvm.BinaryOpr.Rem:
                        if y == 0:
                            errors.add("divide by zero")
                        elif x == 0:
                            output.add(0)
                        else:
                            output.update([0, x])

                    case _:
                        raise NotImplementedError(f"TODO: {opr}")

        return SignSet(frozenset(output)), errors

    def compare(self, other: "SignSet", opr: jvm.CmpOpr) -> Iterable[bool]:
        comparisons = {
            jvm.CmpOpr.Eq: lambda x, y: x == y,
            jvm.CmpOpr.Ne: lambda x, y: x != y,
            jvm.CmpOpr.Lt: lambda x, y: x < y,
            jvm.CmpOpr.Le: lambda x, y: x <= y,
            jvm.CmpOpr.Gt: lambda x, y: x > y,
            jvm.CmpOpr.Ge: lambda x, y: x >= y,
        }

        if opr not in comparisons:
            raise NotImplementedError(f"TODO: {opr}")

        cases = set()

        for x in self.signs:
            for y in other.signs:
                # Equal non-zero signs may represent different concrete values.
                if x == y and x != 0:
                    cases.update([True, False])
                else:
                    cases.add(comparisons[opr](x, y))

        return cases


from collections.abc import Iterable
from dataclasses import dataclass
from typing import Self

# Implements integer division truncated towards zero, as in the JVM.
def trunc_div(x: int, y: int) -> int:
    quotient = abs(x) // abs(y)
    return -quotient if (x < 0) != (y < 0) else quotient

@dataclass(frozen=True)
class Interval(Abstraction, Lattice):
    min: int | None
    max: int | None

    def __str__(self):
        return f"{self.min if self.min is not None else '-inf'}:{self.max if self.max is not None else 'inf'}"

    def __sexpr__(self):
        return str(self)

    @classmethod
    def abstract(cls, values: Iterable[jvms.StackValue]) -> Self:
        numbers = []

        for value in values:
            match value:
                case jvms.StackInt(v):
                    numbers.append(v)
                case _:
                    raise NotImplementedError(
                        f"Unsupported value {value!r}"
                    )

        if not numbers:
            return cls(1, 0)

        return cls(min(numbers), max(numbers))

    def __contains__(self, value: jvms.StackValue) -> bool:
        match value:
            case jvms.StackInt(v):
                return (
                    (self.min is None or self.min <= v)
                    and (self.max is None or v <= self.max)
                    and not self.is_bottom()
                )
            case _:
                return False

    # An interval with lower bound greater than upper bound represents bottom.
    def is_bottom(self) -> bool:
        return (
            self.min is not None
            and self.max is not None
            and self.min > self.max
        )

    @classmethod
    def top(cls) -> Self:
        return cls(None, None)

    def __or__(self, other: "Interval") -> "Interval":
        if self.is_bottom():
            return other

        if other.is_bottom():
            return self

        lower = (
            None
            if self.min is None or other.min is None
            else min(self.min, other.min)
        )

        upper = (
            None
            if self.max is None or other.max is None
            else max(self.max, other.max)
        )

        return Interval(lower, upper)

    def __and__(self, other: "Interval") -> "Interval":
        if self.is_bottom() or other.is_bottom():
            return Interval(1, 0)

        lower = (
            other.min if self.min is None
            else self.min if other.min is None
            else max(self.min, other.min)
        )

        upper = (
            other.max if self.max is None
            else self.max if other.max is None
            else min(self.max, other.max)
        )

        result = Interval(lower, upper)

        if result.is_bottom():
            return Interval(1, 0)

        return result

    def __lt__(self, other: "Interval") -> bool:
        if self.is_bottom():
            return not other.is_bottom()

        if other.is_bottom():
            return False

        lower_inside = (
            other.min is None
            or (
                self.min is not None
                and self.min >= other.min
            )
        )

        upper_inside = (
            other.max is None
            or (
                self.max is not None
                and self.max <= other.max
            )
        )

        return (
            lower_inside
            and upper_inside
            and self != other
        )

    def __gt__(self, other: "Interval") -> bool:
        return other < self
    
    # Computes interval arithmetic while reporting possible arithmetic errors.
    def arithmetic(
        self, other: "Interval", opr: jvm.BinaryOpr
    ) -> tuple["Interval", set[str]]:
        errors = set()

        if self.is_bottom() or other.is_bottom():
            return Interval(1, 0), errors

        match opr:
            case jvm.BinaryOpr.Add:
                lower = (
                    None if self.min is None or other.min is None
                    else self.min + other.min
                )
                upper = (
                    None if self.max is None or other.max is None
                    else self.max + other.max
                )

            case jvm.BinaryOpr.Sub:
                lower = (
                    None if self.min is None or other.max is None
                    else self.min - other.max
                )
                upper = (
                    None if self.max is None or other.min is None
                    else self.max - other.min
                )

            case jvm.BinaryOpr.Mul:
                if None in (self.min, self.max, other.min, other.max):
                    return Interval.top(), errors

                values = [
                    self.min * other.min,
                    self.min * other.max,
                    self.max * other.min,
                    self.max * other.max,
                ]
                lower, upper = min(values), max(values)

            case jvm.BinaryOpr.Div:
                # Division by an interval containing zero may cause a division-by-zero error.
                contains_zero = (
                    (other.min is None or other.min <= 0)
                    and (other.max is None or 0 <= other.max)
                )

                if contains_zero:
                    errors.add("divide by zero")

                if None in (self.min, self.max, other.min, other.max):
                    return Interval.top(), errors

                if contains_zero:
                    return Interval.top(), errors

                values = [
                    trunc_div(x, y)
                    for x in (self.min, self.max)
                    for y in (other.min, other.max)
                ]
                lower, upper = min(values), max(values)

            case jvm.BinaryOpr.Rem:
                contains_zero = (
                    (other.min is None or other.min <= 0)
                    and (other.max is None or 0 <= other.max)
                )

                if contains_zero:
                    errors.add("divide by zero")
                    return Interval.top(), errors

                if None in (self.min, self.max, other.min, other.max):
                    return Interval.top(), errors

                # The remainder magnitude is bounded by the divisor magnitude minus one.
                max_remainder = max(abs(other.min), abs(other.max)) - 1

                if self.min >= 0:
                    lower = 0
                    upper = min(self.max, max_remainder)

                elif self.max <= 0:
                    lower = -min(abs(self.min), max_remainder)
                    upper = 0

                else:
                    lower = -min(abs(self.min), max_remainder)
                    upper = min(self.max, max_remainder)

                return Interval(lower, upper), errors

            case _:
                raise NotImplementedError(f"TODO: {opr}")

        return Interval(lower, upper), errors

    # Determines which comparison results are possible for two intervals.
    def compare(self, other: "Interval", opr: jvm.CmpOpr) -> Iterable[bool]:
        if self.is_bottom() or other.is_bottom():
            return set()

        match opr:
            case jvm.CmpOpr.Eq:
                if (self & other).is_bottom():
                    return {False}

                if (
                    self.min == self.max
                    and other.min == other.max
                    and self.min == other.min
                ):
                    return {True}

                return {True, False}

            case jvm.CmpOpr.Ne:
                return {
                    not result
                    for result in self.compare(other, jvm.CmpOpr.Eq)
                }

            case jvm.CmpOpr.Lt:
                if (
                    self.max is not None
                    and other.min is not None
                    and self.max < other.min
                ):
                    return {True}

                if (
                    self.min is not None
                    and other.max is not None
                    and self.min >= other.max
                ):
                    return {False}

                return {True, False}

            case jvm.CmpOpr.Le:
                if (
                    self.max is not None
                    and other.min is not None
                    and self.max <= other.min
                ):
                    return {True}

                if (
                    self.min is not None
                    and other.max is not None
                    and self.min > other.max
                ):
                    return {False}

                return {True, False}

            case jvm.CmpOpr.Gt:
                return other.compare(self, jvm.CmpOpr.Lt)

            case jvm.CmpOpr.Ge:
                return other.compare(self, jvm.CmpOpr.Le)

            case _:
                raise NotImplementedError(f"TODO: {opr}")