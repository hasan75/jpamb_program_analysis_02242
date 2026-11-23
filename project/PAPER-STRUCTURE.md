# Paper structure

The section plan for `paper/`, designed from what **this** paper has to explain.
Course papers have no fixed section list: the PPPA proceedings in
`proposal/references/` each use a different one. They show what a course
paper usually contains (a worked example, theory, an evaluation with threats,
related work); they are not a template.

The project and its evaluation are those of `proposal/main.tex`. This file
fixes only **how the paper is organised**.

---

## 1. What the paper has to get across, and what that means for its sections

| The reader must understand… | So the paper needs… |
|---|---|
| The problem: an analyzer can give different answers for equivalent code, and where to rewrite is the open question (the Gap) | An Introduction keeping the proposal's labelled paragraphs. The professor graded Context, Gap, Innovation and Evaluation by name, so they stay. |
| What a JPAMB analyzer predicts (outcome sets) and how our three analyzers differ in precision | A short **Background** section. The analyzers are the *subjects* of the study, not its contribution, so they are kept apart from the technique. |
| The idea before the formal detail | An **Overview** built on one worked example, with the pipeline figure. It also covers the grading rows for a worked example (PEX) and a process diagram (PDI). |
| Exact definitions (site, uncertain, candidate, inconsistency, valid variant, budgets) and why the rewrites are safe | A **technique section** that defines each term once, in the order the pipeline uses them. |
| That the comparison is fair (same sites, rules and budget for every strategy) | A selection subsection that defines **all three strategies** together, so the baselines are not an afterthought in Evaluation. |
| Whether guidance helps, at what cost, and whether the variants can be trusted | An **Evaluation** with one RQ per measurement promised in the proposal, plus a qualitative look at *which* weaknesses were found. |
| The limits | A separate **Threats to Validity** section. The proposal names four threats, and some cut across all RQs (for example, the guide is also an analyzer under test). |

Two points where our paper differs from many course papers, and why:
- **The analyzers get their own background subsection** instead of filling
  "Approach and Theory". Our contribution is the site selection. The abstract
  domains matter only because they (a) differ in precision and (b) supply
  the abstract states that guide selection.
- **The source-to-bytecode mapping goes in Implementation.** We analyze
  bytecode but rewrite Java source, so the abstract state at a bytecode PC
  has to be linked to a source-level site. This is a real design problem in
  our pipeline, not a detail to leave out.

---

## 2. Sections

Page budget: 10–11 pages **including references and any appendix** (D3).
The estimates add up to about 10.6 pages, references included, which leaves
about 0.4 pages of slack.

### Abstract (`abstract.tex`, ~0.25 p)
Problem → key observation (rewrites change results only where precision
depends on code form) → technique → setup (3 analyzers, 3 strategies,
10 seeds) → main result, with numbers from `experiments/`.

### 1 Introduction (`introduction.tex`, ~1.4 p)
- **Context:** the `f(x)` pair from the proposal (listing).
- **Gap:** why existing work doesn't answer the question: differential and
  random-program testing, renaming-based robustness (`chand2024`), and
  input-level guidance (`domingues2025`).
- **Innovation:** the research question and the key observation. The terms
  are only introduced here; Section 4 defines them.
- **Evaluation:** a summary of the setup and the headline result.
- **Contributions:** a numbered list naming the sections:
  (1) a definition of uncertain/candidate sites from abstract states,
  (2) semantics-preserving rewrite rules with preconditions and test-based
  validation, (3) an empirical comparison of guided vs. random vs.
  syntax-based selection on three analyzers, (4) new JPAMB cases.

### 2 Background (`background.tex`, ~1.0 p)
- **2.1 JPAMB and outcome predictions:** what an analyzer receives and
  predicts (the outcome vocabulary, including `*`). It is the basis for the
  definition of inconsistency.
- **2.2 Metamorphic testing:** a metamorphic relation in one paragraph. Ours
  is "equivalent methods ⇒ equal outcome sets".
- **2.3 The three analyzers under test:** the sign and interval lattices, a
  Galois connection in one line, narrowing at branches, widening at backward
  jumps with a short termination argument, and the interval "no holes"
  limitation (D8). A small table: analyzer × domain × narrowing × widening.

### 3 Overview (`overview.tex`, ~1.0 p)
One worked example, end to end, taken from real pipeline output:
the method → the interval state at the site → why the site is a
candidate → the rewrite → the outcome sets of the three analyzers on
original and variant → the inconsistency.
- **Figure 1 (PDI):** the pipeline: analyzer → per-PC states → site finder
  → selection (budget N) → rewrite → validation → re-analysis → compare.

### 4 Analysis-Guided Rewriting (`approach.tex`, ~2.2 p)
In pipeline order, defining each term once:
- **4.1 Consistency and inconsistencies:** the metamorphic relation and the
  counting unit (D10).
- **4.2 Sites, uncertain sites and candidates:** conditions (i) and (ii) from
  the proposal, computed from the guide's abstract state.
- **4.3 Rewrite rules:** branch inversion with swap, and equivalent integer
  comparison (D6). For each: the rule, its precondition, and an equivalence
  argument (overflow excluded). **Table:** rule × precondition × the
  precision feature it changes.
- **4.4 Selection under a shared budget:** guided, random and syntax-based,
  all over the same eligible sites and rules, with one benchmark-wide N and
  a seed. Explains why the budget is per benchmark and not per method (few
  sites per method).
