# The proposal, explained

A plain-language walkthrough of everything in `proposal/`: what the project
is, every concept the proposal uses, each section of `main.tex`, the plan and
contribution table, and what the other files in the folder are for.

---

## 0. The folder at a glance

| File | What it is |
|---|---|
| `main.tex` | **The proposal itself** (ACM `acmart` LaTeX). This is what gets submitted and later grows into the final paper. |
| `bibfile.bib` | The two references cited: Chand et al. 2024 and Domingues et al. 2025 (both DTU student papers from earlier years of this course). |
| `lstlean.tex` | A Lean syntax-highlighting definition left over from the course template. Unused: the proposal shows Java code. Kept only because the template includes it. |
| `IMPROVEMENTS.md` | Change log: what was changed after grading round 1 (score 10/24) and round 2, section by section, and why. |
| `FEEDBACK-DISCUSSION.md` | Meeting prep for the professor: each round-2 comment, what changed, and ready answers to likely questions. |
| `optional-references.md` | Three outside papers (Klinger 2019, Cuoq 2012, Chen 2018) and a drop-in Gap paragraph that uses them, to aim for 4/4 on Gap. **Not yet verified:** written from memory. |

---

## 1. The project in one paragraph

Static analyzers (like the ones you build for JPAMB) predict whether a method
can crash, for example divide by zero. Ideally the prediction depends only on
**what the code does**, not on **how it is written**. But imprecise analyzers
often give different answers for two methods that behave identically. The
project builds a tool that **rewrites Java methods into equivalent versions**
and checks whether an analyzer's prediction changes. The research twist is
**where** to rewrite: instead of choosing rewrite locations at random, the
tool uses an abstract interpretation (an interval analysis) to find locations
where a rewrite is likely to expose a difference. The experiment checks
whether this "guided" choice finds more inconsistencies, faster, than random
or purely syntactic choice.

Title: **Analysis-Guided Metamorphic Testing of Java Static Analyzers.**

- *Metamorphic testing* = test a system without knowing the right answer, by
  checking a relation between outputs. Here the relation is "equivalent
  programs → same analyzer prediction".
- *Analysis-guided* = a static analysis decides where to apply the rewrites.
- *Java static analyzers* = the systems under test, i.e. JPAMB analyzers.

---

## 2. Background concepts you need

### Static analysis and JPAMB predictions
A JPAMB analyzer gets a method ID (e.g. `jpamb.cases.Simple.divideByZero:(I)I`)
and outputs, for each outcome, how likely it is to be reachable:
`ok`, `divide by zero`, `assertion error`, `out of bounds`, `null pointer`,
`*` (infinite loop). It does **not** run the method on concrete inputs; it
reasons over all inputs at once.

### Abstract interpretation, abstract domains, abstract state
Instead of tracking concrete values (`x = 5`), the analyzer tracks
*abstractions* of all possible values at each program point:

- **Sign domain:** each variable is a set of signs from `{-, 0, +}`.
  `x ∈ {+}` means "x is positive". This domain exists in the repo already
  (`solutions/static/src/abstractions.py`).
- **Interval domain:** each variable is a range `[lo, hi]`, e.g. `x ∈ [1, 10]`.
  More precise than signs. In the repo `Interval` is currently a **stub**; the
  project has to build it.
- The **abstract state** at a program point = the abstract value of every
  local/stack variable there. The guided strategy reads these states.

### Precision vs. soundness
- **Sound**: never misses a real error (may over-warn).
- **Precise**: few false warnings.
An analyzer that warns on a safe division is *sound but imprecise*. The
proposal stresses that an inconsistency between two equivalent methods does
**not** necessarily mean the analyzer is wrong (unsound); it often just means
it was more conservative on one version. That is still a real usability
problem: developers see warnings appear and disappear after harmless
refactorings.

