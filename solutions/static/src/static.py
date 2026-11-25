import sys
from collections import deque
from collections.abc import Iterable
from dataclasses import dataclass

from abstractions import Abstraction, Interval, SignSet

import jpamb
import sexpr
from jpamb import jvm
from jvm.state import PC, StackInt

type Origin = int | None
"""The local variable a stack value was loaded from, if it is still a copy of it."""


@dataclass(frozen=True)
class State(sexpr.AsSExpr):
    locals: tuple[Abstraction, ...]
    stack: tuple[Abstraction, ...]
    origins: tuple[Origin, ...] | None = None

    def __post_init__(self):
        assert isinstance(self.locals, tuple)
        assert isinstance(self.stack, tuple)
        if self.origins is None:
            object.__setattr__(self, "origins", (None,) * len(self.stack))
        assert len(self.origins) == len(self.stack)

    def __str__(self):
        return f"{', '.join(map(str, self.locals))}/{':'.join(map(str, self.stack))}"

    def __or__(self, other):
        assert isinstance(other, State), f"Expected State but got {other!r}"
        assert len(self.stack) == len(other.stack), "Stacks should be equal lenght"
        assert len(self.locals) == len(other.locals), "Locals should be equal lenght"

        return State(
            tuple(s1 | s2 for s1, s2 in zip(self.locals, other.locals)),
            tuple(s1 | s2 for s1, s2 in zip(self.stack, other.stack)),
            tuple(
                o1 if o1 == o2 else None for o1, o2 in zip(self.origins, other.origins)
            ),
        )

    def widen(self, other: "State") -> "State":
        """Pointwise widening of locals and stack; origins as in the join."""
        joined = self | other
        return State(
            tuple(a.widen(b) for a, b in zip(self.locals, joined.locals)),
            tuple(a.widen(b) for a, b in zip(self.stack, joined.stack)),
            joined.origins,
        )

    def push(self, value: Abstraction, origin: Origin = None):
        assert isinstance(value, Abstraction), f"Expected abstract value: {value}"
        return State(self.locals, self.stack + (value,), self.origins + (origin,))

    def pop(self, number=1):
        return self.stack[-number:], State(
            self.locals, self.stack[:-number], self.origins[:-number]
        )

    def pop_origins(self, number=1) -> tuple[Origin, ...]:
        """The origins of the top ``number`` stack values (bottom first)."""
        return self.origins[-number:]

    def load(self, index):
        return self.locals[index]

    def store(self, index, value):
        """Write a local; stack copies of its old value lose their origin."""
        return State(
            tuple(self.locals[:index]) + (value,) + tuple(self.locals[index + 1 :]),
            self.stack,
            tuple(None if o == index else o for o in self.origins),
        )

    def refine(self, origins: Iterable[Origin], values: Iterable[Abstraction]):
        """Narrowing: replace each local named in ``origins`` by its refined value."""
        state = self
        for origin, value in zip(origins, values):
            if origin is not None:
                value = value & state.locals[origin]
                state = State(
                    state.locals[:origin] + (value,) + state.locals[origin + 1 :],
                    state.stack,
                    state.origins,
                )
        return state


ALL_OUTCOMES = (
    "ok",
    "divide by zero",
    "assertion error",
    "out of bounds",
    "null pointer",
    "*",
)

type Domain = type[SignSet | Interval]

STEP_CAP = 10_000
"""Safety net on worklist steps per method; every benchmark method stops earlier."""


