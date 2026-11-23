# 06 — Theory: Semantics

Source: [`topics/semantics.html`](https://courses.compute.dtu.dk/02242/topics/semantics.html)

This is the lecture behind Assignment 2 (dynamic analysis, due **September
27, 2026** per file 03 — that's *tomorrow* from where this guide was
written). You need this lecture's small-step rules to finish
`solutions/dynamic/src/dynamic.py`, which is already partially written in
your repo.

## Natural deduction, quickly

Rules are written premises-over-line-over-conclusion:

```
premise₁ ... premiseₙ
─────────────────────── (name)
      conclusion
```

"If everything above the line holds, the thing below the line holds." A
**judgment** `x ⊢ y` reads "in context `x`, `y` holds" — you'll see this
shape constantly below (`bc ⊢ s → s̄`: "under bytecode `bc`, state `s` steps
to `s̄`").

## Three ways to define "what a program means"

| Approach | Meaning comes from | Good for | Bad for |
|---|---|---|---|
| **Axiomatic** | pre/postconditions on statements (Hoare triples `{P}C{Q}`) | verifying *one specific* program against a spec | general-purpose analysis (doesn't scale to "run this and see") |
| **Denotational** | a compositional math function `EXP → (Σ → ℕ)` from syntax to a mathematical domain | expression languages, functional-style reasoning | imperative control flow (loops, jumps) is awkward to denote |
| **Operational** | explicit state-transition rules | imperative languages, **JVM bytecode** — this is what JPAMB uses | — |

JPAMB (and Assignment 2) uses **operational semantics**, so that's the part
worth understanding in depth.

### Small-step vs. big-step

- **Big-step (natural)**: `ψ ⊢ σ ↓ v` — "evaluates all the way down to final
  value `v`." Can't express non-termination (there's no rule for "this loops
  forever"), and you can't turn it directly into a working interpreter loop.
- **Small-step (structural)**: `ψ ⊢ σ → σ̄` — "one step, from state to next
  state." You *can* always recover big-step from small-step by just applying
  `→` repeatedly until you hit a terminal state — the reverse doesn't hold.
  This is why an interpreter is a `step` function you call in a loop, not a
  single big evaluator.

This maps exactly onto why `docs/interpret.md` and `dynamic.py` are built
the way they are: `jpamb interpret` asks your program for one step at a
time (`step(bc, state) -> (pc, State | str)`) and keeps calling it until the
state becomes a terminal string (`"ok"`, `"assertion error"`, `"divide by
zero"`, ...) or `max_steps` runs out — that last case *is* how the harness
detects `*` (infinite loop) without solving the halting problem: it just
gives up after a bound, which is exactly the compromise lecture 1's
undecidability section predicted you'd need.

### Transition systems and traces

A transition system is a triple `⟨State_p, δ_p, I_p⟩` (states, the
step relation, initial states). A **trace** is a sequence of states linked
by `δ_p`; `Sem(p)` is the set of *all* traces a program can produce. Program
properties (like "always halts") are just predicates over this set of
traces — this is the formal backbone for the next lecture (dynamic
analysis), which is entirely about *sampling* from `Sem(p)` by actually
running the program.

## JVM semantics — the part you implement

The course's JVM subset has judgment forms:

```
bc ⊢ s → s̄            (one step, still running)
bc ⊢ s → ok            (terminated successfully)
bc ⊢ s → err('msg')    (terminated with an error — one of the 5 crash outcomes)
```

which is *precisely* the Python contract in `dynamic.py`:

```python
def step(bc: Bytecode, s: State) -> State | str: ...
```

### The pieces, math ↔ code

| Math | Meaning | Python (`jvm/state.py`) |
|---|---|---|
| `ι = ⟨ι_m, ι_o⟩` | program counter: method + offset | `PC` (supports `+=`, `%=`) |
| `σ = V_σ*` | operand stack (list of int/float/ref) | `Frame.stack` (`OperandStack`) |
| `λ` | locals array | `Frame.locals` |
| `⟨λ, σ, ι⟩` | one frame | `Frame` |
| `μ` | call stack (stack of frames) | `CallStack` |
| `η` | heap (address → heap value) | `Heap` |
| `⟨η, μ⟩` | complete state | `State` |

Two "lifting" rules do all the plumbing of "a frame-level step is also a
call-stack-level step is also a whole-state-level step" — in the Python you
never write these explicitly, `state.frames.peek()` gives you the frame the
`match` cares about and everything else is untouched by reference.

### What's already implemented vs. what's left

Reading your actual `solutions/dynamic/src/dynamic.py` against the lecture's
worked rules:

- **Done**: `push` (pushI rule), `binary`/div including the `bdivI0`/`bdivI1`
  divide-by-zero split, `return` for the *no-caller-left* case (`ok`), the
  `$assertionsDisabled` hack for `Get`, and a hack that treats *any*
  `new AssertionError` as an immediate `"assertion error"` (skipping the
  `dup`/`invokespecial <init>`/`athrow` sequence the syntactic analyzer had
  to pattern-match on in file 2 — the interpreter gets to cheat because it
  only needs the *outcome*, not a faithful trace of every instruction).
- **Explicitly `raise NotImplementedError`** (i.e., your TODO list, same as
  the lecture's own exercise list):
  1. `dup` — duplicate top-of-stack value. The lecture points you at the
     `jvm2json` codec / Wikipedia / the JVM spec for the exact rule; it's a
     one-line small-step rule (`bc ⊢ ⟨σ(v), ι⟩ → ⟨σ(v)(v), ι+1⟩`) and a
     matching one-line `case` arm.
  2. `Return` when the call stack is *not* empty (currently only handles the
     top-level return; the lecture's rule pushes the return value onto the
     *caller's* stack and increments *its* pc — you need this the moment any
     case under test calls a helper method).
  3. Everything else the benchmark's methods touch that isn't `push`/`div`/
     `return`/assert-related (comparisons beyond `Eq`, other binary ops,
     loads/stores, jumps, arrays, ...) — `compare()` and `binary()` both have
     bare `raise NotImplementedError` fallthroughs you'll hit immediately on
     any method with an `if`, a loop, or `+`/`-`/`*`.

### Practical implementation advice from the lecture (matches what's in the repo)

- Build it **one instruction at a time**, driven by whatever method you're
  currently failing on — don't try to implement all 39 opcodes up front.
- `print(..., file=sys.stderr)` for debugging is fine and already present at
  the top of `step()` — stderr is never scored (see CLAUDE.md's protocol
  notes: only stdout/the emitted trace matters).
- Use `--step-wise` for interactive debugging:
  ```bash
  jpamb -vv interpret --filter Simple --step-wise dynamic-interpreter
  ```
- "It's okay to hack some things" — the assertion/`$assertionsDisabled`
  shortcuts already in the file are exactly this kind of sanctioned hack;
  you're not expected to model the full JVM class-loading semantics for two
  bytecode instructions that only ever mean "this is an `assert`."

## Reflection questions from the lecture

1. What constitutes program semantics? *(A mapping from syntax to
   meaning — mathematical, in one of the three flavors above.)*
2. What approaches exist for describing program semantics? *(Axiomatic,
   denotational, operational — see table above.)*
3. What does it mean to interpret code? *(Repeatedly apply the small-step
   relation from an initial state until you hit a terminal state — literally
   the loop in `dynamic.py`'s `interpret()`.)*

Next: [07 — Theory: Dynamic Analysis](07-theory-dynamic-analysis.md)
