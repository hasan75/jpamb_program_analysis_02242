# 05 — Improve It Yourself: A Step-by-Step Path

Your analyzer already passes (118.24 / 100 needed). Everything below is
**optional**, ordered from easiest to hardest. Each step tells you the
pattern to look for and lets you write the actual line — this is meant to
be done by hand so you understand it, not pasted in.

**The loop for every step below is always the same:**
```bash
# 1. edit solutions/syntactic/src/syntactic_bytecode.py
# 2. reinstall it into your eval venv so the entry point picks up the change
source .jpamb-eval/bin/activate
uv pip install --editable solutions/syntactic
# 3. re-run and check the new score
jpamb analyse syntactic-bytecode
```

## Step 1 (easiest): add `null pointer` detection

A `NullPointerException` happens whenever the JVM dereferences a `null`
reference. In bytecode, that's any of these opcodes:

- `getfield` — reading an instance field. In the decompiled JSON this is
  `{"opr": "get", "static": False, ...}` (note: `"static": True` is
  `getstatic`, which reads a *class* field and can never NPE — only check
  the `False` case).
- `arraylength` — `{"opr": "arraylength", ...}` (getting an array's
  length; NPEs if the array reference is null). Real example from
  `cases/jpamb/cases/Arrays.java`'s `arrayIsNullLength`:
  ```
  {'index': 0, 'offset': 8, 'opr': 'load', 'type': 'ref'}
  {'offset': 9, 'opr': 'arraylength'}
  ```
- `array_load` / `array_store` — you already check these for `out of
  bounds`; they can *also* NPE if the array reference itself is null
  (accessing `arr[i]` first dereferences `arr`).
- an instance method call — `{"opr": "invoke", "access": "virtual", ...}`
  or `{"opr": "invoke", "access": "interface", ...}` (calling a method
  *on* an object can NPE if that object is null). Real example from
  `cases/jpamb/cases/Strings.java`'s `sayHello`:
  ```
  {'access': 'virtual', 'method': {..., 'name': 'equals', ...}, 'offset': 9, 'opr': 'invoke'}
  ```
  (Note: `"access": "special"` is used for constructors — right after
  `new`, so the reference is never null there — and `"access": "static"`
  calls have no receiver object at all. Skip both of those for this check.)

**Your task**: add a `has_null_deref` boolean, extend the `if/elif` chain in
the bytecode loop to set it under the conditions above, then print
`"null pointer;npe-yes"` or `"null pointer;npe-no"` instead of `skip` (and
remove `"null pointer"` from the `skip` exclusion list at the bottom).

Skeleton (fill in the `...`):
```python
elif opr == "get" and not inst["static"]:
    has_null_deref = True
elif opr == "arraylength":
    has_null_deref = True
elif opr in ("array_load", "array_store"):
    oob_found = True
    has_null_deref = True          # <- same opcode also implies this
elif opr == "invoke" and inst.get("access") in (..., ...):   # fill in
    has_null_deref = True
```

Run `jpamb analyse syntactic-bytecode` afterward and read the new
`npe-yes`/`npe-no` rows in the category table — check whether the
percentage looks sane (if it's near 0% or 100%, your heuristic is either
under- or over-firing; that's fine, just notice it).

## Step 2: add `*` (infinite loop) detection

Loops compile to a **backward branch**: a `goto`, `if`, or `ifz` whose
`target` offset is *at or before* its own `offset`. Real example — the
whole body of `cases/jpamb/cases/Loops.java`'s `forever()` method is
literally:
```
{'offset': 0, 'opr': 'goto', 'target': 0}
```
(jump to offset 0 from offset 0 — an unconditional self-loop, i.e. a
guaranteed infinite loop).

**Your task**: add a `has_backward_branch` boolean, check for `opr in
("goto", "if", "ifz")` where `inst["target"] <= inst["offset"]`, then print
`"*;loop-yes"` / `"*;loop-no"` instead of skipping.

This is a **coarser heuristic than the others** — it flags *any* loop
construct, not just ones that never terminate (a normal `for` loop also has
a backward branch, and most of those *do* terminate). Expect this
category's hit-rate to be lower than the others; that's fine, `jpamb` will
just calibrate a smaller wager for it. This is the "may" over-approximation
idea from file 1 in action.

## Step 3: check your work with `checkhealth` and the linter

After any change:
```bash
uv run ruff check solutions/syntactic/src/syntactic_bytecode.py
uv run ruff format solutions/syntactic/src/syntactic_bytecode.py   # auto-fixes formatting
```
Both should pass before you consider a change "done" — this mirrors what
`.github/workflows/lint.yml` runs in CI for the main repo.

## Step 4 (bigger jump): try a different level of the syntax ladder

If you want to actually experiment with the other tools from file 2's
theory rather than only extending the bytecode approach:

- `solutions/syntactic/src/syntactic_regex.py` — Type 3 (regular
  expressions) on raw Java source text. Try extending the regex to also
  search for `/` (division) or `[` (array access) between the method
  signature and its closing `}` — this is literally the exercise
  suggested in lecture 1's introduction page.
- `solutions/syntactic/src/syntactic_treesitter.py` — Type 2 (context-free,
  via Tree-sitter). It already scopes correctly to the right class+method
  before searching for `assert_statement` nodes. Try adding a second query
  for `(binary_expression operator: "/")` inside the same method body,
  following the lecture's own divide-by-zero worked example.

Each of these is a **separate, independent script** — you can run any of
them the same way:
```bash
jpamb analyse syntactic-regex
jpamb analyse syntactic-treesitter
jpamb analyse syntactic-bytecode
```
Comparing their scores side by side is a good way to build intuition for
which level of syntax is actually worth the effort for a given outcome.

## Step 5: sanity-check calibration before you resubmit

Remember the pooling gotcha from file 3: reused generic labels (`"yes"`
shared across two different outcomes) get miscalibrated. After adding any
new category, look at the `--- Categories ---` table and confirm:
- each of your labels appears **exactly once** per outcome direction (e.g.
  you should never see the same string like `"yes"` used for two different
  outcome rows),
- the `Percentage` column looks plausible for what the check is actually
  detecting (e.g. if `npe-yes` shows 95%, your heuristic is probably firing
  on almost every method — check whether that's really true or a bug).

## Step 6: resubmit

Once you're happy with a change:
```bash
source .jpamb-eval/bin/activate
jpamb analyse --report report.sexp syntactic-bytecode
jpamb validate report.sexp
# upload the new report.sexp to Autolab — it overwrites/adds to your submission history
```
You can repeat this as many times as you want before tonight's deadline
(see file 3). There's no penalty for resubmitting, so treat every
improvement as "try it, measure it, submit it" rather than saving changes
up for one final submission.
