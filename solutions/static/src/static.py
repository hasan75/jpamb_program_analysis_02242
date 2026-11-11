import sys
from collections import deque
from collections.abc import Iterable
from dataclasses import dataclass

from abstractions import Abstraction, Interval, SignSet

import jpamb
import sexpr
from jpamb import jvm
from jvm.state import PC, StackInt


@dataclass(frozen=True)
class State(sexpr.AsSExpr):
    locals: tuple[Abstraction, ...]
    stack: tuple[Abstraction, ...]

    def __post_init__(self):
        assert isinstance(self.locals, tuple)
        assert isinstance(self.stack, tuple)

    def __str__(self):
        return f"{', '.join(map(str, self.locals))}/{':'.join(map(str, self.stack))}"

    def __or__(self, other):
        assert isinstance(other, State), f"Expected State but got {other!r}"
        assert len(self.stack) == len(other.stack), "Stacks should be equal lenght"
        assert len(self.locals) == len(other.locals), "Locals should be equal lenght"

        return State(
            tuple(s1 | s2 for s1, s2 in zip(self.locals, other.locals)),
            tuple(s1 | s2 for s1, s2 in zip(self.stack, other.stack)),
        )

    def push(self, value: Abstraction):
        assert isinstance(value, Abstraction), f"Expected abstraction but got {value}"
        return State(self.locals, self.stack + (value,))

    def pop(self, number=1):
        return self.stack[-number:], State(self.locals, self.stack[:-number])

    def load(self, index):
        return self.locals[index]

    def store(self, index, value):
        return State(
            tuple(self.locals[:index]) + (value,) + tuple(self.locals[index + 1 :]),
            self.stack,
        )

    # Refines a local variable with information obtained from a conditional branch.
    def refine(self, index, value):
        return State(
            tuple(
                local & value if i == index else local
                for i, local in enumerate(self.locals)
            ),
            self.stack,
        )

