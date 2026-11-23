import itertools
import random
import sys

import jpamb
import jvm
import jvm.state as jvmc


def binary(op, v1: int, v2: int) -> int | str:
    match op:
        case jvm.BinaryOpr.Add:
            return v1 + v2
        case jvm.BinaryOpr.Sub:
            return v1 - v2
        case jvm.BinaryOpr.Mul:
            return v1 * v2
        case jvm.BinaryOpr.Div:
            try:
                return v1 // v2
            except ZeroDivisionError:
                return "divide by zero"
        case jvm.BinaryOpr.Rem:
            try:
                return v1 % v2
            except ZeroDivisionError:
                return "divide by zero"
        case a:
            raise NotImplementedError(f"Unhandled binary {op!r}")


def compare(op, v1: int, v2: int) -> bool:
    match op:
        case jvm.CmpOpr.Eq:
            return v1 == v2
        case jvm.CmpOpr.Ne:
            return v1 != v2
        case jvm.CmpOpr.Lt:
            return v1 < v2
        case jvm.CmpOpr.Le:
            return v1 <= v2
        case jvm.CmpOpr.Ge:
            return v1 >= v2
        case jvm.CmpOpr.Gt:
            return v1 > v2
        case _:
            raise NotImplementedError(f"Unhandled comparation {op!r}")


