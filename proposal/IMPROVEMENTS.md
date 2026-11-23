# Proposal revision: improvements made after feedback

Original score: **10/24** (overall: Unsatisfactory).
Revised files: `main.tex`, `bibfile.bib` (unchanged, still the two DTU
references), `lstlean.tex` (unchanged). Optional outside references are kept
separately in `optional-references.md`.

---

## Context (4/4)

**Feedback:** none. The problem and the `f(x)` example were rated "Great".

**Changes:** content kept. Sentences were merged into a single paragraph
(see Presentation), and one clause was added at the end explaining why the
problem matters in practice: developers see warnings appear or disappear after
harmless refactorings.

---

## Gap (1/4)

**Feedback:** "A research question is not a gap. You do not answer 'why do
current techniques not work?'."

**Before:** described the two DTU papers, then stated our research question
("We propose to investigate a different question ...") and one unsupported
sentence ("Uninformed transformation selection may waste tests ...").

**Changes:**
- The research question was removed from the Gap paragraph and moved to
  Innovation.
- The paragraph now explains *why* existing work does not answer the problem:
  - **Chand et al. (2024):** described accurately (checked against the
    paper). They applied semantics-preserving variations (e.g. renaming
    variables and methods) to compare an LLM and the Infer analyzer, measuring
    results by line numbers. The variations were a robustness check and were
    not placed using information about the program. The old text described
    this work as LLM-only, which was inaccurate.
  - **Domingues et al. (2025):** used abstract interpretation to guide a
    fuzzer's **inputs** on JPAMB (checked against the paper).
  - **Technical argument:** a static analyzer's prediction does not depend on
    inputs (in JPAMB an analyzer receives only the method), so input-level
    guidance cannot reveal whether an analyzer depends on how the code is
    written. That requires varying the program, and where to vary it is the
    open problem.
- No new references were added. `optional-references.md` holds a version with
  three outside papers if the group later wants to aim for 4/4.

---

## Innovation (1/4), formerly titled "Contribution"

**Feedback:** "It is unclear how your sign/interval analysis decides that a
site is 'uncertain', or why such sites should be where the analyzer under test
behaves inconsistently, and this guidance is your core contribution." Also:
not enough technical contribution for all members to pass.

**Changes:**
- **Heading renamed** from "Contribution" to "Innovation" (see Presentation).
- **Why target these sites:** a rewrite can only change an analyzer's result
  where its precision depends on the *form* of the code (branch condition,
  where control flow merges, loop layout). Illustrated with our own sign
  analyzer, which does not narrow values at branches and therefore warns on
  *both* versions of `f`. This was verified on the repository's analyzer
  (`solutions/static`), which reports a possible division by zero on the
  guarded division in `Simple.checkBeforeDivideByN2`. That an analyzer
  which *does* narrow at branches gives different answers on equivalent
  versions is stated as a hypothesis, tested in milestone M1, not as a fact.
- **Definition of an uncertain site:** at that program point, (i) a branch
  condition can still be both true and false, or (ii) a divisor or array
  index may still be zero or out of bounds.
- **Definition of a candidate site:** uncertain **and** one of our rewrites
  changes a feature the analyzer's precision depends on there (branch
  polarity, merge points, backward jumps, comparison form).
- **Selection rule:** the guided strategy ranks candidate sites first; random
  selection draws uniformly from all syntactically eligible sites.
- **Definition of an inconsistency:** a difference in the set of predicted
  outcomes for an original method and its variant under the **same** analyzer.
- **Larger technical scope:** a parser-based site finder, rewrites with stated
  conditions for preserving behavior (branch inversion, equivalent integer
  comparisons, loop reshaping), the guided selector, and a new interval domain
  next to the existing sign domain.

---

## Evaluation (2/4)

**Feedback:** "Define what makes an analyzer variant 'faulty' and how you
avoid placing faults where your guidance looks; alternatively, analyzers with
different abstractions (e.g. sign vs. interval) may already provide natural
inconsistencies."

**Changes:**
- **Deliberately faulty analyzers removed.** We follow the grader's suggestion
  and instead test three analyzers that differ in a known way: sign analysis
  without narrowing at branches, sign analysis with it, and interval analysis.
- **Inconsistencies are measured within one analyzer** (original vs. variant).
  Disagreement between two analyzers on the same program is explicitly not
  counted.
- **Three selection strategies** over the same eligible sites and rewrite
  rules: random, syntax-based, and abstract-state-guided.
- **Fair budgets:** equal rewrite budgets and equal time budgets, with the
  cost of the guiding analysis included.
- **Concrete protocol:** at least ten seeds; metrics are distinct
  inconsistencies, valid variants, time to first inconsistency, and runtime;
  statistical comparison with a Mann–Whitney U test.