### Narrowing at branches (also called "refinement" / "branch filtering")
After `if (x > 0)`, a precise analyzer knows `x > 0` inside the `then` branch
and `x <= 0` in the `else` branch, and *narrows* `x`'s abstract value
accordingly. The current repo sign analyzer **does not** do this: it keeps
`x ∈ {-,0,+}` in both branches, so it warns about division by zero even on a
guarded division (verified on `Simple.checkBeforeDivideByN2`).

> Terminology note: in abstract-interpretation textbooks "narrowing" also
> names the dual of widening for loop fixpoints. In this proposal it means
> **using a branch condition to refine variable values**.

### Merge points
Where two control-flow paths meet (after an `if/else`, at a loop head), the
analyzer *joins* the two abstract states, e.g. `{+} ⊔ {0} = {0,+}`. Joining
loses information. Rewrites that move where paths merge can change how much
information is lost, and so can change the analyzer's answer.

---

## 3. Section-by-section: `main.tex`

The proposal follows the course rubric order:
**Context → Gap → Innovation → Evaluation → Plan.**

### 3.1 Context — *what is the problem?*

The two methods

```java
int f(int x) {            int f(int x) {
    if (x > 0)                if (x <= 0)
        return 100 / x;           return 0;
    return 0;                 return 100 / x;
}                         }
```

behave identically for every `int x`: neither can divide by zero. Yet an
imprecise analyzer *could* warn on one and not the other. The paragraph
makes two points:
1. Precision can depend on the **form** of the code, not just its meaning.
2. Such a discrepancy is not necessarily unsoundness; it can be different
   degrees of conservatism. But users experience it as flaky warnings.

(Graded 4/4, unchanged since round 1.)

### 3.2 Gap — *why doesn't existing work solve this?*

It discusses two earlier DTU papers and says why neither answers the question:

| Prior work | What they did | Why it doesn't solve our problem |
|---|---|---|
| **Chand et al. 2024** | Applied semantics-preserving variations (renaming variables/methods) to compare an LLM vs. the Infer analyzer at finding null-pointer exceptions, scored by reported line numbers. | Variations were a generic robustness check, **not placed using information about the program**. |
| **Domingues et al. 2025** | Used abstract interpretation to guide a **fuzzer's inputs** toward error-revealing values on JPAMB. | A static analyzer's prediction **doesn't depend on runtime inputs**. Choosing better inputs can't reveal whether the *analyzer* depends on the *code's form*. You have to vary the **program**. |

Conclusion of the Gap: you must vary the program itself, and **it is open
where to vary it**. Rewriting at arbitrary places wastes effort on code whose
analysis result cannot change.

One-line answer if asked: *Domingues tests the program and uses analysis to
pick inputs; we test the analyzer, so our "inputs" are equivalent versions
of the program.*

### 3.3 Innovation — *what exactly is new?*

**Research question:**
> Can the abstract state computed by a lightweight analysis select
> semantics-preserving rewrite sites that reveal prediction inconsistencies
> in a Java static analyzer more efficiently than random or purely syntactic
> selection?

**Key observation:** a rewrite can only change an analyzer's answer where the
analyzer's precision depends on the code's *form*: how a branch condition is
written, where control flow merges, or how a loop is laid out.

**Worked example from the proposal:** the repo's sign analyzer doesn't
narrow at branches, so it warns on **both** versions of `f`. Inverting the
branch therefore reveals *nothing* for that analyzer: same (imprecise) answer
both times. The proposal **hypothesizes** that an analyzer which *does*
narrow can lose that information when a rewrite moves where branches merge,
giving different answers. Milestone M1 tests this hypothesis before the rest
of the work depends on it.

**Definitions (the core vocabulary):**

