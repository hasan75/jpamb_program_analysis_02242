# Project status

Checklist of the build steps in `WORKFLOW.md` §3 (order from `DECISIONS.md` D9).
Claude updates this at the end of every session: tick what's done, add a short
note, and keep "Next" current.

Last updated: 2026-11-25 (step 8)

**Next:** paper. §4 Approach and §5 Implementation drafted (§4 reviewed and
revised); then §1 Gap/Innovation (contrast Statfier), §8 Related Work,
§6 Evaluation (RQ1 pre-registered + post-hoc `settled`, RQ2 cost, RQ3
validity, case study of the 5 inconsistencies), §7 Threats, §3 Overview.
`results-checker` once §6 exists.

---

## Build

- [x] **0. Baseline**
  - Assignment code committed (`a3885e4`), the starting point for the project.
  - Baseline `jpamb analyse` report of the current sign analyzer in
    `project/baseline/report.sexp` (console output in `analyse-output.txt`).
    Total score **322.97**. Weakest categories: divide by zero (found 32,
    missed 34) and infinite loop `*` (found 5, missed 50), which narrowing
    and the interval domain should improve.
  - Known: Docker daemon not running yet; `jpamb build` (needed from step 4 on)
    will fail until it is started.
- [x] **1. Sign narrowing + entry points** (D7)
  - `SignSet.refine` (narrowing) in `abstractions.py`; stack values carry the local
    they were loaded from (`State.origins`), so a branch refines that local.
  - Programs `static-sign` (no narrowing) and `static-sign-narrow` replace
    `static-analysis`. `static-interval` is added in step 2, once `Interval` exists.
  - Reports in `project/step1/`: `static-sign` **322.97** (identical to the
    baseline), `static-sign-narrow` **329.01**. Divide-by-zero false positives
    34 → 25, assertion error 23 → 22; no category found fewer real outcomes.
  - Fixed: `java_compare` did not handle `CmpOpr.Is` (null checks), so
    `test_signset_compare` failed; now treated as `Eq` (null is encoded as 0).
    Score unchanged. Tests: 10 pass, 3 interval stubs skipped.
  - Noticed: the harness `CmpOpr` has no `isnot`, though 5 decompiled
    instructions use it (`src/jvm/opcode.py`, not our code). Not fixed.
- [x] **2. Interval domain, worklist, widening** (D8)
  - `Interval` in `abstractions.py`: lattice, overflow-safe arithmetic (a result
    that leaves int32 becomes top), `compare`, boundary `refine` (no holes, D8),
    and `widen`. The interpreter in `static.py` now takes the domain as a
    parameter; it widens at loop heads (targets of backward edges).
  - Program `static-interval` (interval, narrowing, widening). All three analyzers
    of D7 now exist.
  - Reports in `project/step2/`: `static-sign` **322.97** and `static-sign-narrow`
    **329.01** (both unchanged from step 1), `static-interval` **325.27**. Found
    counts are equal in every category (no real outcome lost).
  - Interval vs. sign-narrow differ on 10 methods. Interval removes the false
    assertion error in `MagicConstants.unreachableRange` (`n > 100 && n < 50`).
    Sign-narrow removes false divide-by-zero alarms behind `n != 0` guards (e.g.
    `Dependent.safeDivByN`, `Simple.guardedDivision`, 4 `Extended.safe*`), which
    intervals cannot express (D8). So neither analyzer is uniformly more precise.
  - All 145 methods reach a fixpoint within the step cap, in both domains.
    Tests: 25 pass (interval lattice/Galois tests un-skipped, new soundness tests
    for arithmetic, compare, refine and widen).