- **Subjects:** JPAMB integer and branch methods plus new cases submitted as
  JPAMB additions. Rewrites that do not change the bytecode are reported
  separately. Threats to validity are listed.

---

## Plan (1/4)

**Feedback:** (1) Project management should be 6, not 9. (2) Distributing
every contribution evenly means anyone may be examined on anything; assign
each contribution to fewer members.

**Changes:**
- **PMG reduced from 9 to 6.** Table total is now 73 (was 76).
- **Ownership concentrated:** every contribution now has one or two owners;
  only the final paper (PWP) is still shared by all. Per-member totals:
  S1 15, S2 16, S3 16, S4 16, S5 10. All row and column sums checked.
- **Concrete milestones with dates** replace the vague four-step plan:
  M1 proof of concept and a first version of branch narrowing (7 Nov),
  M2 tools and analyzers (14 Nov), M3 benchmark and rewrite checks (22 Nov),
  M4 experiments and paper (29 Nov). Dates follow the group's schedule
  (paper due 29 Nov, presentation 6 Dec).
- **Hypothesis testable in M1:** Innovation says M1 tests whether an analyzer
  that narrows at branches gives different answers on equivalent versions.
  A first version of branch narrowing was therefore moved into M1, so the
  test can actually be run early; full narrowing is completed in M2.
- **Fallback:** if M1 shows no inconsistencies for a rewrite, it is replaced
  before M2.
- **Owner areas** named per member in the text.
- **Timeline updated:** today marker moved to 28 Oct; bars aligned with the
  milestones; new bar for the interval domain and branch narrowing.
- The sentence "We will discuss the custom scope ... with the teacher" was
  removed.

---

## Presentation (1/4)

**Feedback:** (1) Too many paragraph breaks. (2) The template and rubric use
"Innovation" instead of "Contribution".

**Changes:**
- One-sentence paragraphs merged into real paragraphs throughout (the source
  had a blank line after nearly every sentence).
- Section heading renamed to **Innovation**; section order now matches the
  rubric: Context, Gap, Innovation, Evaluation, Plan.
- The word "contribution" is kept only for the contribution table, which is
  the course's own name for the points allocation.

---

## Explanations of key decisions

### Why the Gap paragraph does not mention the course
An earlier draft opened with "The techniques taught in the course do not
detect this problem." This read as criticism of the course, and the claim was
broader than we could support. The final version builds the gap from the two
cited DTU papers instead and gives a technical reason why each one does not
solve the problem. That answers the grader's question ("why do current
techniques not work?") without making claims about the course.

### Why the description of Chand et al. changed
The original proposal said this work studied syntactic variation in
*LLM-based* error detection. Reading the paper showed that it also tested
**Infer**, a conventional static analyzer, under semantics-preserving
variations. Saying the work only covered LLMs would therefore be wrong. The
gap is instead that their variations (e.g. renaming variables and methods)
were a robustness check measured by line numbers, and were not placed using
information about the program.

### Why the input argument holds for Domingues et al.
Their work uses abstract interpretation to choose **inputs** for a fuzzer. A
static analyzer's prediction for a method does not depend on inputs; in JPAMB
an analyzer receives only the method ID (`solutions/static/src/static.py`
runs its analysis with `inputs=None`). So guiding inputs can never reveal
whether an analyzer gives different answers for equivalent code; only
changing the program can.

### Why no outside references were added
The rubric gives 4/4 on Gap only for a gap "illustrated with references to
current papers or industry experiences"; 3/4 needs "a gap compared to
methods from the course material". We chose to keep only the two DTU
references for the proposal, which costs at most one point on Gap. The
outside references are ready in `optional-references.md` for the final
paper's related-work section, but their details were written from memory and
must be checked before use.

### Why the sign analyzer example is in Innovation
The grader asked *why* uncertain sites should be where an analyzer behaves
inconsistently. Running the repository's sign analyzer showed that it does
not narrow values at branches: it warns about division by zero even on a
guarded division (`Simple.checkBeforeDivideByN2`). So for this analyzer the
`f(x)` example gives the **same** answer on both versions, and inverting the
branch reveals nothing. This shows that inconsistencies can only appear where
an analyzer's precision depends on how the code is written, which is the
reason for the definition of a *candidate* site.

### Why the narrowing claim is a hypothesis, not a fact
The sentence about analyzers that *do* narrow at branches is the only place
that explains where inconsistencies are expected to come from, so removing it
would leave the grader's question unanswered. But no such analyzer exists in
the repository yet, and no example of it giving different answers has been
found. The sentence is therefore phrased as "We expect ...", and milestone M1
tests it. If M1 finds no inconsistencies for a rewrite, the plan replaces that
rewrite before M2.