| Term | Meaning |
|---|---|
| **Site** | A program location where a rewrite could be applied (in practice: a branch/comparison, or a loop). |
| **Eligible site** | A site where some rewrite rule's precondition holds, so it *can* be rewritten safely. |
| **Uncertain site** | In the abstract state there, (i) the branch condition can still be both true and false, **or** (ii) a divisor / array index may still be zero / out of bounds. I.e. the analysis hasn't "decided" this spot. |
| **Candidate site** | Uncertain **and** a rewrite there changes a feature the analyzer's precision depends on: branch polarity, where branches merge, whether a jump goes backward, or the form of a comparison. |
| **Variant** | The rewritten version of a method. |
| **Inconsistency** | The **same** analyzer predicts a different *set of outcomes* for the original method and its variant. |

Why uncertain sites? If the analysis already *knows* a condition is always
true (or a divisor is never zero), any analyzer at least that precise will
agree on both versions; there's nothing to expose. Uncertainty is where
precision is "on the edge", so the code's form can tip the result.

**Budget and selection rule:**
- There is **one budget of N rewrites for the whole benchmark**, not per
  method. Reason: most JPAMB methods have only 0–2 real sites (19 of 47 have
  no branches at all; each `assert` adds a `$assertionsDisabled` branch that
  can't be rewritten in source). With a per-method budget, random selection
  would rewrite nearly everything too, and all strategies would look the
  same.
- The **guided strategy** spends the budget on candidate sites first
  (choosing randomly among them), and only then on other eligible sites.
- There is deliberately **no ranking score**: with so few sites per method it
  would almost never change the choice.

**What gets built:**
1. **Parser-based site finder:** parses Java source, finds eligible sites,
   checks preconditions.
2. **Rewrite rules**:
   - *Branch inversion with branch swapping:* `if (c) A else B` →
     `if (!c) B else A` (as in the `f` example).
   - *Equivalent integer comparisons:* e.g. `x > 0` ↔ `x >= 1`,
     `a < b` ↔ `b > a`.
   - *Loop reshaping:* e.g. `while (c) body` ↔ `if (c) do body while (c)`;
     changes whether/where there is a backward jump and loop-head merge.
3. **Guided selector:** uses abstract states to pick candidate sites.
4. **Interval domain** next to the existing sign domain.

(The concrete rewrite examples above are illustrations, not quoted from the
proposal.)

Why these rewrites might matter, illustrated: a sign analyzer that narrows
only on comparisons with `0` learns `x ∈ {+}` from `x > 0`, but learns
nothing from the equivalent `x >= 1`. Same meaning, different form,
different precision → potential inconsistency.

**How behavior preservation is ensured (two layers):**
1. **Preconditions (the guarantee).** Each rule only fires if: the condition
   has no side effects, it compares `int` values, and the rule doesn't touch
   arithmetic that could overflow. Example of an excluded rule:
   `x + 1 > y` → `x >= y` is wrong when `x = Integer.MAX_VALUE` (`x + 1`
   overflows to a negative number).
2. **Synthesized tests (catch implementation bugs).** From the abstract
   state, generate inputs that make each rewritten condition true and false,
   plus the boundary values of each variable's interval. Run original and
   variant; if outcomes differ, discard the variant. This is the
   **"analysis-informed test synthesis" (NTS)** contribution.

### 3.4 Evaluation — *how will we know if it works?*

**Systems under test: three analyzers that differ only in precision**

| Analyzer | Precision |
|---|---|
| Sign analysis, **no** narrowing at branches | lowest (= current repo analyzer) |
| Sign analysis **with** narrowing | middle |
| Interval analysis | highest |

They differ for reasons that have nothing to do with the selection
strategies, so the evaluation isn't rigged in favor of guidance. (An earlier
draft used deliberately injected faults; the grader pointed out you could
plant faults exactly where your guidance looks, so this was dropped.)

Inconsistencies are always measured **within one analyzer** (original vs.
variant). Two *different* analyzers disagreeing only shows one is more
precise; that is not a metamorphic inconsistency.

**Three selection strategies** (same eligible sites, same rewrite rules):