- [x] **3. Abstract-state export, uncertain sites** (D14)
  - `solutions/static/src/export.py`, program `static-export`: runs the analyzer
    (default `static-interval`) on every benchmark method and writes, per method,
    the state at every instruction, its source line, the outcomes, and the sites
    (branch, divisor, array, goto) with an `uncertain` flag and the operand
    intervals and their locals (for input synthesis in step 6).
  - Line numbers: the decompiled JSON has a line table (`code.lines`). Its
    `offset` is the **instruction index** (same as `PC.offset`), not the byte
    offset in `Opcode.offset`; checked on `Dependent.safeDivByN` and over all
    sites (every branch and divisor site lands on a source line with a
    comparison or `/`/`%`). A condition split over several lines maps to the
    statement's first line.
  - Export in `project/step3/static-interval-states.json` (summary in
    `export-output.txt`): 145 methods, all at a fixpoint, outcomes identical to
    the step 2 `static-interval` report. 101 methods have an uncertain site.
    Sites: branch 232 (170 uncertain), divisor 65 (52), array 78 (78),
    backward/forward goto 43 (never uncertain). Analysis time 0.04 s in total.
    The `seconds` fields change on every run.
  - Tests: 30 pass (5 new in `tests/test_export.py`).
- [x] **4. Site finder + rewrite rules 1–2** (D6), audited by `rewrite-auditor`
  - New package `solutions/metamorphic/` (tree-sitter, as in `solutions/syntactic`),
    program `metamorphic-sites`. `javaexpr.py` checks the shared precondition
    (pure `int` operands, types from the method's declarations, fields never
    trusted); `rules.py` has R1 `invert` and R2 `swap`, `strict`, `split`, each
    with its equivalence argument; `sites.py` finds the sites in the 145
    benchmark methods, joins them to the step 3 export by line, and `apply`
    makes a variant (one rewrite per variant).
  - Output in `project/step4/sites.json` (summary in `sites-output.txt`):
    344 sites in 85 methods (all 145 methods matched to their source).
    R1-invert 64, R2-swap 153, R2-strict 70, R2-split 57. 317 are uncertain
    (74 methods). Most int comparisons in JPAMB are on unconstrained parameters,
    so few sites are settled; this matters for how much guidance can help (RQ1).
  - 19 sites (all in `BitOperations`) cannot be joined: the analyzer does not
    support `bitopr`, gives up with all outcomes and exports no states there.
    They count as not uncertain.
  - Rejected by the precondition: `char[]` comparisons (`Arrays`), method calls
    (`"fuzz".equals(name)`, `smith.draw()`), boolean conditions (`if (b)`),
    `i++ != 0`.
  - Not compiled yet (Docker is down, no local `javac`); compiling every
    variant is part of step 6. All variants re-parse without errors.
  - Audit (`rewrite-auditor`): no wrong rewrite among the 344 sites. It found
    three precondition gaps on Java outside the benchmark, now closed and each
    covered by a test: (1) pattern variables (`o instanceof Double d`) were not
    recorded as declarations; (2) a name used outside its `int` local's scope
    could be an interface constant or inherited field; (3) tree-sitter fails on
    some valid literals (`0_10`) and the rewrite dropped tokens. Fixes: names
    are resolved by scope (an `int` declaration must enclose and precede the
    use), pattern/lambda binders count as non-`int`, interface/enum/record
    names count as fields, methods with a parse error are skipped, and local
    enum/interface bodies are not searched. The site set did not change.
    Tests: 54 pass.
- [x] **5. Random / syntax-based / guided selection** (D15)
  - `solutions/metamorphic/src/selection.py`, program `metamorphic-select`:
    strategies `random`, `syntax`, `guided`, `guided-strict`; each gives an
    ordering of all 344 eligible sites per seed (0-9); N = 172 / 86 (D11).
  - Output in `project/step5/selections.json` (summary in
    `selections-output.txt`). Two runs give identical orderings.
  - At N = 172 (mean over seeds, uncertain hit / strict hit): random 158.0 /
    94.5, syntax 148.2 / 77.2, guided 172 / 102.7, guided-strict 172 / 172.
    Syntax hits fewer candidates than random: closeness to `/`/`assert` does
    not predict uncertainty here.
  - Tests: 63 pass in `solutions/metamorphic` (9 new in `test_selection.py`).
  - Noticed: the root `.venv/bin/pytest` has a stale shebang (repo moved), so
    `uv run pytest` fails at the root; `uv run python -m pytest` works
    (134 pass, 2 skipped). Three Markdown files in `assignment-guide/` and
    `course-notes/` fail `ruff format --check` (not project code).