def step(bc: jpamb.Bytecode, state: jvmc.State) -> tuple[jvmc.PC, jvmc.State | str]:
    assert isinstance(state, jvmc.State), f"expected state but got {state}"
    frame = state.frames.peek()
    pc = frame.pc
    opr = bc[pc]
    output = state
    print(f"Stepping {pc}:\n > {opr}", file=sys.stderr)
    match opr:
        case jvm.Push(type=t, value=v):
            match t:
                case jvm.Int():
                    frame.stack.push(jvmc.StackInt(v))
                case jvm.Reference():
                    frame.stack.push(jvmc.StackReference(v))
                case a:
                    raise NotImplementedError(f"Unhandled push type {a!r}")
            frame.pc += 1

        case jvm.Load(type=jvm.Int(), index=n):
            v = frame.locals[n]
            frame.stack.push(v)
            frame.pc += 1

        case jvm.Load(type=jvm.Reference(), index=n):
            v = frame.locals[n]
            frame.stack.push(v)
            frame.pc += 1

        case jvm.Store(type=jvm.Int(), index=n):
            v = frame.stack.pop()
            frame.locals[n] = v
            frame.pc += 1

        case jvm.Store(type=jvm.Reference(), index=n):
            v = frame.stack.pop()
            frame.locals[n] = v
            frame.pc += 1

        case jvm.Dup(words=1):
            v = frame.stack.pop()
            frame.stack.push(v)
            frame.stack.push(v)
            frame.pc += 1

        case jvm.NewArray(type=t, dim=1):
            length = frame.stack.pop()
            assert isinstance(length, jvmc.StackInt), f"expected int, but got {length}"
            ref = state.heap.new(jvmc.HeapArray(t, [0] * length.value))
            frame.stack.push(ref)
            frame.pc += 1

        case jvm.ArrayLength():
            ref = frame.stack.pop()
            assert isinstance(ref, jvmc.StackReference), f"expected ref, but got {ref}"

            if ref.value == 0:
                output = "null pointer"
            else:
                array = state.heap[ref]
                assert isinstance(array, jvmc.HeapArray)
                frame.stack.push(jvmc.StackInt(len(array.values)))
                frame.pc += 1

        case jvm.ArrayLoad():
            index = frame.stack.pop()
            ref = frame.stack.pop()
            assert isinstance(index, jvmc.StackInt), f"expected int, but got {index}"
            assert isinstance(ref, jvmc.StackReference), f"expected ref, but got {ref}"

            if ref.value == 0:
                output = "null pointer"
            else:
                array = state.heap[ref]
                assert isinstance(array, jvmc.HeapArray)
                if 0 <= index.value < len(array.values):
                    frame.stack.push(jvmc.StackInt(array.values[index.value]))
                    frame.pc += 1
                else:
                    output = "out of bounds"

        case jvm.ArrayStore():
            value = frame.stack.pop()
            index = frame.stack.pop()
            ref = frame.stack.pop()
            assert isinstance(value, jvmc.StackInt), f"expected int, but got {value}"
            assert isinstance(index, jvmc.StackInt), f"expected int, but got {index}"
            assert isinstance(ref, jvmc.StackReference), f"expected ref, but got {ref}"

            if ref.value == 0:
                output = "null pointer"
            else:
                array = state.heap[ref]
                assert isinstance(array, jvmc.HeapArray)
                if 0 <= index.value < len(array.values):
                    array.values[index.value] = value.value
                    frame.pc += 1
                else:
                    output = "out of bounds"

        case jvm.Incr(index=n, amount=amount):
            v = frame.locals[n]
            assert isinstance(v, jvmc.StackInt), f"expected int, but got {v}"
            frame.locals[n] = jvmc.StackInt(v.value + amount)
            frame.pc += 1

        case jvm.Ifz(condition=op, target=target):
            value = frame.stack.pop()
            assert isinstance(value, jvmc.StackInt), f"expected int, but got {value}"

            if compare(op, value.value, 0):
                frame.pc %= target
            else:
                frame.pc += 1

        case jvm.Goto(target=target):
            frame.pc %= target

        case jvm.If(condition=op, target=target):
            v2, v1 = frame.stack.pop(), frame.stack.pop()
            assert isinstance(v1, jvmc.StackInt), f"expected int, but got {v1}"
            assert isinstance(v2, jvmc.StackInt), f"expected int, but got {v2}"

            if compare(op, v1.value, v2.value):
                frame.pc %= target
            else:
                frame.pc += 1

        case jvm.Binary(type=jvm.Int(), operant=op):
            v2, v1 = frame.stack.pop(), frame.stack.pop()
            assert isinstance(v1, jvmc.StackInt), f"expected int, but got {v1}"
            assert isinstance(v2, jvmc.StackInt), f"expected int, but got {v2}"

            value = binary(op, v1.value, v2.value)

            if isinstance(value, str):
                output = value
            else:
                frame.stack.push(jvmc.StackInt(value))
                frame.pc += 1

        case jvm.Cast(from_=jvm.Int(), to_=jvm.Short()):
            v = frame.stack.pop()
            assert isinstance(v, jvmc.StackInt), f"expected int, but got {v}"
            short = v.value & 0xFFFF
            if short >= 0x8000:
                short -= 0x10000
            frame.stack.push(jvmc.StackInt(short))
            frame.pc += 1

        case jvm.Return(type=jvm.Int()):
            v1 = frame.stack.pop()
            state.frames.pop()

            if state.frames:
                frame = state.frames.peek()
                frame.stack.push(v1)
                frame.pc += 1
            else:
                output = "ok"

        case jvm.Return(type=None):
            state.frames.pop()

            if state.frames:
                frame = state.frames.peek()
                frame.pc += 1
            else:
                output = "ok"

        case jvm.Get(static=True, field=field):
            # Hack - Only handle the assertion case
            assert field.extension.name == "$assertionsDisabled"

            # Hack - Assuming assertions are never disabled
            frame.stack.push(jvmc.StackInt(0))
            frame.pc += 1

        case jvm.New(classname=jvm.ClassName("java.lang.AssertionError")):
            # Hack -- if we create an assertion error, we probably also throw it.
            output = "assertion error"

        case a:
            raise NotImplementedError(a.help())

    assert isinstance(output, (jvmc.State, str))

    return pc, output


def initial(bc: jpamb.Bytecode, methodid: jvm.AbsMethodID, input: jpamb.Input):
    frame = jvmc.Frame.from_method(bc.getmethod(methodid))
    state = jvmc.State(jvmc.Heap(), jvmc.CallStack.from_frames([frame]))
    for i, v in enumerate(input.values):
        # Convert arbitrary values into local values
        match v:
            case jpamb.case.Boolean(value):
                frame.locals[i] = jvmc.StackInt(1 if value else 0)
            case jpamb.case.Int(value):
                frame.locals[i] = jvmc.StackInt(value)
            case jpamb.case.Array(contains=type, values=values):
                match type:
                    case jvm.Char():
                        ref = state.heap.new(
                            jvmc.HeapArray(type, [ord(a) for a in values])
                        )
                    case jvm.Int():
                        ref = state.heap.new(jvmc.HeapArray(type, [a for a in values]))
                frame.locals[i] = ref
            case jpamb.case.String(value=value):
                ref = state.heap.new(jvmc.HeapString(value))
                frame.locals[i] = ref
            case a:
                raise NotImplementedError(
                    f"Do not know how to convert values of type {a!r} to a local value"
                )

    return state