def manystep(
    bc: jpamb.Bytecode,
    pc: PC,
    state: State,
    narrow: bool = False,
    domain: Domain = SignSet,
) -> Iterable[tuple[PC, object] | str]:
    """Successors of one instruction. References are encoded as ints: null is
    0 and a non-null reference is positive."""
    ZERO = domain.abstract([StackInt(0)])
    opr = bc[pc]
    match opr:
        case jvm.Push(type=jvm.Int(), value=v):
            yield (pc + 1, state.push(domain.abstract([StackInt(v)])))

        case jvm.Push(type=jvm.Reference(), value=0):
            yield (pc + 1, state.push(ZERO))

        case jvm.Get(static=True, field=field):
            # Hack - Only handle the assertion case
            assert field.extension.name == "$assertionsDisabled"

            # Hack - Assuming assertions are never disabled
            yield (pc + 1, state.push(ZERO))

        case jvm.Ifz(condition=op, target=target):
            origins = state.pop_origins(1)
            [val], after = state.pop(1)
            yield from branch(pc, target, after, origins, val, ZERO, op, narrow)

        case jvm.If(condition=op, target=target):
            origins = state.pop_origins(2)
            [v1, v2], after = state.pop(2)
            yield from branch(pc, target, after, origins, v1, v2, op, narrow)

        case jvm.Goto(target=t):
            if t <= pc.offset:
                yield "*"
            yield (pc % t, state)

        case jvm.Load(index=i):
            yield (pc + 1, state.push(state.load(i), origin=i))

        case jvm.Store(index=i):
            [v], after = state.pop(1)
            yield (pc + 1, after.store(i, v))

        case jvm.Dup(words=1):
            [origin] = state.pop_origins(1)
            [v], _ = state.pop(1)
            yield (pc + 1, state.push(v, origin))

        case jvm.Incr(index=i, amount=k):
            res, _ = state.load(i).arithmetic(
                domain.abstract([StackInt(k)]), jvm.BinaryOpr.Add
            )
            yield (pc + 1, state.store(i, res))

        case jvm.Binary(operant=op):
            [v1, v2], after = state.pop(2)
            res, errs = v1.arithmetic(v2, op)
            yield from errs
            if res != domain.bot():
                yield (pc + 1, after.push(res))

        case jvm.NewArray():
            _, after = state.pop(1)
            yield (pc + 1, after.push(domain.positive()))

        case jvm.ArrayLength():
            [ref], after = state.pop(1)
            if StackInt(0) in ref:
                yield "null pointer"
            if may_be_nonnull(ref, domain):
                yield (pc + 1, after.push(domain.nonnegative()))

        case jvm.ArrayLoad():
            [ref, _index], after = state.pop(2)
            yield from array_errors(ref, domain)
            if may_be_nonnull(ref, domain):
                yield (pc + 1, after.push(domain.top()))

        case jvm.ArrayStore():
            [ref, _index, _value], after = state.pop(3)
            yield from array_errors(ref, domain)
            if may_be_nonnull(ref, domain):
                yield (pc + 1, after)

        case jvm.New():
            yield (pc + 1, state.push(domain.top()))

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
                yield (pc + 1, after.push(domain.top()))

        case jvm.Return():
            yield "ok"

        case _:
            print(f"Unsupported instruction {opr}", file=sys.stderr)
            yield from ALL_OUTCOMES


def branch(
    pc: PC,
    target: int,
    after: State,
    origins: tuple[Origin, ...],
    v1: Abstraction,
    v2: Abstraction,
    op: jvm.CmpOpr,
    narrow: bool,
) -> Iterable[tuple[PC, State] | str]:
    """Successors of a conditional jump comparing ``v1 op v2``.

    With ``narrow``, each successor gets the operands refined by the outcome of
    the comparison on that edge; an edge whose refined operands are empty is
    infeasible and dropped. Without it, both successors get ``after`` unchanged.
    """
    for res in v1.compare(v2, op):
        succ = pc % target if res else pc + 1
        if not narrow:
            yield (succ, after)
            continue
        r1, r2 = v1.refine(v2, op, res)
        if r1 == r1.bot() or r2 == r2.bot():
            continue
        # Ifz compares one stack value with the constant ZERO (no origin).
        refined = (r1, r2)[: len(origins)]
        yield (succ, after.refine(origins, refined))
    if target <= pc.offset:
        yield "*"


def may_be_nonnull(ref: Abstraction, domain: Domain) -> bool:
    return (ref & domain.positive()) != domain.bot()


