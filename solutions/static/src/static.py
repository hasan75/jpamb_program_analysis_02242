import sys
from collections import deque
from collections.abc import Iterable
from dataclasses import dataclass

from abstractions import SignSet

import jpamb
import sexpr
from jpamb import jvm
from jvm.state import PC, StackInt


@dataclass(frozen=True)
class State(sexpr.AsSExpr):
    locals: tuple[SignSet, ...]
    stack: tuple[SignSet, ...]

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

    def push(self, value: SignSet):
        assert isinstance(value, SignSet), f"Expected sign set but got {value}"
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


ALL_OUTCOMES = (
    "ok",
    "divide by zero",
    "assertion error",
    "out of bounds",
    "null pointer",
    "*",
)

ZERO = SignSet.abstract([StackInt(0)])

NULL = SignSet.from_sign("0")
ARRAY = SignSet.from_sign("+")


def manystep(
    bc: jpamb.Bytecode,
    pc: PC,
    state: State,
) -> Iterable[tuple[PC, object] | str]:
    opr = bc[pc]
    match opr:
        case jvm.Push(type=jvm.Int(), value=v):
            yield (pc + 1, state.push(SignSet.abstract([StackInt(v)])))

        case jvm.Push(type=jvm.Reference(), value=0):
            yield (pc + 1, state.push(NULL))

        case jvm.Get(static=True, field=field):
            # Hack - Only handle the assertion case
            assert field.extension.name == "$assertionsDisabled"

            # Hack - Assuming assertions are never disabled
            yield (pc + 1, state.push(ZERO))

        case jvm.Ifz(condition=op, target=target):
            [val], after = state.pop(1)
            for res in val.compare(ZERO, op):
                yield (pc % target, after) if res else (pc + 1, after)
            if target <= pc.offset:
                yield "*"

        case jvm.If(condition=op, target=target):
            [v1, v2], after = state.pop(2)
            for res in v1.compare(v2, op):
                yield (pc % target, after) if res else (pc + 1, after)
            if target <= pc.offset:
                yield "*"

        case jvm.Goto(target=t):
            if t <= pc.offset:
                yield "*"
            yield (pc % t, state)

        case jvm.Load(index=i):
            yield (pc + 1, state.push(state.load(i)))

        case jvm.Store(index=i):
            [v], after = state.pop(1)
            yield (pc + 1, after.store(i, v))

        case jvm.Dup(words=1):
            [v], _ = state.pop(1)
            yield (pc + 1, state.push(v))

        case jvm.Incr(index=i, amount=k):
            res, _ = state.load(i).arithmetic(
                SignSet.abstract([StackInt(k)]), jvm.BinaryOpr.Add
            )
            yield (pc + 1, state.store(i, res))

        case jvm.Binary(operant=op):
            [v1, v2], after = state.pop(2)
            res, errs = v1.arithmetic(v2, op)
            yield from errs
            if res.signs:
                yield (pc + 1, after.push(res))

        case jvm.NewArray():
            _, after = state.pop(1)
            yield (pc + 1, after.push(ARRAY))

        case jvm.ArrayLength():
            [ref], after = state.pop(1)
            if 0 in ref.signs:
                yield "null pointer"
            if 1 in ref.signs:
                yield (pc + 1, after.push(SignSet.from_sign("0+")))

        case jvm.ArrayLoad():
            [ref, _index], after = state.pop(2)
            yield from array_errors(ref)
            if 1 in ref.signs:
                yield (pc + 1, after.push(SignSet.top()))

        case jvm.ArrayStore():
            [ref, _index, _value], after = state.pop(3)
            yield from array_errors(ref)
            if 1 in ref.signs:
                yield (pc + 1, after)

        case jvm.New():
            yield (pc + 1, state.push(SignSet.top()))

        case jvm.Throw():
            yield "assertion error"

        case (
            jvm.InvokeStatic(method=m)
            | jvm.InvokeVirtual(method=m)
            | jvm.InvokeSpecial(method=m)
            | jvm.InvokeInterface(method=m)
        ):
            nargs = len(tuple(m.extension.params))
            if not isinstance(opr, jvm.InvokeStatic):
                nargs += 1
            _, after = state.pop(nargs) if nargs else ((), state)
            yield "assertion error"
            if m.extension.return_type is None:
                yield (pc + 1, after)
            else:
                yield (pc + 1, after.push(SignSet.top()))

        case jvm.Return():
            yield "ok"

        case _:
            print(f"Unsupported instruction {opr}", file=sys.stderr)
            yield from ALL_OUTCOMES


def array_errors(ref: SignSet) -> Iterable[str]:
    if 0 in ref.signs:
        yield "null pointer"
    if 1 in ref.signs:
        yield "out of bounds"


def initialstate(
    bc: jpamb.Bytecode,
    methodid: jvm.AbsMethodID,
    inputs: jpamb.Input | None,
) -> dict[PC, State]:
    method = bc.getmethod(methodid)
    locals = [SignSet.bot()] * method.max_locals

    if inputs is None:
        for i, p in enumerate(methodid.extension.params):
            locals[i] = SignSet.top()
    else:
        for i, x in enumerate(inputs.values):
            match x:
                case jpamb.case.Boolean(value=value):
                    locals[i] = SignSet.abstract([StackInt(int(value))])
                case jpamb.case.Int(value=value):
                    locals[i] = SignSet.abstract([StackInt(int(value))])
                case jpamb.case.Array():
                    locals[i] = SignSet.from_sign("+")
                case _:
                    locals[i] = SignSet.top()

    state = State(tuple(locals), ())
    return {PC(methodid, 0): state}


@dataclass
class AbstractInterpreter:
    bc: jpamb.Bytecode
    worklist: deque[PC]
    states: dict[PC, State]

    @staticmethod
    def initial(bc: jpamb.Bytecode, methodid: jvm.AbsMethodID, inputs):
        states = initialstate(bc, methodid, inputs)
        worklist = deque(states.keys())

        return AbstractInterpreter(bc, worklist, states)

    def step(self) -> tuple[PC, set[str]]:
        pc = self.worklist.pop()

        print(f"Stepping {pc}:\n > {self.bc[pc]}", file=sys.stderr)

        finals = set()

        for res in manystep(self.bc, pc, self.states[pc]):
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

    def run(self, steps: int) -> set[str]:
        final = set()
        while steps > 0 and self.worklist:
            _pc, finals = self.step()
            final |= finals
            steps -= 1
        return final


def interpret():
    """The static analysis"""
    methodid, input, steps = jpamb.getcase(
        "static",
        "1.0",
        "Hasan Ahmed",
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
            if steps <= 1:
                break
            jpamb.emit_step(x, pc, f, depth=1)
            steps -= 1

        x = jpamb.emit_step(x, pc, ai.states, depth=1)
        steps -= 1


def analyse():
    """The static analysis"""

    methodid = jpamb.getmethodid(
        "static",
        "1.0",
        "Hasan Ahmed",
        ["static", "python"],
        for_science=True,
    )

    suite, eff = jpamb.setup()
    bc = jpamb.Bytecode(suite, eff, {})

    ai = AbstractInterpreter.initial(bc, methodid, None)
    final = ai.run(10_000)

    tags = {
        "ok": "ok",
        "divide by zero": "dz",
        "assertion error": "ae",
        "out of bounds": "ob",
        "null pointer": "np",
        "*": "lp",
    }
    for f in jpamb.QUERIES:
        if f in final:
            print(f"{f};{tags[f]}yes")
        else:
            print(f"{f};no")