### Why faulty analyzers were dropped
The grader pointed out that deliberately injected faults could be placed
exactly where our guidance looks, which would bias the results. Analyzers that
differ in a known way (sign without narrowing, sign with narrowing,
interval) differ naturally, as the grader suggested. Comparing results is
always done *within* one analyzer, because two analyzers disagreeing on the
same program only shows that one is more precise; it is not a metamorphic
inconsistency.

### Why the contribution table was reallocated
Project management must total 6, so the table lost three points (76 to 73).
Every other row was already at its maximum, so per-member totals had to
drop slightly. Ownership was concentrated to one or two members per
contribution because the grader warned that an even split means any member
may be examined on any part. The allocation is a proposal and must be agreed
by the whole group.

---

## Before reuploading

- [ ] Compile the LaTeX (not done locally, as no LaTeX is installed here) and
      check the layout.
- [ ] Whole group agrees on the contribution table and owner areas.
- [ ] Check the "Suggested maximum grade" row (still 10/10/10/10/7) against
      the course's points-to-grade mapping, since the totals changed.

---
---

# Round 2: improvements made after the second feedback

Scores on the revised proposal: Gap **1/4**, Innovation **1/4**, Evaluation
**2/4**. Only `main.tex` changed in this round; `bibfile.bib` and
`lstlean.tex` are unchanged.

---

## Gap (1/4)

**Feedback:** "However, a static analyzer's prediction for a method does not
depend on inputs; in JPAMB an analyzer receives only the method. How is the
second part of the sentence relevant? What else would you expect it to
receive? Please revise that. Otherwise I think it is a great improvement
compared to the old version, nice job!"

**Changes:**
- Removed the clause "in JPAMB an analyzer receives only the method". It is
  true of every static analyzer, so it added nothing.
- Merged the remaining half with the following "therefore" sentence:
  *"However, a static analyzer's prediction for a method does not depend on
  runtime inputs, so input-level guidance cannot reveal whether the
  analyzer's answer depends on how the code is written."*
- "inputs" became "runtime inputs", so it cannot be read as the method itself.
- Nothing else in the paragraph changed, since the grader called the rest a
  great improvement.

Note: the round-1 explanation "Why the input argument holds for Domingues et
al." above still quotes the removed clause; it is kept as history.

---

## Innovation (1/4)

**Feedback:**
1. "The guided strategy ranks candidate sites first; random selection draws
   uniformly from all syntactically eligible sites." It is unclear whether
   random selection is based on the ranked candidates or is a baseline, and
   why there is a ranking at all.
2. "Running each variant on test inputs is an additional check that the
   rewrite preserved behavior, not a proof of equivalence." If it is not a
   proof, how do we ensure we do not introduce behavioral changes? It reads
   like answering a question rather than describing a plan.
3. (Score) Not enough technical contribution for all members to pass.

**Changes:**
- **Random removed from Innovation.** It is a baseline and is now introduced
  only in Evaluation.
- **"Ranks" replaced by a budget rule.** There is a single budget of $N$
  rewrites for the whole benchmark, not per method. The guided strategy
  spends it on candidate sites across all methods first, choosing among them
  at random, and uses other eligible sites only when no candidates remain.
  The text gives the reason: rewrites at non-candidate sites are expected to
  leave the analyzer's answer unchanged and waste budget.
