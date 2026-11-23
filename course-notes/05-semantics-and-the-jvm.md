# 05: Semantics and the JVM

## The question
To reason about what a program **does**, we first need a precise definition
of what each piece of code **means**. That definition is its **semantics**.
Every later technique (interpreters, fuzzers, abstract interpreters) is
built directly on it.

## The three styles of semantics

| Style | A program means... | Good for | Example |
|---|---|---|---|
| **Operational** | how it executes, step by step | interpreters, analyses | `⟨x := 5, σ⟩ → σ[x ↦ 5]` |
| **Denotational** | a mathematical function | compilers, equivalence proofs | `⟦x + 1⟧(σ) = σ(x) + 1` |
| **Axiomatic** | what can be proven about it | verification | `{x > 0} y := x {y > 0}` |

This course uses **operational semantics**, because it maps directly onto code.

### Small-step vs. big-step
- **Small-step:** one transition per instruction: `state → state'`. A run is a sequence (a **trace**) `s₀ → s₁ → s₂ → ...`. It can describe infinite loops (an infinite trace) and crashes at a specific point.
- **Big-step:** one judgment for the whole thing: `⟨S, σ⟩ ⇓ σ'`. Simpler proofs, but non-termination simply has no derivation.

For bytecode, small-step is natural: one instruction = one step.

### Notation you'll see
Inference rules: premises above the line, conclusion below.

```
    bc[ι] = push v
  ───────────────────────────────────            (PUSH)
   ⟨λ, σ, ι⟩  →  ⟨λ, σ·v, ι+1⟩

    bc[ι] = binary div     b ≠ 0
  ───────────────────────────────────            (DIV)
   ⟨λ, σ·a·b, ι⟩  →  ⟨λ, σ·(a/b), ι+1⟩

    bc[ι] = binary div     b = 0
  ───────────────────────────────────            (DIV-ERR)
   ⟨λ, σ·a·b, ι⟩  →  divide by zero
```
`λ` = locals, `σ` = operand stack (top on the right), `ι` = program counter.
Read the first rule as: *if the instruction at ι is `push v`, then one step
pushes v and moves to ι+1.*

## Worked example: run bytecode by hand

```java
public static int checkBeforeDivideByN2(int n) {
    if (n != 0) { return 1 / n; }
    assert 10 > n;
    return 0;
}
```
Real bytecode (`uv run jpamb inspect "jpamb.cases.Simple.checkBeforeDivideByN2:(I)I"`):
```
000 | load:I 0
001 | ifz eq 6             if top == 0 jump to 6
002 | push:I 1
003 | load:I 0
004 | binary:I div
005 | return:I
006 | get static ...$assertionsDisabled:Z
007 | ifz ne 15            if assertions disabled, skip the check
008 | push:I 10
009 | load:I 0
010 | if gt 15             if 10 > n jump to 15 (assert passes)
011 | new java.lang.AssertionError
012 | dup 1
013 | invoke special java.lang.AssertionError.<init>:()V
014 | throw
015 | push:I 0
016 | return:I
```

**Run with n = 0:**

| PC | instruction | locals | stack after |
|---|---|---|---|
| 0 | load 0 | [0] | [0] |
| 1 | ifz eq 6 | [0] | [] → 0 == 0, jump to 6 |
| 6 | get $assertionsDisabled | [0] | [false=0] |
| 7 | ifz ne 15 | [0] | [] → 0 ≠ 0 is false, fall through |
| 8 | push 10 | [0] | [10] |
| 9 | load 0 | [0] | [10, 0] |
| 10 | if gt 15 | [0] | [] → 10 > 0 true, jump to 15 |
| 15 | push 0 | [0] | [0] |
| 16 | return | | **ok** |

Now do **n = 5** yourself. You should reach `return` at PC 5, outcome `ok`.

Things to notice:
- `assert` compiles to a branch on a hidden static field plus `new AssertionError; throw`.
- `if (n != 0)` compiled to `ifz eq` *jumping away* from the then-branch: the compiler inverted the condition.
- Both branches end in `return`, so there are two exit points.

## Interpreting = implementing the semantics
An **interpreter** is the step relation written as code:

```python
def step(state):
    match bc[state.pc]:
        case Push(value=v):   state.stack.push(v); state.pc += 1
        case Load(index=i):   state.stack.push(state.locals[i]); state.pc += 1
        case Binary(operant=Div):
            b, a = state.stack.pop(), state.stack.pop()
            if b == 0: return "divide by zero"
            state.stack.push(java_div(a, b)); state.pc += 1
        ...
```
Java details matter: division truncates toward zero (`-7/2 == -3`, unlike
Python's `-7//2 == -4`), and ints wrap at 32 bits.

## Axiomatic semantics in one example
Hoare logic proves properties without running anything:
```
{ n ≠ 0 }  r := 1 / n  { true }       the division is safe given the precondition
```
The **weakest precondition** `wp(1/n, "no error") = n ≠ 0`. Tools like
Dafny, KeY and Why3 automate this. See chapter 08.

## In the code
- `src/jvm/opcode.py`: one Python class per bytecode instruction (the syntax).
- `src/jvm/state.py`: `PC`, `Stack`: the state.
- `solutions/dynamic/src/dynamic.py`, `step()`: the concrete small-step semantics.
- `solutions/static/src/static.py`, `manystep()`: the *same* semantics on abstract values (chapter 07).

## Check yourself
1. Write a small-step rule for `load i`.
2. Why is small-step semantics better than big-step for describing an infinite loop?
3. Run the example with n = -3. Which PCs are visited?
4. What does `wp(x := x + 1, x > 0)` equal?

Deeper notes: `../assignment-guide/06-theory-semantics.md`, `../docs/interpret.md`.
