# Project status

Checklist of the build steps in `WORKFLOW.md` §3 (order from `DECISIONS.md` D9).
Claude updates this at the end of every session: tick what's done, add a short
note, and keep "Next" current.

Last updated: 2026-11-23

**Next:** step 1, sign narrowing and the three analyzer entry points.

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
- [ ] **1. Sign narrowing + three entry points** (D7)
- [ ] **2. Interval domain, worklist, widening** (D8)
- [ ] **3. Abstract-state export, uncertain sites**
- [ ] **4. Site finder + rewrite rules 1–2** (D6), audited by `rewrite-auditor`
- [ ] **5. Random / syntax-based / guided selection**
- [ ] **6. Validation: compile + synthesized inputs**
- [ ] **7. New benchmark cases** (D12)
- [ ] **8. Experiments + statistics** (D10, D11)

## Paper (`paper/`, compiled in Overleaf)

- [ ] **P1. Skeleton** (acmart, one file per section)
- [ ] **P2. Gap + Related Work** (`literature-scout` first)
- [ ] **P3. Approach, Implementation, worked example, pipeline figure**
- [ ] **P4. Evaluation, Threats to Validity, Conclusion**
- [ ] **P5. Final pass** (`paper-reviewer` + `results-checker`, ≤ 11 pages, no `\todo{}`)

## Open questions

- D2 grading scope: waiting for the user.
- D12 upstream PR for new cases: decide later.

## Known issues

- `.gitignore` line `.sexp` ignores only a file literally named `.sexp`; `*.sexp` was
  probably meant. It also contains a leftover merge-conflict marker (`<<<<<<< HEAD`).
  Not fixed; ask the user.
