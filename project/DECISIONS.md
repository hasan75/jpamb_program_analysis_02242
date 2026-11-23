# Project decisions

Decision log for *Analysis-Guided Metamorphic Testing of Java Static Analyzers*.
Claude reads this at the start of every session. Update it whenever a decision
changes; keep one entry per question.

Status values: **DECIDED** (final), **PROVISIONAL** (Claude's recommended
default, in use until the user confirms or changes it), **PENDING** (open,
do not build anything that depends on it).

Last updated: 2026-11-23

---

## Scope and setup

### D1. Who works on the project
**DECIDED.** Solo project (Hasan Ahmed). Build on branch
`project/metamorphic-isolated` only; do not read or merge other branches.

### D2. Grading scope / contribution rows claimed
**PENDING.** Will be given later. Until then, follow the full scope of
`proposal/main.tex`, but build in the order of D9 so that cuts are easy.
Professor's final feedback on the proposal's evaluation (2026-11-23): "The scope
is not too ambitious, but should be enough." So deliver the full proposed scope
(rules 1–2, three analyzers, three strategies, statistics); don't cut core
items, and treat the loop rule (D6.3) and the time budget (D11) as extras.

### D3. Deadline and length
**DECIDED.** Paper deadline 29 Nov 2026 (fixed). Presentation 6 Dec 2026.
Paper length 10–11 pages (acmart `acmsmall`, as in the proposal), **including
references and any appendix**.

### D4. Build environment
**DECIDED.** Docker, for `uv run jpamb build`.

### D5. Paper format and authorship
**DECIDED.** LaTeX in `paper/`, based on `proposal/main.tex` (acmart).
Claude drafts the prose; the user reviews it and compiles in Overleaf (no
local LaTeX). Claude keeps the source compilable, keeps figures as TikZ/pgfplots
or files in `paper/figures/`, and estimates length rather than claiming page counts. Every number comes from a
script in `experiments/`, and every citation must be a verified real paper.

---

## Technical decisions

### D6. Rewrite rules
**PROVISIONAL.** Build in this order; stop where time runs out:
1. **Branch inversion with swap:** `if (c) A else B` → `if (!c) B else A`,
   with `!c` written as the negated comparison (`x > 0` → `x <= 0`).
2. **Equivalent integer comparison:** e.g. `x > 0` ↔ `0 < x`,
   `x >= 1` ↔ `x > 0`, `x != 0` ↔ `x < 0 || x > 0`. No rule that adds or
   removes arithmetic (`x+1 > y` → `x >= y` is wrong at `MAX_VALUE`).
3. **Loop reshaping** (`while (c) B` → `if (c) do B while (c)`): only if
   1–2 are finished and evaluated.

Preconditions for every rule: the condition has no side effects, it compares
`int` values, and no arithmetic that may overflow is changed.

### D7. How the three analyzers under test are run
**PROVISIONAL.** One shared implementation in `solutions/static/`, exposed as
three separate programs (entry points), each with its own `info` name:
- `static-sign`: sign domain, no narrowing at branches
- `static-sign-narrow`: sign domain, narrowing at branches
- `static-interval`: interval domain, narrowing and widening

Reason: `jpamb analyse <PROGRAM>` treats each as a separate analyzer, so the
existing scoring and reports work unchanged.
Built in step 1 (2026-11-23): `static-sign` and `static-sign-narrow` share
`run_analysis` in `solutions/static/src/static.py`; `static-interval` was added
in step 2 (2026-11-23), passing the domain to the same driver.

### D8. Interval vs. sign precision
**PROVISIONAL.** An interval has no holes: refining `[-inf, inf]` with
`x != 0` cannot remove 0, while signs give `{-, +}`. Decision:
- implement the standard boundary refinement (`[0, hi]` with `x != 0`
  → `[1, hi]`);
- do **not** build a reduced product unless there is time left;
- state the limitation in the paper (Approach, and Threats to Validity),
  and don't call interval "the most precise" without qualification.

Built in step 2 as decided. The step 2 reports confirm the limitation: sign-narrow
beats interval on `n != 0` guards, interval beats sign-narrow on range checks.

### D9. Build order (so that cuts are easy)
**PROVISIONAL.**
1. Sign narrowing + three entry points (D7)
2. Interval domain, worklist fixpoint, widening (D8)
3. Export of per-PC abstract states and uncertain sites
4. Site finder + rewrite rules 1–2 (D6)
5. Random / syntax-based / guided selection
6. Validation: compile variants + test inputs synthesized from intervals
7. New benchmark cases (D12)
8. Experiments and statistics (D10, D11)
9. Paper (drafted in parallel from step 4 on)

### D14. What makes a site uncertain
**PROVISIONAL.** As built in step 3 (`solutions/static/src/export.py`), from
the `static-interval` state before the instruction:
- **branch** (`if`): the condition can be both true and false;
- **divisor** (`/`, `%`): the divisor may be zero *and* may be nonzero. A
  divisor that is certainly 0 is a settled outcome, like a branch with one
  outcome (reading of "may still be zero", proposal line 118);
- **array access**: always uncertain, because no domain tracks array lengths,
  so no access is proven in bounds. State this as a limitation in the paper.
Backward `goto`s are recorded but never uncertain. Sites are joined to the
source by line (`uncertain_lines`).

---

## Evaluation

### D10. What counts as one distinct inconsistency
**PROVISIONAL.** A unique tuple
`(analyzer, method, rewrite rule, original outcome set, variant outcome set)`.
The same weakness found by several seeds or sites counts once.

### D11. Experiment parameters
**PROVISIONAL.**
- **Seeds:** 10 (the proposal says at least ten).
- **Rewrite budget N:** chosen after counting eligible sites on the final
  benchmark. Default: N = 50% of all eligible sites, so random selection
  cannot simply rewrite everything. Also report a second value (25%) to show
  the trend.
- **Time budget T:** secondary experiment, only if the rewrite-budget
  experiment is done. Default T = the guided strategy's median runtime at
  budget N.
- **Statistics:** Mann–Whitney U per analyzer, guided vs. each baseline,
  plus an effect size (Vargha–Delaney A12).

---

## Benchmark

### D12. New benchmark cases
**DECIDED (partly).** Add new cases now in `cases/jpamb/cases/` and register
them in `cases/jpamb/Runtime.java` (`caseclasses`). Note:
`docs/extending-jpamb.md` gives an outdated path (`src/main/java/...`).
**PENDING:** whether to submit them upstream as a PR. Decide later.

---

## Paper

### D13. Paper structure
**DECIDED** (outline confirmed by the user, 2026-11-23). Sections are designed for this project, not copied from
another paper (course papers have no fixed list): Abstract · 1 Introduction
(Context, Gap, Innovation, Evaluation, Contributions) · 2 Background (JPAMB,
metamorphic testing, the three analyzers under test) · 3 Overview (worked
example + pipeline figure) · 4 Analysis-Guided Rewriting (inconsistency,
sites/candidates, rewrite rules, selection strategies, validation) ·
5 Implementation · 6 Evaluation (RQ1 effectiveness, RQ2 cost, RQ3 validity,
what the inconsistencies reveal) · 7 Threats to Validity · 8 Related Work ·
9 Conclusion. Rationale, page budget, figures and verified BibTeX are in
`project/PAPER-STRUCTURE.md`. Only the layout is set here; the project and
evaluation stay as in `proposal/main.tex`, and the RQs only split its
evaluation into separate questions.
References and any appendix count towards the 11-page limit (user,
2026-11-23). So: no appendix by default; proofs stay short in §2.3/§4.3.