- [x] **6. Validation: compile + synthesized inputs** (D16), reviewed by `rewrite-auditor`
  - Program `metamorphic-validate` (`validate.py`, harness `java/Validate.java`).
    Variants, compiled classes and decompiled JSON go to `build/variants/<vid>/`
    (gitignored, rebuilt by the program); step 8 analyzes the decompiled JSON.
  - Output in `project/step6/validation.json` (summary `validation-output.txt`):
    344 of 344 compile, **344 valid**, 0 discarded, 0 bytecode-identical to the
    original (on the extended benchmark after step 7: 408 of 408). 1-128 inputs per method. Original condition takes both values on
    the inputs for 138 sites, one value for 1, unknown for 205 (operands assigned
    in the method, or not plain parameters).
  - Mutants (`mutants.json`, `mutants-output.txt`): 217 wrong rewrites, 190
    killed; 25 equivalent (`equivalent-mutants.json`), so **190 of 192**
    non-equivalent killed. The 2 survivors (`Dependent.java:60`, `:79`) need
    coordinated values in two or three parameters.
  - The auditor's review found 10 missed mutants in the first run (array lengths,
    shifted/complemented constants, `int[]` and `Smith` inputs, missing zero base);
    the source-constant tier fixed 8. It found no way for a wrong rewrite to be
    reported valid by mistake.
  - Tests: 76 pass in `solutions/metamorphic` (13 new in `test_validate.py`).
- [x] **7. New benchmark cases** (D12)
  - `cases/jpamb/cases/Guards.java`: 15 methods, 31 cases, five patterns fixed in
    advance (D12); registered in `Runtime.caseclasses`. All 31 cases give their
    annotated outcome; old class files unchanged by the build.
  - `jpamb build`'s test phase hangs on `Loops.forever` (container not stopped
    on timeout); cases checked in one container instead. Coverage entries for
    Guards added to `target/stats/benchmark.sexp` by
    `experiments/extend_benchmark.py` (411 old entries checked unchanged).
    `checkhealth` passes.
  - Scores (`project/step7/<analyzer>/report.sexp`), 160 methods:
    `static-sign` 357.60, `static-sign-narrow` 367.25, `static-interval` 364.01
    (same order as on 145 methods; no category found fewer outcomes).
  - Steps 3-6 rerun into their folders: 160 methods; 408 sites (368 uncertain,
    `guided-strict` 215); N = 204 / 102; at N = 204 guided 204 vs random 183.4
    uncertain hits. All 408 variants compile and are valid. Mutants: 260, 31
    equivalent (6 new in Guards, added to `equivalent-mutants.json`), 227 of 229
    non-equivalent killed (survivors: the two `Dependent` ones).
  - `solutions/static/tests/test_export.py` no longer hard-codes 145 methods.