- **Behavior preservation described as a plan in two layers:**
  - each rewrite has a precondition, checked by the site finder before
    applying it (the condition has no side effects, compares `int` values,
    and no rule changes arithmetic that may overflow);
  - test inputs synthesized from the abstract state (inputs that make each
    rewritten condition true and false, plus the boundary values of each
    variable's interval) catch errors in the rules or their implementation;
    a variant whose outcome differs from the original is discarded.
- **Technical contribution made visible.** The table claims 10 points for
  NTS (analysis-informed test synthesis), but the old text never described
  test synthesis. The input synthesis above now backs that row.
- Unchanged: the research question, the sign-analyzer example, and the
  definitions of *uncertain* and *candidate* sites (the grader did not
  object to them this round).

---

## Evaluation (2/4)

**Feedback:**
1. "These known differences replace deliberately injected faults, so the
   analyzers under test are not tuned to where our guidance looks." Faults
   are not mentioned in this version, so they are not replaced. The document
   is the base of the final paper, not a proposal log book.
2. The fragment about budgets is unclear: what is a "rewrite budget", and how
   is it different from "time budgets"? The sentence is too long and hard to
   follow.
3. Are we planning to test different analysis methods for guiding? If not,
   which one?

**Changes:**
- **Faults sentence removed.** Its point is now stated directly: the three
  analyzers differ only in precision, for reasons unrelated to our selection
  strategies.
- **Budgets explained in their own paragraph, in short sentences:**
  - *rewrite budget*: every strategy produces the same number $N$ of variants
    across the benchmark; this measures how well it chooses sites;
  - *time budget*: every strategy runs for the same wall-clock time $T$ and
    produces as many variants as it can; the guided strategy's analysis time
    counts towards $T$, so this measures whether the guidance is worth its
    cost.
- **Guiding analysis named:** the guided strategy uses the abstract states of
  our interval analysis, because a coarser guide would mark almost every
  site as uncertain. Comparing several guiding analyses was not added (no
  time for another experiment dimension).
- **Threat to validity added:** the guiding analysis is also one of the
  analyzers under test.

**Changes to match the new Innovation text:**
- Random selection is defined here ("draws uniformly from all eligible
  sites"), since it was removed from Innovation.
- The rewrite budget $N$ is the same benchmark-wide budget as in Innovation.
- *Valid variants* are defined: they compile and pass the synthesized tests.
- The syntax-based baseline now prefers sites "close to a division or
  assertion" (it previously said "near … branches", but every eligible site
  is already a branch).

---

## Plan (no new feedback; updated to match the changes above)

The grader gave no new Plan feedback this round. The Plan text, Gantt chart
and contribution table were checked against the new Gap, Innovation and
Evaluation text, and four mismatches were fixed.

**Changes:**
1. **Test synthesis added to a milestone.** Innovation now names test-input
   synthesis, and it backs the 10 NTS points, but the Plan only said
   "checked rewrites". M3 now reads "an extended benchmark, and rewrites
   checked with test inputs synthesized from the abstract state"; $S_3$ owns
   "test synthesis for rewrite checking"; the Gantt bar is renamed
   "M3: Benchmark and test synthesis".
2. **Experiments moved in the Gantt chart** from 15--22 Nov to 18--27 Nov.
   The old bar ended on the same day as the extended benchmark (M3, 22 Nov)
   that the experiments need, and disagreed with the text, which puts
   experiments in M4 (29 Nov).
3. **Fallback for the guide.** The guided strategy now depends on the
   interval domain, and both are due at M2. If the interval domain is not
   ready, development of the guided strategy continues with the sign
   analysis with narrowing as a temporary guide; the final guide stays the
   interval analysis, as Evaluation says. The redundant "rather than keep
   it" was also dropped from the M1 fallback sentence.
4. **Owner for the syntax-based baseline.** Evaluation defines it as
   preferring sites close to a division or assertion, which is syntactic
   analysis, so it is listed under $S_4$ next to "syntactic analysis of the
   benchmark methods" (ISY).

**Unchanged:**
- The contribution table: totals and owners already match.

**Also changed:**
- The Gantt "today" marker moved from 28 Oct to 21 Oct, one day before the
  "Proposal*" line (22 Oct), by the group's choice. In the rendered chart it
  is still labelled "TODAY".

---

## Explanations of key decisions (round 2)

### Why the guided strategy has no ranking score
We counted branch and division instructions in the decompiled bytecode of
the 47 benchmark methods: 19 have no branches, and most others have 1–3.
Each Java `assert` also adds a branch on `$assertionsDisabled`, which cannot
be rewritten in the source, so most methods have only 0–2 real eligible
sites. A score that orders candidates would almost never change which sites
are rewritten, and it would need its own definition and justification.
"Candidates first, random among them" tests the hypothesis directly (do
candidate sites reveal more inconsistencies?).

### Why the budget covers the whole benchmark, not one method
With so few sites per method, a per-method budget of a few rewrites lets
random selection rewrite nearly every site too, so all strategies would look
the same. With one budget across the benchmark, the guided strategy can
spend it on candidates anywhere, while random selection wastes part of it on
sites that cannot change the result. Time to first inconsistency is also
reported because it depends on the order even when every site is rewritten
in the end.

### Why interval analysis is the guide
The research question already speaks of "a lightweight analysis" that
selects sites, i.e. one fixed analysis separate from the analyzer under
test. The interval domain is being built anyway as one of the analyzers
under test (`Interval` in `solutions/static/src/abstractions.py` is
currently a stub), so using it as the guide costs no extra work. Sign
analysis was rejected as the guide because it is too coarse: almost every
condition and divisor looks uncertain to it, so guided selection would
behave almost like random.

### Why the guide/analyzer overlap is a threat, not a method sentence
Interval guidance may suit the interval analyzer best. An earlier draft said
so in the method description ("since this is also one of the analyzers under
test, we report results separately"), but that read as defensive, and
reporting per analyzer is already implied because inconsistencies are always
measured within one analyzer. The concern is therefore listed under threats
to validity.

---

## Before reuploading (round 2)

- [ ] Compile the LaTeX and check the length: Innovation and Evaluation each
      grew by a few lines.
- [ ] Whole group agrees that interval analysis is the fixed guide.
- [ ] Whole group agrees on test-input synthesis as the content of the NTS
      row (owners in the table: $S_2$ and $S_3$).
- [ ] Optional: ask the TA whether the Gap score will move, since the box
      ticked was still 1/4 despite "great improvement".
