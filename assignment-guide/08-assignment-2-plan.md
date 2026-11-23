# 08 — Assignment 2: Implementation Plan

Source facts: [`notes/assignments.html`](https://courses.compute.dtu.dk/02242/notes/assignments.html)
§3. Theory: files [06](06-theory-semantics.md) and [07](07-theory-dynamic-analysis.md).

**Scope rule for this plan**: every instruction and every fuzzing technique
below is one the lecture itself hands you, worked example or explicitly
assigned exercise — not something pulled in from general JVM knowledge or
from scanning the repo's bytecode for what "looks common." If a case needs
an instruction the lecture never mentions, the lecture's own answer is to
look it up yourself the same way it tells you to look up `dup` (below) —
this plan doesn't pre-guess which those will be.

**Deadline: September 27, 2026 @ midnight.** Two deliverables from one
file, `solutions/dynamic/src/dynamic.py`:

| | Interpreter | Analysis |
|---|---|---|
| Passing bar | correctly execute **≥ 50%** of cases | score **≥ 100** |
| Generate | `jpamb interpret --report report.sexp dynamic-interpreter` | `jpamb analyse --report report.sexp dynamic-analysis` |
| Validate | `jpamb validate interpret report.sexp` | `jpamb validate analyse report.sexp` |
| Upload to | Autolab "Concrete Interpreter Assignment" | Autolab "Dynamic Assignment" |

## Part 1 — The interpreter, in the lecture's own order

`topics/semantics.html` §4 works through exactly five things, in this
order, and gives you either the full rule + Python or an explicit
assignment to do it yourself. Follow that order — it's also roughly
"cheapest/most foundational first" already.

### 1. Push — already done
Lecture's rule (pushI) and Python match `dynamic.py`'s existing
`case jvm.Push(type=t, value=v)` arm exactly. Nothing to do.

### 2. Load — lecture's next worked example, not yet in `dynamic.py`
Rule (loadI) and Python given directly in §4.3, "Example 2":
```
bc[ι] = (load:I n), (int v) = λ[n]
──────────────────────────────────
bc ⊢ ⟨λ, σ, ι⟩ → ⟨λ, σ(int v), ι+1⟩
```
```python
case jvm.Load(type=jvm.Int(), index=n):
    v = frame.locals[n]
    frame.stack.push(v)
    frame.pc += 1
```
This is missing from `dynamic.py` entirely today — there's no `case
jvm.Load(...)` arm — so it's the first gap to close, straight from the
lecture text.

### 3. Binary (divide-by-zero) — already done
Rules `bdivI0`/`bdivI1` and their Python match `dynamic.py`'s existing
`binary()` helper and its `Binary(type=jvm.Int(), operant=op)` case
(`ZeroDivisionError` → `"divide by zero"`) exactly. Nothing to do.

### 4. Return — lecture gives you the general case; `dynamic.py` only has the special case
§4.4 gives **both** termination rules and one combined Python snippet:
```python
case jvm.Return(type=jvm.Int()):
    v1 = frame.stack.pop()
    state.frames.pop()
    if state.frames:
        frame = state.frames.peek()
        frame.stack.push(v1)
        frame.pc += 1
    else:
        output = "ok"
```
`dynamic.py`'s current `Return` case only fills in the `else: output =
"ok"` branch (for `type=None`, i.e. `void`) and still has
`raise NotImplementedError("Still to be done")` sitting in exactly the
`if state.frames:` branch the lecture already wrote for you above. This is
a direct transcription from the lecture, not new research — the rule and
code are already in front of you in §4.4.

### 5. Ifz — fully worked in the lecture's §4.5
```python
case jvm.Ifz(condition=op, target=target):
    value = frame.stack.pop()
    assert isinstance(value, jvmc.StackInt)

    if compare(op, value.value, 0):
        frame.pc %= target
    else:
        frame.pc += 1
```
Not in `dynamic.py` today. Note it calls the existing `compare()` helper,
which currently only implements `CmpOpr.Eq` — running this on a real case
whose condition isn't `Eq` will hit `compare()`'s own
`raise NotImplementedError("Unhandled comparation")`. That's not a new
instruction to research; `CmpOpr` (`Ne/Eq/Lt/Le/Ge/Gt`) is already defined
in the repo's `jvm/opcode.py`, and `compare()`'s existing `Eq` arm already
shows the one-line pattern (`v1 == v2`) to repeat for the others — filling
in an enum you already have, not new JVM theory.

### 6. Dup — the lecture's explicitly assigned exercise
§4.5, verbatim: *"Write `dup` as small-step semantics"* and *"Encode `dup`
in case statement"*, pointing you at **the jvm2json codec, Wikipedia, and
the official Java spec** — named explicitly by the lecture as where to look
this one up, since (unlike Push/Load/Return/Ifz) it does not hand you the
rule. This is the one instruction the lecture wants you to derive yourself,
using the resources it names, not resources of your own choosing.

### 7. Everything past this point — the lecture's own stated process, not a pre-made list
§4.5's actual instruction is: *"Write a complete interpreter... print the
steps to reach the final state... handle all the bytecode instructions
progressively."* Its advice for doing that:
- **Start small, one method at a time** — pick whichever case you're
  currently failing, not a global instruction checklist.
- **"It's okay to hack some things"** — the assertion-detection shortcuts
  already in `dynamic.py` (`$assertionsDisabled`, treating `New
  AssertionError` as an immediate crash) are the lecture's own style of
  sanctioned hack, not a shortcut you invented.
- **Print state to stderr for debugging** — already present at the top of
  `step()`.
- **Use `--step-wise`** for iterative debugging:
  ```bash
  jpamb -vv interpret --filter Simple --step-wise dynamic-interpreter
  ```

In practice this means: run the interpreter, let it crash with
`NotImplementedError` on whatever instruction a real case needs next, and
look *that specific instruction* up the same way the lecture told you to
look up `dup` — rather than this guide pre-selecting which instructions
matter. Re-run `jpamb interpret dynamic-interpreter` after each fix to see
the pass rate move.

## Part 2 — The fuzzer, in the lecture's own order

`topics/dynamic-analysis.html` names exactly five input-selection
techniques, in this order, from simplest to most sophisticated. The
`analyse()`/`fuzz_input()` already in `dynamic.py` implements the first
one; the rest are the lecture's own next steps, not additions of mine.

1. **Random input generation** — *"generate inputs randomly from their
   domains... works well when input space aligns with path-equivalence
   space."* This is exactly what `fuzz_input()` does today (`rand.randint`
   per parameter). The lecture's own caveat about this technique — it's
   weak whenever a branch depends on one specific value rather than a
   range — is the reason to move to the next technique, not a flaw to fix
   by inventing something new.
2. **Dictionary-based fuzzing** — lecture's description: scan the code for
   constant values (via *syntactic* analysis — the same style of pass as
   Assignment 1), build a dictionary of them, and sample from that
   dictionary instead of a uniform random value.
3. **Coverage-guided fuzzing** (the lecture names AFL++) — *"maintains a
   corpus of interesting test cases... measures coverage for each test...
   mutates interesting cases (byte changes, deletions, appends)... adds
   mutants to the corpus only if they increase coverage."*
4. **Property-based testing** (the lecture names Hypothesis) — check an
   invariant across many generated inputs rather than one fixed expected
   output. Mentioned for completeness; JPAMB asks for a per-outcome
   prediction rather than an invariant check, so this is the least directly
   applicable of the five to `analyse()`'s actual job.
5. **Small-scope hypothesis** (the lecture names SmallCheck, Alloy) —
   *"most bugs... can be found by investigating only a small section of the
   inputs,"* implemented as exhaustive enumeration up to depth `d`,
   increasing `d` (iterative deepening). Lecture's own caveat: this misses
   bugs gated behind a large specific constant.

Move down this list in order, re-running `jpamb analyse dynamic-analysis`
after each change to watch the score move toward 100. Stop wherever the
score clears 100 — the lecture doesn't rank these as "better/worse" beyond
what's quoted above, so there's no lecture-backed reason to implement all
five if an earlier one already clears the bar.

## Submission checklist

- [ ] `jpamb interpret dynamic-interpreter` shows ≥50% correct
- [ ] `jpamb interpret --report report.sexp dynamic-interpreter`
- [ ] `jpamb validate interpret report.sexp`
- [ ] Upload to Autolab **Concrete Interpreter Assignment**
- [ ] `jpamb analyse dynamic-analysis` shows ≥100 score
- [ ] `jpamb analyse --report report.sexp dynamic-analysis`
- [ ] `jpamb validate analyse report.sexp`
- [ ] Upload to Autolab **Dynamic Assignment**
- [ ] Group name in `dynamic.py`'s `getcase`/`getmethodid` calls changed
      from the banned placeholder `"The Rice Theorem Cookers"` (same issue
      file 03 flagged and you already fixed for Assignment 1)

Next: none yet — Assignment 3 (static analysis) wasn't published in detail
as of this writing; re-check the assignments page closer to its date.