def interpret():
    """The entry point for the interpreter"""

    methodid, input, max_steps = jpamb.getcase(
        "dynamic",
        "1.1",
        "Hasan Ahmed",
        ["dynamic", "python"],
        for_science=True,
    )

    suite, eff = jpamb.setup()
    bc = jpamb.Bytecode(suite, eff, {})

    state = initial(bc, methodid, input)

    last = jpamb.emit_init(state)

    for x in range(max_steps):
        pc, state = step(bc, state)
        last = jpamb.emit_step(last, pc, state)

        if isinstance(state, str):
            break


def constant_pool(bc: jpamb.Bytecode, methodid: jvm.AbsMethodID) -> list[int]:
    constants = []
    for op in bc.getmethod(methodid).opcodes:
        match op:
            case jvm.Push(type=jvm.Int(), value=v):
                constants.append(v)
    return constants


def fuzz_input(
    rand: random.Random, methodid: jvm.AbsMethodID, constants: list[int]
) -> jpamb.case.Input:
    input = []
    # 1. come up with possible inputs
    for p in methodid.extension.params:
        match p:
            case jvm.Int():
                if constants and rand.random() < 0.5:
                    input.append(jpamb.case.Int(rand.choice(constants)))
                else:
                    input.append(jpamb.case.Int(rand.randint(-(2**31), 2**31 - 1)))
            case jvm.Boolean():
                input.append(jpamb.case.Boolean(1 == rand.randint(0, 1)))
            case a:
                raise NotImplementedError(
                    "Don't know how to create random values for {input}"
                )

    return jpamb.case.Input(input)


def small_scope_inputs(methodid: jvm.AbsMethodID) -> list[jpamb.case.Input]:
    domains = []
    for p in methodid.extension.params:
        match p:
            case jvm.Int():
                domains.append([jpamb.case.Int(v) for v in (-2, -1, 0, 1, 2)])
            case jvm.Boolean():
                domains.append([jpamb.case.Boolean(False), jpamb.case.Boolean(True)])
            case a:
                return []

    return [jpamb.case.Input(list(combo)) for combo in itertools.product(*domains)]


def try_input(
    bc: jpamb.Bytecode,
    methodid: jvm.AbsMethodID,
    input: jpamb.case.Input,
    max_steps: int,
    behaviors: set[str],
) -> None:
    try:
        state = initial(bc, methodid, input)

        for x in range(max_steps):
            _, state = step(bc, state)
            if isinstance(state, str):
                behaviors.add(state)
                return

        behaviors.add("*")
    except (NotImplementedError, AssertionError) as e:
        print(f"Skipping input {input}: {e}", file=sys.stderr)


def analyse():
    """The dynamic analysis, e.g. in this case a (dumb) fuzzer."""

    methodid = jpamb.getmethodid(
        "dynamic",
        "1.1",
        "Hasan Ahmed",
        ["dynamic", "python"],
        for_science=True,
    )

    suite, eff = jpamb.setup()
    bc = jpamb.Bytecode(suite, eff, {})

    MAX_STEPS = 1000

    rand = random.Random(0)

    constants = constant_pool(bc, methodid)

    behaviors: set[str] = set()

    for input in small_scope_inputs(methodid):
        try_input(bc, methodid, input, MAX_STEPS, behaviors)

    if methodid.extension.params:
        for _ in range(200):
            try:
                input = fuzz_input(rand, methodid, constants)
            except NotImplementedError as e:
                print(f"Can't fuzz this method's inputs: {e}", file=sys.stderr)
                break
            try_input(bc, methodid, input, MAX_STEPS, behaviors)

    for query in jpamb.QUERIES:
        if query in behaviors:
            print(f"{query};3")
        else:
            print(f"{query};-1")