def array_errors(ref: Abstraction, domain: Domain) -> Iterable[str]:
    if StackInt(0) in ref:
        yield "null pointer"
    if may_be_nonnull(ref, domain):
        yield "out of bounds"


def initialstate(
    bc: jpamb.Bytecode,
    methodid: jvm.AbsMethodID,
    inputs: jpamb.Input | None,
    domain: Domain = SignSet,
) -> dict[PC, State]:
    method = bc.getmethod(methodid)
    locals = [domain.bot()] * method.max_locals

    if inputs is None:
        for i, p in enumerate(methodid.extension.params):
            locals[i] = domain.top()
    else:
        for i, x in enumerate(inputs.values):
            match x:
                case jpamb.case.Boolean(value=value):
                    locals[i] = domain.abstract([StackInt(int(value))])
                case jpamb.case.Int(value=value):
                    locals[i] = domain.abstract([StackInt(int(value))])
                case jpamb.case.Array():
                    locals[i] = domain.positive()
                case _:
                    locals[i] = domain.top()

    state = State(tuple(locals), ())
    return {PC(methodid, 0): state}


@dataclass
class AbstractInterpreter:
    bc: jpamb.Bytecode
    worklist: deque[PC]
    states: dict[PC, State]
    narrow: bool = False
    domain: Domain = SignSet

    @staticmethod
    def initial(
        bc: jpamb.Bytecode,
        methodid: jvm.AbsMethodID,
        inputs,
        narrow: bool = False,
        domain: Domain = SignSet,
    ):
        states = initialstate(bc, methodid, inputs, domain)
        worklist = deque(states.keys())

        return AbstractInterpreter(bc, worklist, states, narrow, domain)

    def step(self) -> tuple[PC, set[str]]:
        pc = self.worklist.pop()

        print(f"Stepping {pc}:\n > {self.bc[pc]}", file=sys.stderr)

        finals = set()

        for res in manystep(self.bc, pc, self.states[pc], self.narrow, self.domain):
            if isinstance(res, str):
                finals.add(res)
            else:
                pc_, st = res

                before = self.states.get(pc_, None)
                if before is None:
                    after = st
                elif pc_.offset <= pc.offset:
                    # Backward edge: pc_ is a loop head, so widen to terminate.
                    after = before.widen(st)
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


def predict(
    bc: jpamb.Bytecode, methodid: jvm.AbsMethodID, narrow: bool, domain: Domain
) -> set[str]:
    """The outcome set an analyzer under test predicts for one method."""
    ai = AbstractInterpreter.initial(bc, methodid, None, narrow=narrow, domain=domain)
    return ai.run(STEP_CAP)


def run_analysis(name: str, narrow: bool, domain: Domain = SignSet) -> None:
    """Shared driver for the analyzers under test (D7).

    Each variant is a separate program with its own ``info`` name, so
    ``jpamb analyse`` scores them as separate analyzers.
    """
    methodid = jpamb.getmethodid(
        name,
        "1.0",
        "Hasan Ahmed",
        ["static", "python"],
        for_science=True,
    )

    suite, eff = jpamb.setup()
    bc = jpamb.Bytecode(suite, eff, {})
    final = predict(bc, methodid, narrow, domain)

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


#: The analyzers under test (D7): name -> (narrowing at branches, domain).
ANALYZERS: dict[str, tuple[bool, Domain]] = {
    "static-sign": (False, SignSet),
    "static-sign-narrow": (True, SignSet),
    "static-interval": (True, Interval),
}


def analyse_sign():
    """Sign analysis without narrowing at branches."""
    run_analysis("static-sign", *ANALYZERS["static-sign"])


def analyse_sign_narrow():
    """Sign analysis with narrowing at branches."""
    run_analysis("static-sign-narrow", *ANALYZERS["static-sign-narrow"])


def analyse_interval():
    """Interval analysis with narrowing at branches and widening at loop heads."""
    run_analysis("static-interval", *ANALYZERS["static-interval"])
