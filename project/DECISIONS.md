# Project decisions

Decision log for *Analysis-Guided Metamorphic Testing of Java Static Analyzers*.
Claude reads this at the start of every session. Update it whenever a decision
changes; keep one entry per question.

Status values: **DECIDED** (final), **PROVISIONAL** (Claude's recommended
default, in use until the user confirms or changes it), **PENDING** (open,
do not build anything that depends on it).

Last updated: 2026-11-25

---

## Scope and setup

### D1. Who works on the project
**DECIDED (revised 2026-11-25).** Group project: DTU Compute Group 20,
Abdullah Al Abid, Afonso Fonseca Morais de Sousa Pina, Hasan Ahmed and
Mahmudul Hasan Aunoy (Shohan Morol from the proposal is not an author). The
paper lists all four; running heads show the title and "DTU Compute Group 20".
Shohan's share (EST 5, PRW 3, PWP 2) goes to the four remaining members.
No contribution table in the paper (decided by the group). Build on branch
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

Built in step 4 (`solutions/metamorphic/src/rules.py`) as these forms:
- **R1-invert:** `if (c) A else B` → `if (¬c) {B} else {A}` (no else: `{}`);
  `c` may combine int comparisons with `&&`, `||`, `!`; ¬c by De Morgan, so
  operands are evaluated in the same order. Both branches always get braces
  (else-if chains, dangling else).
- **R2-swap:** `a < b` → `b > a`; only if at most one operand may throw.
- **R2-strict:** `x > c` ↔ `x >= c+1` etc., `c` a decimal literal, `c±1`
  computed by the rewriter and kept within int32.
- **R2-split:** `a != b` → `(a < b || a > b)`, and also `a == b` →
  `(a <= b && a >= b)`. **DECIDED** (user, 2026-11-23): `==` is included. The
  proposal names "equivalent integer comparisons" in general (line 132), the
  equivalence argument is the same, and 34 of the 57 split sites are `==`,
  many of them divide-by-zero guards (`divisor == 0`), where the analyzers
  differ most (D8). In the paper it is one rule, stated for both directions.
"Pure int" is checked syntactically: int locals/parameters (every declaration of
the name in the method is `int`, one of them encloses and precedes the use, and
no field, interface constant, enum constant or record component has that name), int literals,
`+ - * / % & | ^ << >> >>> ~`, `id.length`, and `id[e]` on `int[]`. Method
calls, `++`, assignments, casts, `char`, `long`, fields and pattern variables
are rejected, and methods that tree-sitter cannot parse are skipped. Audited by
`rewrite-auditor` in step 4: no open counterexamples.

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
Step 4 joins a rewrite site by its own line, or by the first line of its
statement if the export has no branch on that line. A line-level join is
coarse: two comparisons on one line share one flag.

**DECIDED** (user, 2026-11-23): a site where the guide has **no abstract
state** (the analysis gave up on the method; 19 sites, all in `BitOperations`,
whose `bitopr` none of the analyzers supports) stays **eligible** for every
strategy but is **not a candidate** for the guided one (`uncertain: false`).
Reason: all three analyzers predict every outcome there (step 2 reports), and
no rule touches the unsupported operations, so a rewrite there can never give
an inconsistency; marking them uncertain would make guidance waste budget
(proposal line 98), and removing them would hide that random selection does.
Paper, Threats to Validity: the guide shares its implementation with the
analyzers under test, so it knows exactly where they give up; a guide built
separately from the analyzers under test would not know this.

### D15. Selection strategies
**PROVISIONAL** (built in step 5, `solutions/metamorphic/src/selection.py`).
Each strategy returns an **ordering of all eligible sites**; a rewrite budget N
takes its first N, a time budget takes sites in that order until T runs out.
RNG `random.Random(f"{strategy}/{seed}")` over sites sorted by id.
- `random`: uniform shuffle (proposal: uniform over all eligible sites).
- `syntax`: by line distance from the site to the nearest `/`, `%` or `assert`
  in the same method (tree-sitter only); ties shuffled; methods without one last.
- `guided`: D14 candidates (`uncertain`; 317 on 145 methods, 368 on 160) shuffled first, then the rest.
- `guided-strict` (**DECIDED** by the user, 2026-11-25, as a sensitivity
  check, not a replacement): candidates are uncertain sites in methods with an
  uncertain divisor or array access in the export (187 sites, 42 methods on
  145 methods; 215 sites, 49 methods on 160).
  Reason: under D14, 92% of the sites are candidates (most JPAMB comparisons
  are on unconstrained parameters), so at N = 172 random already hits ~158
  candidates; `guided` stays the main strategy so the definition is not tuned
  after seeing data. Paper: report both, and state in Threats to Validity that
  the strict variant was added after counting candidates, and that array
  accesses are always uncertain (D14), which makes the strict filter partly
  syntactic.
- `settled` (**DECIDED** by the user, 2026-11-25, **post-hoc, exploratory**):
  sites with an abstract state that are not uncertain (21 sites) first, then
  the rest. Defined *after* step 8 showed that the inconsistencies occur at
  settled sites. Paper: report it separately from the pre-registered
  comparison, marked post-hoc, never as the technique's result.

