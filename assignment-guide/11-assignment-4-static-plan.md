# 11 — Assignment 4 (Static Analysis): What To Do

Source facts: [`notes/assignments.html`](https://courses.compute.dtu.dk/02242/notes/assignments.html)
§4. Theory: files [09](09-theory-bounded-static-analysis.md) (required)
and [10](10-theory-unbounded-static-analysis.md) (score boosters).

> Numbering: the course page calls the dynamic one "Assignment 3" and this
> one "Assignment 4". File 08 in this guide called the dynamic one
> "Assignment 2" — same assignment, different count.

## ⏰ Deadline: **October 11, 2026 @ midnight** — that is *tomorrow*.

Plan for one focused day. Part A gets you the analysis points fastest;
Part B is the extra work for the interpreter half.

## The deliverables

Both come from **one** package: `solutions/static/` (`src/static.py` +
`src/abstractions.py`), which already registers two scripts:
`static-interpreter` and `static-analysis`.

| | Abstract interpreter | Static analysis |
|---|---|---|
| Passing bar | correctly handle **≥ 50%** of cases (≥ 59/118) | score **≥ 100** |
| Generate | `jpamb interpret --abstract --report report.sexp static-interpreter` | `jpamb analyse --report report.sexp static-analysis` |
| Validate | `jpamb validate abstract-interpret report.sexp` | `jpamb validate analyse report.sexp` |
| Upload to | Autolab **"Abstract Interpreter Assignment"** | Autolab **"Static Assignment"** |

(Use a different `--report` filename for each so you don't overwrite one
with the other.) There's an anonymous scoreboard on the Static assessment.

## ✅ Status (Oct 11): simplified version

A first full version scored 201.13 / 100/118. It was then **deliberately
simplified** to keep only what the lecture covers:

- **Kept:** complete `SignSet` arithmetic/compare (+ tests); the basic
  instructions (push int, load, store, dup, incr, binary, if/ifz, goto,
  return, new, throw); `*` on backward jumps; and the sound fallback where
  an unknown instruction means "anything can happen".
- **Removed:** analysing called methods (a call now just reports "may fail
  an assertion" and returns an unknown value); `negate`/`cast`/char inputs.
- **Measured at 127.93** with arrays removed and plain `yes`/`no`. The `no`
  row was perfect (0 found / 127 missed → wager `-inf`), but `yes` was only
  44.5% right and earned ~1 point, and the 12 array methods earned almost
  nothing because the fallback said "yes" to all six outcomes.
- **Then re-added:** the four array instructions (references as signs:
  `{0}` = null, `{+}` = array; "out of bounds" is always possible) and one
  `yes` category per outcome (`okyes`, `aeyes`, …). Target: ~170–180.

The current version's scores still have to be measured (commands in the
checklist below). Gotcha: jpamb **refuses to write the report** (exit 1, no
message) while the group name is still `"The Rice Theorem Cookers"`, so it's
now `"Hasan Ahmed"`.

## Where you were before (measured Oct 10)

```
jpamb analyse static-analysis                → Total 32.70     (need 100)
jpamb interpret --abstract static-interpreter → 6/118 correct    (need 59)
pytest solutions/static                       → 5 passed, 3 skipped (Interval tests)
```

Setup (one-time, same `.jpamb-eval` venv you used before):
```bash
source .jpamb-eval/bin/activate
uv pip install --editable solutions/static
```

### Why the scaffold scores so low — 4 concrete problems

1. **Unhandled opcodes silently vanish.** `manystep` has no `case _:`.
   Any opcode it doesn't know (`Push`, `Store`, `If`, `Incr`, `Dup`,
   `NewArray`, `ArrayLoad`, …) yields *nothing*, so that path is dropped,
   the outcome is never reached, and `analyse()` prints a confident
   **`;no`** — which is *wrong* (unsound, see file 09 §1). That's why the
   category table shows `no: found 33, missed 132`.
2. **`SignSet.arithmetic` only does `Add`; `compare` only does `Le`.**
   Running over all methods, the crashes are: `TODO: ne` ×12, `sub` ×2,
   `eq` ×2, `mul`, `div`.
