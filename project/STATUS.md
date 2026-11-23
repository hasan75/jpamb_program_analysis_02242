# Project status

Checklist of the build steps in `WORKFLOW.md` §3 (order from `DECISIONS.md` D9).
Claude updates this at the end of every session: tick what's done, add a short
note, and keep "Next" current.

Last updated: 2026-11-23

**Next:** step 5, random / syntax-based / guided selection over the step 4 sites (`project/step4/sites.json`).

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
- [ ] **5. Random / syntax-based / guided selection**
- [ ] **6. Validation: compile + synthesized inputs**
- [ ] **7. New benchmark cases** (D12)
- [ ] **8. Experiments + statistics** (D10, D11)

## Paper (`paper/`, compiled in Overleaf)

- [ ] **P1. Skeleton** (acmart, one file per section, layout from `PAPER-STRUCTURE.md`)
  - Section plan (D13, DECIDED) designed for this project in `PAPER-STRUCTURE.md`. Verified
    BibTeX for the two cited DTU papers (PDFs in `proposal/references/`) is in §3.
- [ ] **P2. Gap + Related Work** (`literature-scout` first)
- [ ] **P3. Background, Overview (worked example + pipeline figure), Analysis-Guided Rewriting, Implementation**
- [ ] **P4. Evaluation (RQ1–RQ3), Threats to Validity, Conclusion, Abstract**
- [ ] **P5. Final pass** (`paper-reviewer` + `results-checker`, ≤ 11 pages, no `\todo{}`)

## Open questions

- D2 grading scope: waiting for the user.
- D12 upstream PR for new cases: decide later.

## Known issues

- The sign domain ignores int overflow (`MAX + 1` is reported as `{+}`), so it is
  unsound there; it is the assignment's design and is not changed, so that
  `static-sign` keeps its baseline score. The interval domain handles overflow.

- `.gitignore` ignores `*.sexp` everywhere except under `project/`
  (`!project/**/*.sexp`), so the analyzer reports there are committed.
