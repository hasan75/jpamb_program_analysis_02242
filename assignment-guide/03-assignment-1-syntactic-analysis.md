# 03 — Assignment 1: Syntactic Analysis

Source: [`notes/assignments.html`](https://courses.compute.dtu.dk/02242/notes/assignments.html)

## The facts

- **Deadline**: September 13, 2026, midnight.
- **Task**: "Develop the best syntactic analysis you can" for the JPAMB
  benchmark.
- **Passing bar**: total score **≥ 100 points**.
- **Requires**: `jpamb` version **0.5.1 or later**. Check yours with:
  ```bash
  grep '^version' pyproject.toml
  ```
- **Submission is via Autolab**, not git/GitHub:
  - Sign up once at
    https://autolab.compute.dtu.dk/courses/join_course?access_code=0DH0FX
    (access code `0DH0FX`), if you haven't.
  - Upload target: https://autolab.compute.dtu.dk/courses/02242-E26/assessments/syntactic
  - Anonymous scoreboard (see how you rank, no names shown):
    https://autolab.compute.dtu.dk/courses/02242-E26/assessments/syntactic/scoreboard

## The 3 rules that actually matter

1. **Individual submission.** You submit for yourself.
2. **Group work is allowed**, but the group name printed by your analyzer's
   `info` mode must stay **consistent** across your submissions.
3. **The group name `"Rice Theorem Cookers"` is explicitly banned.** That's
   the placeholder name hardcoded in JPAMB's starter files
   (`solutions/syntactic/src/*.py`) — if you forget to change it, your
   submission breaks this rule. **You already changed it to `"Potato
   Analyzer"`** in `solutions/syntactic/src/syntactic_bytecode.py` — good,
   nothing to do here unless you want a different name.
4. Confirm the academic-integrity checkbox on Autolab (standard DTU policy).

## The submission workflow (3 commands)

Every time you want to submit (you can resubmit as many times as you like
before the deadline):

```bash
source .jpamb-eval/bin/activate                        # activate your eval venv
jpamb analyse --report report.sexp syntactic-bytecode   # 1. run + write report.sexp
jpamb validate report.sexp                              # 2. sanity check it
# 3. upload report.sexp at the Autolab link above
```

`--report` re-runs the *entire* analysis and writes a machine-readable
scoring artifact (`report.sexp`) — that file, not your Python source, is
what you upload. `jpamb validate` replays that file and shows you the same
score table one more time, so you can catch a broken report *before*
spending an Autolab submission on it.

## Where you stand right now

- You've built and submitted an analyzer:
  `solutions/syntactic/src/syntactic_bytecode.py`, entry point
  `syntactic-bytecode` (see `solutions/syntactic/pyproject.toml`).
- Local score: **118.24** (well above the 100-point bar), confirmed
  identical when validating your actual submitted `report.sexp`.
- It passes `ruff check` and `ruff format --check` (the repo's CI lint
  gate, see `.github/workflows/lint.yml`), which doesn't affect your
  Autolab score but is good practice.
- **You already uploaded `report.sexp` to Autolab.** From here, everything
  is optional improvement — see file 5 in this guide if you want to push
  the score further before the deadline.

## Important subtlety: how your score is actually calculated

Your analyzer doesn't print raw point values. Per line, it prints one of:
- a **wager** (e.g. `5` or `-10`) — a direct bet,
- a **percentage** (e.g. `75%`),
- or a **category** (any string you invent, e.g. `assert-yes`) — this is
  what your analyzer uses.

For categories, `jpamb` looks at **every prediction across the whole
benchmark suite** that used that exact category string, checks how often it
was actually correct, and computes the *mathematically optimal* wager for
you (formula in `docs/rules.md`). This means:

- You don't need to hand-tune numbers — pick a reasonable "yes"/"no" style
  split and let the tool calibrate it.
- **Category strings are pooled globally, not per-outcome.** If you print
  `"yes"` for both "assertion error" and "divide by zero", `jpamb` computes
  *one* combined hit-rate for the label `"yes"` across both — which usually
  *hurts* your score, because a wager that's great for one outcome is
  mediocre for another. This is why your analyzer uses distinct labels per
  outcome (`assert-yes`/`assert-no`, `div-yes`/`div-no`,
  `oob-yes`/`oob-no`, `ok-yes`) instead of one generic `yes`/`no` pair. Keep
  this in mind for anything you add yourself.

## What's coming after this assignment

Two more mandatory assignments this term (same Autolab course, `0DH0FX`):

| # | Topic | Deadline |
|---|---|---|
| 2 | Dynamic Analysis | September 27, 2026, midnight |
| 3 | Static Analysis | October 11, 2026, midnight |

Both were listed as "expected soon" (not published in detail yet) when this
guide was written. Worth re-checking
https://courses.compute.dtu.dk/02242/notes/assignments.html closer to those
dates.

Next: [04 — Your Analyzer, Explained](04-your-analyzer-explained.md)