3. **The `Binary` arm is buggy.** `arithmetic()` returns
   `(SignSet, set[str])`, but `manystep` does
   `for res in SignSet.arithmetic(...)`, which iterates over that tuple and
   ends up pushing the error *set* as a stack value
   (`AssertionError: Expected sign set but got set()`).
4. **The abstract interpreter is graded on coverage.** For
   `--abstract`, jpamb gives you the concrete input and checks that your
   output **covers all reachable program points** (warning: *"Did not
   cover all reachable program points"*). Dropped paths (problem 1) fail
   this directly; cases with no output at all show *"No response created"*.

## Part A — Fix the core (gets most of both bars)

Work in this order; rerun `jpamb analyse static-analysis` after each step.

### A1. Finish `SignSet` (abstractions.py) — file 09 §3.5
Implement in `arithmetic()`: `Sub`, `Mul`, `Div`, `Rem`. Rules of thumb:
- `Sub`: `a - b` = `a + (−b)` — flip b's signs and reuse Add.
- `Mul`: sign of product = product of signs (anything × 0 = 0).
- `Div`/`Rem`: if `0 in other.signs` → add `"divide by zero"` to the
  error set. Compute the result only over non-zero divisors. Careful:
  integer division truncates, so `{+}/{+}` can be `0` (1/2 = 0) →
  result `{0,+}`. `Rem` result takes the sign of the dividend, or 0.
- If the result set ends up empty (e.g. divisor was only `{0}`), return
  an empty SignSet and the caller must *not* continue that path.

Implement in `compare()`: `Eq`, `Ne`, `Lt`, `Gt`, `Ge` (Le is given).
Simplest sound approach: for every pair `(x, y)` of signs, add every
boolean that's possible for *some* concrete numbers with those signs
(e.g. `+` vs `+` can be both `<` and `>` and `==`; `0` vs `0` is only
`==`; `−` vs `+` is only `<`).

Then **extend the tests**: add the new oprs to the
`st.sampled_from([...])` lists and to the `arithmetic()`/`compare()`
helpers in `tests/test_abstractions.py`. Hypothesis then proves (well,
checks) soundness for you. `cd solutions/static && uv run pytest`.

Careful with Java semantics in the test helper for `Div`/`Rem`: Python's
`//` and `%` floor toward −∞; Java truncates toward 0. Use
`int(x / y)`-style truncation (`abs(x)//abs(y)` with sign), and skip
`y == 0`.

### A2. Fix the `Binary` arm (static.py)
```python
case jvm.Binary(operant=op):
    [v1, v2], after = state.pop(2)
    res, errs = v1.arithmetic(v2, op)
    yield from errs                       # e.g. "divide by zero"
    if res.signs:                         # empty ⇒ no normal successor
        yield (pc + 1, after.push(res))
```

### A3. Add the missing opcodes — use your `dynamic.py` as the template
The lecture literally says "add steps to `manystep` using the interpreter
as guide". For each arm in `solutions/dynamic/src/dynamic.py:step()`,
write the abstract version:

| Opcode | Abstract version |
|---|---|
| `Push(value=v)` | int → `SignSet.abstract([v])`; reference/null → see A4 |
| `Store(index=n)` | pop, `state.store(n, v)`, `pc + 1` |
| `Dup(words=1)` | pop one, push it twice |
| `Incr(index=n, amount=k)` | `locals[n].arithmetic(SignSet.abstract([StackInt(k)]), Add)` |
| `If(condition=op, target=t)` | pop 2, `v1.compare(v2, op)`, yield to `pc % t` for True / `pc + 1` for False (same shape as `Ifz`) |
| `Cast(Int→Short)` | push `SignSet.top()` (sound and simple) |
| `Return(type=Int)` | `yield "ok"` (already there) |
| invoke | push `top()` for the return value (if non-void), `pc + 1`; to be sound also `yield` the outcomes the callee could raise — or just analyse it as "anything can happen" |

And then — most important line of the whole assignment:

```python
case a:
    # Unknown opcode: be sound, not silent.
    yield from ["ok", "divide by zero", "assertion error",
                "out of bounds", "null pointer", "*"]
```
(Or `raise NotImplementedError(a.help())` while developing so you *see*
what's missing, then switch to the "anything can happen" fallback before
submitting.) Never let a path silently disappear.

### A4. Arrays and references (cheap but sound)
The state stores `SignSet` per slot, and `initialstate` already models
array arguments as `SignSet.from_sign("+")` (non-null reference). Keep
that trick: treat references as signs — `{0}` = null, `{+}` = non-null.
- `NewArray`: pop size; if `-1 in size.signs` → may be negative (Java
  throws `NegativeArraySizeException` — not one of JPAMB's outcomes;
  check what the case files expect); push `{+}`.
- `ArrayLength`: if `0 in ref.signs` → yield `"null pointer"`; push
  `{0,+}`.
- `ArrayLoad`/`ArrayStore`: null check as above. Signs can't prove
  `index < length`, so always yield `"out of bounds"` too, then continue
  with `top()` as the loaded value. (Intervals from file 10 fix this.)
- `Push(null)` → `{0}`.

### A5. Make `analyse()` answer well
Today it prints `;no` / `;maybe`. Improve it:
- If the loop exited because the **worklist is empty** (fixed point
  reached), an outcome not in `final` really is impossible → `0%`.
- If it exited because **`steps` ran out**, you only know bounded facts —
  be less confident (e.g. `20%`), and that's also your best hint for
  `*` (infinite loop).
- Reached outcomes → high percentage (e.g. `80%`); the sign domain
  over-approximates, so not 100%.
- Raise `steps = 300` if needed; also remove/guard the
  `print(..., file=sys.stderr)` in `step()` if it slows you down.

Tune the percentages using the category table jpamb prints (it tells you
the optimal wager per category) — same idea as in Assignment 1.

## Part B — Pass the abstract interpreter (≥ 59/118)

It reuses everything in Part A — same `manystep`, but started from the
concrete input (`initialstate(..., inputs)`) and run through
`interpret()`. Once A3/A4 stop dropping paths, the *"Did not cover all
reachable program points"* failures go away. Then:

1. Run `jpamb interpret --abstract static-interpreter` and read the
   remaining warnings; `jpamb inspect <methodid>` shows the bytecode.
2. **Step budget:** `interpret()` gets `steps` from jpamb (100 in the
   default run) and spends one per worklist step *and* one per final
   outcome. For loops, a slot widens to `top()` within ~3 joins (Sign has
   height 4) so it converges — but if you add intervals, you'll need
   widening (file 10 §2.3) or you'll run out of steps.
3. Unsupported input types in `initialstate` (`raise NotImplementedError`
   for e.g. strings/chars) cause *"No response created"* — map them to
   `top()` / `{+}` instead of raising.

## Part C — Optional score boosters (from file 10)

Only after both bars pass and are uploaded:
1. **Branch refinement on locals** (the `safeDivByN` fix, file 10 §1):
   when `Ifz/If` tests a value that came from `Load(i)`, meet `locals[i]`
   with the refined sign in each successor. Kills many false
   "divide by zero" maybes.
2. **Intervals** + widening at loop heads (file 10 §2.2–2.3) for array
   bounds and loop termination. Implement the `Interval` stub and
   un-skip its three tests.
3. **Worklist order** by PC offset (≈ reverse post-order, file 10 §2.4.1).

## Submission checklist

```bash
source .jpamb-eval/bin/activate
(cd solutions/static && uv run pytest)                       # abstractions still sound
uv run ruff check solutions/static && uv run ruff format solutions/static

jpamb analyse --report static-report.sexp static-analysis
jpamb validate analyse static-report.sexp                   # → upload to "Static Assignment"

jpamb interpret --abstract --report abstract-report.sexp static-interpreter
jpamb validate abstract-interpret abstract-report.sexp      # → upload to "Abstract Interpreter Assignment"
```

- [ ] Analysis total ≥ 100
- [ ] Abstract interpreter ≥ 59/118
- [ ] Both reports validate
- [ ] Both uploaded to Autolab before midnight Oct 11
- [ ] Consider changing the team name in `getmethodid`/`getcase`
      (`"The Rice Theorem Cookers"` is the scaffold default)