| Strategy | How it picks sites |
|---|---|
| **Random** (baseline) | Uniformly from all eligible sites. |
| **Syntax-based** (baseline) | Prefers sites close to a division or assertion (pure syntax, no analysis). |
| **Guided** (ours) | Candidate sites first, using the **interval analysis's** abstract states. Interval is chosen because sign is too coarse: almost every site would look "uncertain", making guided ≈ random. |

**Two experimental settings:**

| Setting | Fixed | Measures |
|---|---|---|
| **Rewrite budget** | Every strategy produces the same number N of variants. | How *well* each strategy chooses sites. |
| **Time budget** | Every strategy gets the same wall-clock time T; the guided strategy's analysis time counts toward T. | Whether guidance is *worth its cost*. |

Each repeated with **≥ 10 random seeds** (strategies involve randomness).

**Metrics:**
- **Distinct inconsistencies.** Suggested definition (not yet in the text):
  a unique (method, rewrite rule, changed outcome set) combination, so one
  weakness found many times counts once.
- **Valid variants:** compile and pass the synthesized tests.
- **Time to first inconsistency.**
- **Total runtime.**

**Statistics:** **Mann–Whitney U test**, a non-parametric test that compares
two groups (e.g. 10 seeds of guided vs. 10 seeds of random) without assuming
a normal distribution. Appropriate for small samples of counts.

**Subjects:** JPAMB's integer and branch methods, plus **new cases** written
by the group and submitted as JPAMB additions (the EXB contribution).

**Rewrites that don't change bytecode** are reported separately. JPAMB
analyzers read the *bytecode* (decompiled JSON), not the source. `javac` may
compile two source variants to identical bytecode (e.g. it already inverts
`if` conditions into jump instructions), and such a variant can never change
the answer.

**Threats to validity:**
1. Limited language coverage (only `int` comparisons, branches, loops).
2. Correctness of the rewrites.
3. How representative JPAMB is of real code.
4. The guiding analysis (interval) is also one of the analyzers under test,
   which may favor the interval analyzer.

### 3.5 Plan — milestones

| Milestone | Date | Deliverable |
|---|---|---|
| **M1** | 7 Nov | Proof of concept: 5 method pairs, 2 rewrites, first version of branch narrowing in the sign analyzer, run through `jpamb build` + `jpamb analyse`. **Tests the core hypothesis.** |
| **M2** | 14 Nov | Site finder, all rewrites, three selection strategies, interval domain, full branch narrowing. |
| **M3** | 22 Nov | Extended benchmark; rewrites checked with tests synthesized from the abstract state. |
| **M4** | 29 Nov | Experiments, statistics, paper. (Presentation 6 Dec.) |

**Fallbacks:**
- If M1 shows no inconsistencies for a rewrite → replace that rewrite before M2.
- If the interval domain isn't ready at M2 → use sign-with-narrowing as a
  temporary guide.

> Note: today (7 Nov 2026) is the M1 deadline.

**Gantt chart** (Figure 1): bars from 28 Oct to 29 Nov, vertical lines at
Proposal (22 Oct), Paper (29 Nov), Presentation (6 Dec).

---

## 4. The contribution table (Table 1)

The course grades by "contributions": each has a max point value, and the
group distributes points among members. Each member is examined on the parts
they own.

| ID | Contribution | Max | What it is in this project |
|---|---|---|---|
| **ISY** | Syntactic analysis | 10 | Parser-based site finder + syntax-based baseline |
| **NCR** | Analysis-informed rewriting | 10 | Guided selection of rewrite sites using abstract states |
| **NTS** | Analysis-informed test synthesis | 10 | Generating test inputs from abstract states to validate variants |
| **EXB** | Accepted JPAMB additions | 5 | New benchmark cases submitted upstream |
| **EST** | Statistical evaluation | 5 | Seeds, Mann–Whitney U, etc. |
| **PRW** | Relate recent papers | 10 | Related-work section |
| **PWP** | Write final paper | 10 | Shared by all (2 each) |
| **PEX** | Illustrating examples | 4 | Examples like `f(x)` in the paper |
| **PDI** | Process diagram | 3 | Pipeline figure |
| **PMG** | Project management | 6 | (Grader required 6, not 9) |
| | **Total** | **73** | |