- **4.5 Validating variants:** compile, then run tests synthesized from
  intervals (true/false inputs, interval boundaries) and discard any variant
  whose outcome differs. Bytecode-identical variants are flagged.

### 5 Implementation (`implementation.tex`, ~0.5 p)
Three entry points over one code base (D7); per-PC state export (a short JSON
listing); mapping bytecode PCs to source sites; the tree-sitter site finder
and rewriter; the experiment runner. Where the code is in the repo.

### 6 Evaluation (`evaluation.tex`, ~2.4 p)
- **6.1 Research questions.** Each one comes from a measurement the proposal
  promises; none adds new work:
  - **RQ1 (Effectiveness):** at a fixed rewrite budget N, does guided
    selection find more distinct inconsistencies than random and
    syntax-based selection, for each analyzer?
  - **RQ2 (Cost):** at a fixed time budget T, with the time for computing
    abstract states included, is guidance still worth it? (Time to first
    inconsistency, total runtime. Can be cut, per D2/D11.)
  - **RQ3 (Validity):** what share of variants is valid, how many does
    testing discard, and how many leave the bytecode unchanged?
- **6.2 Subjects and setup:** the JPAMB integer/branch methods plus the new
  cases (D12), eligible-site counts, N (50% and 25%), the 10 seeds, the
  statistics (Mann–Whitney U, A12) and the hardware.
- **6.3–6.5 Results for RQ1–RQ3:** one subsection each, with a generated
  table or figure and the test result.
- **6.6 What the inconsistencies reveal:** the distinct inconsistencies
  grouped by cause (e.g. missing narrowing, interval "no holes", merge
  points), each with one short example. This explains *why* guidance works,
  beyond the counts.

### 7 Threats to Validity (`threats.tex`, ~0.4 p)
Internal: rewrite correctness (preconditions plus testing, not a proof), and
the guide being one of the analyzers under test. Construct: what counts as
one inconsistency (D10). External: limited language coverage (int, branches)
and how representative micro-benchmarks are.

### 8 Related Work (`related.tex`, ~0.75 p)
By theme, each ending with how it differs from our work:
testing static analyzers (differential, random programs), metamorphic and
equivalence-based testing, robustness of analyzers to semantics-preserving
changes (`chand2024`), and analysis-guided testing (`domingues2025`).
Only citations verified by `literature-scout`.

### 9 Conclusion (`conclusion.tex`, ~0.25 p)
The answer to the RQ, the main limitation, and future work (the loop rule
D6.3, a reduced product D8, larger programs).

References: ~0.6 p. No appendix: it would count towards the 11 pages, so
anything that matters goes in the main text.

### Figures and tables (planned)
| Item | Where | Grading row |
|---|---|---|
| Listing: `f(x)` pair | §1 | — |
| Table: the three analyzers | §2.3 | — |
| Fig. 1: pipeline | §3 | PDI |
| Listing: worked example (original/variant + outcome sets) | §3 | PEX |
| Table: rewrite rules and preconditions | §4.3 | — |
| Table: subjects and eligible sites | §6.2 | — |
| Table/figure: distinct inconsistencies per strategy × analyzer, with p and A12 | §6.3 | EST |
| Table: variant validity | §6.5 | — |

All tables and figures with numbers are generated by `experiments/`.

---

## 3. Bibliography entries for `paper/bibfile.bib`

Checked against the proceedings PDFs in `proposal/references/` (title page,
contents and first page of each paper). Compared with `proposal/bibfile.bib`,
these add the editor, volume, pages and accented author names. The proposal's
file stays unchanged.

```bibtex
@inproceedings{chand2024,
  author    = {Dipendra Bahadur Chand and Sathwik Kannam and Siyuan Deng and Marton Kohegyi and {\'A}d{\'a}m P{\'e}ter Balogh},
  title     = {Comparing Traditional and {LLM}-Based Static Analysis Results using Directed Dynamic Analysis},
  booktitle = {Proceedings on Practical Program Analysis (PPPA'24)},
  editor    = {Christian Gram Kalhauge},
  volume    = {1},
  pages     = {3--12},
  publisher = {DTU Compute},
  year      = {2024}
}

@inproceedings{domingues2025,
  author    = {Afonso Domingues and Francisco Torgo and Gaurav Pandey and Hanna Margr{\'e}t P{\'e}tursd{\'o}ttir and Marc Rejndrup and Zakaria Benslimane},
  title     = {Leveraging Static Analysis for Better Fuzzer Performance},
  booktitle = {Proceedings on Practical Program Analysis (PPPA'25)},
  editor    = {Christian Gram Kalhauge},
  volume    = {2},
  pages     = {25--38},
  publisher = {DTU Compute},
  year      = {2025}
}
```

**Leads for `literature-scout`, not yet verified.** Check each one before
citing it:
- Klinger et al. 2019, Cuoq et al. 2012, Chen et al. 2018 (already in
  `proposal/optional-references.md`).
- Equivalence Modulo Inputs (EMI) compiler testing, which also chooses
  *where* to mutate using execution information. It is probably the closest
  related idea, so it is worth finding.
- Møller and Schwartzbach, *Static Program Analysis* (lecture notes), for
  lattices, widening and narrowing.
- Mohajer et al. 2023 (cited by Chand et al.).
