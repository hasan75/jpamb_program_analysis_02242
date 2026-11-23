# 07 — Theory: Dynamic Analysis

Source: [`topics/dynamic-analysis.html`](https://courses.compute.dtu.dk/02242/topics/dynamic-analysis.html)

This is the lecture Assignment 2 is directly built on (deadline **September
27, 2026, midnight** — see file 03). It's the theory behind the `analyse()`
function already stubbed out in `solutions/dynamic/src/dynamic.py`, which
right now is a *very* basic fuzzer.

## The core idea

**Dynamic analysis = finding out information about a program by running
it.** Three phases, always in this order:

1. **Trace selection** — pick an initial state (an input) and run the
   program to get one concrete trace `τ`. Deterministic program ⇒ one trace
   per input; non-deterministic (threads, randomness) ⇒ could get a
   different trace each run of the *same* input.
2. **Trace analysis** — ask something about that one trace: did it succeed?
   did it leak a resource? which instructions ran?
3. **Trace abstraction / prediction** — generalize from the traces you
   sampled to a claim about the *whole program*, and decide what to store
   per trace (storing the full state at every step, like the interpreter's
   s-expr output, is precise but expensive — most analyses keep only a
   summary, e.g. just the final outcome).

## The fundamental limitation (ties back to lecture 1)

> Dynamic analysis can only ever show something *can* happen — never that it
> *must* happen (for every input) or *cannot* happen (for any input).

In the sound/complete vocabulary from file 1: dynamic analysis is naturally
a **may-analysis that's sound about the specific traces it saw** (if it ran
and crashed, that crash is 100% real — no false positives *for that trace*)
but **never complete** (it can't enumerate infinite input spaces, so it can
always miss a crash). This is exactly why `analyse()` in `dynamic.py` prints
`"found"` / `"not-found"` per outcome rather than a hard yes/no — "not-found"
means "didn't happen in the 10 tries we made," not "can never happen."

### Path-equivalence classes and coverage

Traces that go through the same sequence of branches form one
**path-equivalence class** `[τ]_π`. A method with one `if (n == 0)` only
has 2 path classes no matter how many distinct input values you throw at
it — which is the theoretical reason **coverage-based** fuzzing (below)
works at all: you don't need every input, just one representative per class.

- **Instruction coverage** — which opcodes ran.
- **Branch coverage** — which side of each conditional was taken.
- **Line coverage** — which source lines were hit.

## Why run the program at all (vs. static analysis)

**Pros**: your language already has an interpreter/runtime, so this is
cheap to set up; a concrete trace is unambiguous and great for debugging;
anything you actually observe is *guaranteed real* (no false positives from
the observation itself).

**Cons**: you need a working environment (can be hard/impossible without
prod-like setup); side effects (deleting a row, sending an email) make
"just run it" risky; and it structurally cannot prove absence — "this loop
never terminates" is not something running-and-watching can ever *show*, it
can only fail to observe termination within a bound (again: undecidability,
lecture 1).

## Testing strategies (the "trace analysis" step, formalized)

- **Basic testing**: run known inputs, check the outcome. Assertions encode
  more than "did it crash" — see below.
- **Characterization / golden-master testing**: when "correct" is hard to
  state as a formula, just snapshot the current output/trace, eyeball it
  once, commit it to version control, and diff future runs against it —
  useful once you *trust* the current behavior and just want regression
  detection.
- **Assertions**: runtime checks of programmer assumptions. The lecture
  cites TigerBeetle's **"Tiger Style"**: at least two assertions per
  function — one for the *positive space* (what should hold) and one for
  the *negative space* (what should never hold). E.g. a rectangle-area
  function asserts both `height > 0` and `width > 0` going in.

## Fuzzing — automated trace selection

Fuzzing = "automatically generating inputs to automate testing." From
simplest to most sophisticated:

| Technique | How it picks inputs | Good when | Weak when |
|---|---|---|---|
| **Random** | uniform sample from each parameter's domain | input space lines up with path space (e.g. `if (i > 0)` — half of all ints hit each branch) | the interesting value is a needle in a huge haystack |
| **Dictionary-based** | scan the source/bytecode for literal constants (syntactic analysis!) and sample from that set too | code checks specific magic values (`if (i == 0)`) | constants not visible in the code itself (computed thresholds) |
| **Coverage-guided** (AFL++) | keep a corpus of byte-strings; mutate them; keep a mutant only if it *increases* coverage | deep/nested branches that pure random rarely reaches | expensive to set up for arbitrary non-byte-string inputs |
| **Property-based** (Hypothesis) | random generation *plus* shrinking, checked against a property/invariant instead of one fixed expected output | you can state an invariant (`sort(lst) == sorted(lst)`) but not enumerate exact outputs | you can't state a useful property |
| **Small-scope** (SmallCheck, Alloy) | exhaustively try every input up to size/depth `d`, increasing `d` | most real bugs are small (the "small-scope hypothesis") — great for edge cases like empty lists/zero | bugs that only trigger on large inputs, e.g. `if (i == 1_000_000)` |

### Where your current `dynamic.py` sits on this table

`fuzz_input()` + `analyse()` in your repo is currently **pure random
generation**, and a fairly weak version of it:

```python
rand = random.Random(0)   # deterministic seed - good, reproducible
for i in range(10):       # only 10 tries
    input = fuzz_input(rand, methodid)
    ...
```

Mapped onto the lecture's own critique of random fuzzing: this will happily
find `if (i > 0)`-style branches (path space ≈ input space) but will
essentially *never* find `if (i == 1_000_000)`-style branches or any
`assert`/divide-by-zero condition that depends on hitting one specific
value or a narrow range. Concrete, cheap next steps if you want to improve
Assignment 2's score, straight from this table:

1. **Raise the try count** (10 → hundreds/thousands) — the free win, costs
   nothing conceptually.
2. **Add dictionary-based fuzzing**: syntactically scan the bytecode (you
   already have exactly this code style in
   `solutions/syntactic/src/syntactic_bytecode.py` from Assignment 1 — look
   for `Push` instructions and collect their constant values) and bias
   `fuzz_input` to sometimes sample from that set instead of a uniform
   random int.
3. **Add a small-scope pass**: for `int` params, exhaustively try
   `-2, -1, 0, 1, 2` (and similar tiny ranges) before/alongside the random
   tries — cheap, and this is precisely the kind of input JPAMB's own cases
   tend to use (see `cases/jpamb/cases/*.java`'s `@Case` annotations, which
   are almost all small literal inputs).
4. Track **coverage** per PC visited (you already have `pc` from every
   `step()` call) and keep mutating whichever seed most recently *increased*
   coverage instead of drawing every input fresh and independent — this is
   coverage-guided fuzzing's core loop, scaled down.

None of this requires new theory beyond what's in this lecture — it's
picking which row of the table above to move down to.

## Reflection questions from the lecture

1. In what scenarios is dynamic analysis most valuable compared to static
   approaches? *(When you have a runnable environment and want a
   zero-false-positive signal fast — e.g. CI smoke tests — rather than a
   guarantee about every possible input.)*
2. What are the fundamental limitations preventing dynamic analysis from
   providing complete program guarantees? *(It samples finitely many traces
   out of a possibly-infinite `Sem(p)`; it can never observe "this never
   happens" for the same reason the halting problem is undecidable.)*
3. When is random input sampling preferable to exhaustive small-value
   testing, and vice versa? *(Random: when the path space is coarse relative
   to the domain, so most values already exercise different branches.
   Small-scope: when bugs are expected to live in edge cases near zero/empty,
   per the small-scope hypothesis — but it misses bugs gated behind large
   specific constants, which dictionary-based fuzzing catches instead.)*

Next: [08 — Assignment 2: Implementation Plan](08-assignment-2-plan.md)