def manystep(
    bc: jpamb.Bytecode,
    pc: PC,
    state: State,
    abstraction: type[Abstraction],
) -> Iterable[tuple[PC, object] | str]:
    opr = bc[pc]
    match opr:
        case jvm.Get(static=True, field=field):
            # Hack - Only handle the assertion case
            assert field.extension.name == "$assertionsDisabled"

            # Hack - Assuming assertions are never disabled
            va = abstraction.abstract([StackInt(0)])

            yield (pc + 1, state.push(va))


        # Handles conditional branches comparing two values.
        case jvm.If(condition=op, target=target):
            [v1, v2], after = state.pop(2)

            previous1 = bc[pc + (-2)]
            previous2 = bc[pc + (-1)]

            if (
                isinstance(previous1, jvm.Load)
                and isinstance(previous2, jvm.Load)
                and previous1.index == previous2.index
            ):
                result = op in (
                    jvm.CmpOpr.Eq,
                    jvm.CmpOpr.Le,
                    jvm.CmpOpr.Ge,
                )

                next_pc = pc % target if result else pc + 1
                yield (next_pc, after)
                return

            for result in v1.compare(v2, op):
                next_pc = pc % target if result else pc + 1
                refined = after

                # Refines both operands when they are loaded from local variables.
                if (
                    isinstance(v1, Interval)
                    and isinstance(v2, Interval)
                    and isinstance(previous1, jvm.Load)
                    and isinstance(previous2, jvm.Load)
                ):
                    left, right = v1, v2

                    if op == jvm.CmpOpr.Eq:
                        if result:
                            common = left & right
                            left = common
                            right = common

                    elif op == jvm.CmpOpr.Ne:
                        if not result:
                            common = left & right
                            left = common
                            right = common

                    else:
                        # Normalize the comparison into one of four relations.
                        relation = {
                            jvm.CmpOpr.Lt: "lt",
                            jvm.CmpOpr.Le: "le",
                            jvm.CmpOpr.Gt: "gt",
                            jvm.CmpOpr.Ge: "ge",
                        }

                        current = relation[op]

                        if not result:
                            current = {
                                "lt": "ge",
                                "le": "gt",
                                "gt": "le",
                                "ge": "lt",
                            }[current]

                        if current == "lt":
                            left = left & Interval(
                                None,
                                None if right.max is None else right.max - 1,
                            )
                            right = right & Interval(
                                None if left.min is None else left.min + 1,
                                None,
                            )

                        elif current == "le":
                            left = left & Interval(None, right.max)
                            right = right & Interval(left.min, None)

                        elif current == "gt":
                            left = left & Interval(
                                None if right.min is None else right.min + 1,
                                None,
                            )
                            right = right & Interval(
                                None,
                                None if left.max is None else left.max - 1,
                            )

                        elif current == "ge":
                            left = left & Interval(right.min, None)
                            right = right & Interval(None, left.max)

                    refined = refined.refine(previous1.index, left)
                    refined = refined.refine(previous2.index, right)

                    if left.is_bottom() or right.is_bottom():
                        continue

                yield (next_pc, refined)

        case jvm.Ifz(condition=op, target=target):
            [val], after = state.pop(1)

            # Refines the loaded local variable using the branch condition.
            previous = bc[pc + (-1)]

            if isinstance(previous, jvm.Load):
                if isinstance(val, SignSet):
                    # Filters possible signs according to the branch condition.
                    comparisons = {
                        jvm.CmpOpr.Eq: lambda x: x == 0,
                        jvm.CmpOpr.Ne: lambda x: x != 0,
                        jvm.CmpOpr.Lt: lambda x: x < 0,
                        jvm.CmpOpr.Le: lambda x: x <= 0,
                        jvm.CmpOpr.Ge: lambda x: x >= 0,
                        jvm.CmpOpr.Gt: lambda x: x > 0,
                    }

                    condition_fn = comparisons[op]

                    true_signs = frozenset(
                        x for x in val.signs if condition_fn(x)
                    )
                    false_signs = val.signs - true_signs

                    if true_signs:
                        yield (
                            pc % target,
                            after.refine(previous.index, SignSet(true_signs)),
                        )

                    if false_signs:
                        yield (
                            pc + 1,
                            after.refine(previous.index, SignSet(false_signs)),
                        )

                elif isinstance(val, Interval):
                    constraints = {
                        jvm.CmpOpr.Eq: (Interval(0, 0), Interval.top()),
                        jvm.CmpOpr.Ne: (Interval.top(), Interval(0, 0)),
                        jvm.CmpOpr.Lt: (Interval(None, -1), Interval(0, None)),
                        jvm.CmpOpr.Le: (Interval(None, 0), Interval(1, None)),
                        jvm.CmpOpr.Ge: (Interval(0, None), Interval(None, -1)),
                        jvm.CmpOpr.Gt: (Interval(1, None), Interval(None, 0)),
                    }

                    true_constraint, false_constraint = constraints[op]

                    true_interval = val & true_constraint
                    false_interval = val & false_constraint

                    if not true_interval.is_bottom():
                        yield (
                            pc % target,
                            after.refine(previous.index, true_interval),
                        )

                    if not false_interval.is_bottom():
                        yield (
                            pc + 1,
                            after.refine(previous.index, false_interval),
                        )

            else:
                zero = abstraction.abstract([StackInt(0)])

                for res in val.compare(zero, op):
                    if res is True:
                        yield (pc % target, after)
                    elif res is False:
                        yield (pc + 1, after)
                    else:
                        yield res

        case jvm.Push(type=jvm.Int(), value=v):
            va = abstraction.abstract([StackInt(v)])
            yield (pc + 1, state.push(va))

        case jvm.Load(index=i):
            va = state.load(i)
            yield (pc + 1, state.push(va))

        case jvm.Store(index=i):
            [val], after = state.pop(1)
            yield (pc + 1, after.store(i, val))

        case jvm.Goto(target=t):
            yield (pc % t, state)

        case jvm.Binary(operant=op):
            [v1, v2], after = state.pop(2)
            # Evaluates the operation and propagates any possible arithmetic errors.
            result, errors = v1.arithmetic(v2, op)

            for error in errors:
                yield error

            if not result.is_bottom():
                yield (pc + 1, after.push(result))

        case jvm.Return(type=None):
            yield "ok"

        case jvm.Return(type=t):
            # Hack -- we assume that we always return.
            yield "ok"

        case jvm.New(classname=jvm.ClassName("java.lang.AssertionError")):
            # Hack -- if we create an assertion error, we probably also throw it.
            yield "assertion error"