**Ownership:**

| Member | Area | Points |
|---|---|---|
| S1 Abdullah Al Abid | Parsing and rewriting (ISY 6, NCR 4, PWP 2, PMG 3) | 15 |
| S2 Hasan Ahmed | Abstract domains and guidance (NCR 6, NTS 5, PWP 2, PMG 3) | 16 |
| S3 Afonso Pina | Related work and test synthesis (NTS 5, PRW 7, PWP 2, PEX 2) | 16 |
| S4 Mahmudul Hasan Aunoy | JPAMB integration, benchmark additions, syntactic analysis, syntax baseline (ISY 4, EXB 5, PWP 2, PEX 2, PDI 3) | 16 |
| S5 Shohan Morol | Experiments, statistics, part of related work (EST 5, PRW 3, PWP 2) | 10 |

"Suggested maximum grade" row: 10/10/10/10/7 (S5 has fewer points, so a lower
cap). The change log flags that this row should be checked against the
course's points-to-grade mapping.

**As S2 (Hasan), your part is:** the interval domain, branch narrowing in the
sign analyzer, computing abstract states, the guided selector's use of them
(uncertain/candidate classification), and providing abstract states for test
synthesis.

---

## 5. How the proposal maps onto this repository

| Proposal concept | Where it lives / will live |
|---|---|
| Sign analyzer without narrowing | `solutions/static/src/static.py` + `abstractions.py` (existing) |
| Interval domain | `Interval` in `solutions/static/src/abstractions.py` (currently a stub) |
| Benchmark subjects | `cases/jpamb/cases/*.java` (`Simple`, `Loops`, `Arrays`, …) |
| New JPAMB cases (EXB) | new files in `cases/`, registered in `Runtime.caseclasses` |
| Running analyzers on variants | `uv run jpamb build` (compile + decompile) then `uv run jpamb analyse` |
| Bytecode the analyzers actually read | `target/decompiled/**/*.json` |

Pipeline in short:

```
Java source ─► site finder (parse, check preconditions)
            ─► selector (random | syntax | guided by interval abstract states)
            ─► rewrite ─► variant source
            ─► synthesized tests (original vs variant on boundary inputs) ─► discard if different
            ─► jpamb build ─► each of 3 analyzers on original + variant
            ─► compare outcome sets ─► inconsistency?
```

---

## 6. Grading history (from the change logs)

| Criterion | Round 1 | Round 2 | Main issue raised |
|---|---|---|---|
| Context | 4/4 | — | none |
| Gap | 1/4 | 1/4 ("great improvement") | Round 1: a research question isn't a gap. Round 2: one irrelevant clause. |
| Innovation | 1/4 | 1/4 | Unclear what "uncertain" means / why there; then: ranking unclear, behavior preservation unclear, not enough technical content for 5 people. |
| Evaluation | 2/4 | 2/4 | Faulty analyzers biased; then: "log book" phrasing, budgets unclear, which guide? |
| Plan | 1/4 | — | PMG too high; ownership too evenly spread. |
| Presentation | 1/4 | — | Too many paragraph breaks; use "Innovation" not "Contribution". |

All of these have been addressed in the current `main.tex`.

**Still open** (from the notes):
- Gap cites only DTU papers → capped at 3/4. `optional-references.md` has
  outside references, but they **must be verified** before use. Also, its
  drop-in paragraph still contains the clause *"in JPAMB an analyzer receives
  only the method"* that round 2 asked to remove; fix that before using it.
- The interval domain has no contribution row of its own.
- LaTeX hasn't been compiled locally; layout/length unchecked.
- Group agreement needed on the table, on interval as the fixed guide, and on
  NTS ownership.