- [x] **8. Experiments + statistics** (D10, D11, D17)
  - `static.predict` + `ANALYZERS` shared by the CLI and the experiments;
    `tests/test_predict.py` checks it equals the step 7 reports (160 methods,
    3 analyzers).
  - Post-hoc strategy `settled` (D15) added; step 5 rerun, the four
    pre-registered orders unchanged (test).
  - `experiments/run.py` (outcomes of every original and valid variant per
    analyzer, `results/outcomes.json`), `stats.py` (distinct D10 tuples per
    strategy/seed/budget, all and without Guards, Mann-Whitney U + A12,
    `results/stats.json`), `cost.py` (reruns the pipeline into `build/cost/`,
    times each stage, checks the rerun reproduces steps 4-6 and the outcomes:
    all reproduced; `results/cost.json`), `paper_numbers.py`
    (`paper/generated/numbers.tex`, `tab-rq1`, `tab-inconsistencies`,
    `tab-cost`; deterministic).
  - Result (D17): pool of **5** distinct inconsistencies, all R2-strict, none
    for `static-interval`; 4 of 5 at settled sites. At N = 204 (mean total
    distinct over 10 seeds): random 3.1, syntax 3.6, guided 0.3,
    guided-strict 0.0, settled (post-hoc) 5.0; guided vs random p = 0.002,
    A12 = 0.10. Same direction without Guards and at 25%.
  - Cost: validation 232 s of 234 s total; guidance (export) 0.3 s.

## Paper (`paper/`, compiled in Overleaf)

- [x] **P1. Skeleton** (acmart, one file per section, layout from `PAPER-STRUCTURE.md`)
  - `paper/main.tex`, `sections/*.tex` (placeholders), `figures/pipeline.tex`
    (TikZ, Fig. 1), `generated/numbers.tex` (stub), `README.md`. Not yet
    compiled in Overleaf.
  - Section plan (D13, DECIDED) designed for this project in `PAPER-STRUCTURE.md`. Verified
    BibTeX for the two cited DTU papers (PDFs in `proposal/references/`) is in §3.
- [ ] **P2. Gap + Related Work** (`literature-scout` first)
  - `literature-scout` done: 11 verified entries in `paper/bibfile.bib`.
    **Statfier** (Zhang et al., ESEC/FSE 2023) already tests static analyzers
    with semantics-preserving transformations and picks sites from the
    analyzer's own warning locations; Gap/Innovation must state our difference
    (sites from a separate interval analysis's abstract state; abstract
    interpreters predicting outcome sets; comparison with random and
    syntax-based selection under one budget).
- [ ] **P3. Background, Overview (worked example + pipeline figure), Analysis-Guided Rewriting, Implementation**
  - Background drafted, reviewed (`paper-reviewer`: major revisions), revised
    against the code; per-analyzer method counts now from macros. Open: JPAMB
    citation.
  - §4 Approach and §5 Implementation drafted (2026-11-25). §4 reviewed
    (`paper-reviewer`: major revisions) and revised: D8 wording of the guide,
    site = (node, rule), table widths, no proposal references, guided-strict
    labeled as a sensitivity variant, input-tier wording, coverage claim now
    measured (`\NumCondBoth` etc.). Still ~2.5 p (budget 2.2): trim in P5.
    For Threats (§7): methods with non-int parameters validated on case inputs
    only (`\NumOneInput` methods have one input); line-level uncertainty join;
    loop rule out of scope; guided-strict and settled defined after seeing
    data. `evaluation.tex` skeleton still mentions a time budget: rewrite RQ2
    as the cost table (D11).
- [ ] **P4. Evaluation (RQ1–RQ3), Threats to Validity, Conclusion, Abstract**
- [ ] **P5. Final pass** (`paper-reviewer` + `results-checker`, ≤ 11 pages, no `\todo{}`)

## Open questions

- D2 grading scope: waiting for the user.
- Confirmed 2026-11-23: R2-split includes `==` (D6), and sites without an
  abstract state are eligible but not guided candidates (D14).
- Confirmed 2026-11-25: `guided` keeps D14; `guided-strict` added as a
  sensitivity check (D15).
- D12 upstream PR for new cases: decide later.

## Known issues

- The sign domain ignores int overflow (`MAX + 1` is reported as `{+}`), so it is
  unsound there; it is the assignment's design and is not changed, so that
  `static-sign` keeps its baseline score. The interval domain handles overflow.

- `.gitignore` ignores `*.sexp` everywhere except under `project/`
  (`!project/**/*.sexp`), so the analyzer reports there are committed.