def initialstate(
    bc: jpamb.Bytecode,
    methodid: jvm.AbsMethodID,
    inputs: jpamb.Input | None,
    abstraction: type[Abstraction] = SignSet,
) -> dict[PC, State]:
    method = bc.getmethod(methodid)
    locals = [abstraction.bot()] * method.max_locals

    if inputs is None:
        for i, p in enumerate(methodid.extension.params):
            locals[i] = abstraction.top()
    else:
        for i, x in enumerate(inputs.values):
            match x:
                case jpamb.case.Boolean(value=value):
                    locals[i] = abstraction.abstract([StackInt(int(value))])
                case jpamb.case.Int(value=value):
                    locals[i] = abstraction.abstract([StackInt(int(value))])
                case jpamb.case.Array():
                    if abstraction is SignSet:
                        locals[i] = SignSet.from_sign("+")
                    else:
                        locals[i] = abstraction.top()
                case _:
                    raise NotImplementedError(f"Unsupported value {x!r}")

    state = State(tuple(locals), ())
    return {PC(methodid, 0): state}


@dataclass
class AbstractInterpreter:
    bc: jpamb.Bytecode
    worklist: deque[PC]
    states: dict[PC, State]
    # Abstraction domain used by this interpreter instance.
    abstraction: type[Abstraction]

    @staticmethod
    def initial(
        bc: jpamb.Bytecode,
        methodid: jvm.AbsMethodID,
        inputs,
        abstraction: type[Abstraction] = SignSet,
    ):
        states = initialstate(bc, methodid, inputs, abstraction)
        worklist = deque(states.keys())

        return AbstractInterpreter(bc, worklist, states, abstraction)

    def step(self) -> tuple[PC, set[str]]:
        pc = self.worklist.pop()

        print(f"Stepping {pc}:\n > {self.bc[pc]}", file=sys.stderr)
        finals = set()

        for res in manystep(self.bc, pc, self.states[pc], self.abstraction):
            if isinstance(res, str):
                finals.add(res)
            else:
                pc_, st = res

                before = self.states.get(pc_, None)
                if before is None:
                    after = st
                else:
                    after = before | st
                if before is None or after != before:
                    self.states[pc_] = after
                    self.worklist.append(pc_)

        return pc, finals


def interpret():
    """The static analysis"""
    methodid, input, steps = jpamb.getcase(
        "static",
        "1.0",
        "The Rice Theorem Cookers",
        ["static", "python"],
        for_science=True,
    )
    suite, eff = jpamb.setup()
    bc = jpamb.Bytecode(suite, eff, {})

    ai = AbstractInterpreter.initial(bc, methodid, input)

    x = jpamb.emit_init(ai.states)

    while steps > 0 and ai.worklist:
        pc, final = ai.step()
        for f in final:
            jpamb.emit_step(x, pc, f, depth=1)
            steps -= 1

        x = jpamb.emit_step(x, pc, ai.states, depth=1)
        steps -= 1


def analyse():
    """The static analysis"""

    methodid = jpamb.getmethodid(
        "static",
        "1.0",
        "The Rice Theorem Cookers",
        ["static", "python"],
        for_science=True,
    )

    suite, eff = jpamb.setup()
    bc = jpamb.Bytecode(suite, eff, {})

    steps = 300

    ai = AbstractInterpreter.initial(bc, methodid, None)

    final = set()
    while steps > 0 and ai.worklist:
        _pc, finals = ai.step()
        final |= finals
        steps -= 1

    for f in jpamb.QUERIES:
        if f not in final:
            print(f"{f};no")
        else:
            print(f"{f};maybe")