### D16. Validating variants
**PROVISIONAL** (built in step 6, `solutions/metamorphic/src/validate.py` +
`java/Validate.java`). A variant is **valid** when it compiles and gives the
same **outcome and return value** as the original on every synthesized input
(stricter than the outcome alone). All Java runs in one container of the
jvm2json image; one JVM per method (original + its variants, own class loader
each, assertions on), 1 s timeout per input (`*`), the JVM restarted after a
timeout (`Thread.stop` is gone in current JDKs). Both versions timing out
counts as equal.
Inputs per method (deterministic, cap 128), in priority order under the cap:
1. the `@Case` inputs;
2. from the interval export: per parameter, the interval boundaries ±1 at its
   branch/divisor sites, compared constants ±1, {0, ±1, MIN, MAX}; varied one
   parameter at a time from each case input and from all-zero;
3. constants from the method source (int literals, array initializer lengths,
   their complements `~c`, and shifts `c << s` by literal s), ±1;
4. 16 random combinations.
`int[]` methods get `[I: c]` for source constants c ≥ 0 (InputParser reads no
negative numbers in an array literal); `Smith` methods get each constant as
the first w bits for each `draw(w)`, plus 8 random bit strings; other
reference types use only `@Case` inputs.
Sensitivity check (`--mutants`): one deliberately wrong rewrite per rewritten
node (R2: off-by-one/opposite operator; R1: negated condition without the
swap). The mutants that no input can kill (25 on 145 methods, 31 on 160) are listed with an argument each
in `project/step6/equivalent-mutants.json` (rewrite-auditor review,
2026-11-25). Paper, Threats to Validity: one-at-a-time synthesis cannot
produce coordinated values (the 2 surviving mutants in `Dependent`), and the
condition-coverage check (`condition_values`) is only computed for conditions
on parameters the method never assigns.

---

## Evaluation

### D10. What counts as one distinct inconsistency
**PROVISIONAL.** A unique tuple
`(analyzer, method, rewrite rule, original outcome set, variant outcome set)`.
The same weakness found by several seeds or sites counts once.

### D17. Step 8 result: where the inconsistencies are
**FINDING** (step 8, 2026-11-25; `experiments/results/`). Rewriting all 408
valid variants gives only **5 distinct inconsistencies**, all from R2-strict,
none for `static-interval`: `Loops.java:19`/`:27` (`while (i > 0)` to
`i >= 1`, sign and sign-narrow) and `Guards.java:138`/`:139` (one tuple,
sign-narrow). Four of the five come from sites the guide *settles*: the sign
domain abstracts `0` to `{0}` but `1` to `{+}`, so `{+} > 0` is decided and
`{+} >= 1` is not. This refutes the D14 hypothesis that settled sites cannot
change the outcome: a site the precise guide settles can still be undecided
for a coarser analyzer once the constant changes. Consequence (user decision):
RQ1 is reported as pre-registered (guided and guided-strict find fewer than
random and syntax, p <= 0.002), the post-hoc `settled` strategy (D15) is
reported separately, and the paper explains the mechanism with a case study.

### D11. Experiment parameters
**PROVISIONAL.**
- **Seeds:** 10 (the proposal says at least ten).
- **Rewrite budget N:** chosen after counting eligible sites on the final
  benchmark. Default: N = 50% of all eligible sites, so random selection
  cannot simply rewrite everything. Also report a second value (25%) to show
  the trend.
  Computed by `selection.budgets` from the eligible count: on the step 4 sites
  (344), N = 172 (50%) and 86 (25%). With the step 7 cases (408 eligible
  sites), N = 204 (50%) and 102 (25%).
- **Time budget T:** **cut** (user, 2026-11-25). With a pool of 5 distinct
  inconsistencies a time-budget comparison says nothing. RQ2 instead reports
  **cost per stage** (in the text of Sec. 6.4, no table, to save space): wall-clock time per pipeline stage (`experiments/cost.py`,
  which reruns the pipeline into `build/cost/` and checks it reproduces the
  committed results), and the guidance overhead (the export).
- **Statistics:** Mann–Whitney U per analyzer, guided vs. each baseline,
  plus an effect size (Vargha–Delaney A12). As run (step 8): `stats.json` has the
  per-analyzer tests, but the paper tests the total over the three analyzers,
  because `static-interval` has no inconsistency, and gives per-analyzer means
  in Table `tab:rq1`.

---

## Benchmark

### D12. New benchmark cases
**DECIDED (partly).** Add new cases now in `cases/jpamb/cases/` and register
them in `cases/jpamb/Runtime.java` (`caseclasses`). Note:
`docs/extending-jpamb.md` gives an outdated path (`src/main/java/...`).
**PENDING:** whether to submit them upstream as a PR. Decide later.

Built in step 7 (2026-11-25): one class, `cases/jpamb/cases/Guards.java`, 15
static methods with `int` parameters, 31 `@Case`s (every reachable outcome),
using only opcodes the analyzers support. Five patterns fixed before any
experiment result existed, three methods each: guarded division with
different guard forms; range check before array access (incl. off-by-one
bugs); branches the analysis can settle (clamping, constant flag, loop bound);
assertions on facts from an earlier branch; else-if chains used after the merge.
**Reporting rule (PROVISIONAL):** the "settled" pattern adds sites guidance
can skip, so RQ1 is reported with and without `Guards`, and Threats to
Validity says the cases were written by the author of the technique.
Build notes: `jpamb build`'s test phase hangs on `Loops.forever` here (the
5 s timeout stops the docker client but not the container), so the Guards
cases were checked in one container instead (31/31 correct). The coverage file
`target/stats/benchmark.sexp`, which `jpamb analyse` reads its method list
from, gets entries for Guards only, via `experiments/extend_benchmark.py`
with `static-interpreter` (31/31 correct); the 411 existing entries are
checked unchanged.

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
