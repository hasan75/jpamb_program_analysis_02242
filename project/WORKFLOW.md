# Working with Claude on the project and paper

How to use Claude Code, and its subagents, to build *Analysis-Guided Metamorphic
Testing of Java Static Analyzers* and write the paper (deadline 29 Nov 2026,
10–11 pages). Decisions live in [`DECISIONS.md`](DECISIONS.md); this file is
about *how* to work.

---

## 1. The session loop

Every piece of work follows the same loop:

1. **Start:** a new session (or `/clear`), then paste the start prompt (§4).
2. **Plan:** Claude starts in plan mode (Shift+Tab). Read the plan; correct it
   before approving.
3. **Build:** Claude implements.
4. **Verify:** `uv run pytest`, `uv run ruff check .`, and a real
   `uv run jpamb analyse ...` or `interpret` run. Claude shows the output.
5. **Review:** run the matching subagent from §2, if there is one, and fix
   what it finds.
6. **Record:** "update `DECISIONS.md` and `STATUS.md`", then commit.
7. **`/clear`** before the next step.

One build step (§3) is one session. Small sessions are faster and more
accurate than one long one.

---

## 2. Which agent, when

| Agent | Use it when | Don't use it for |
|---|---|---|
| *main session* (no agent) | Writing code, writing paper prose, running builds and experiments, anything that edits files | — |
| `rewrite-auditor` | Right after a rewrite rule or its precondition is written or changed (step 4); again before experiments if any rule changed | Reviewing the analyzers or the paper |
| `literature-scout` | Before writing Gap and Related Work; whenever a sentence needs a citation | Adding papers without verifying them; writing prose |
| `paper-reviewer` | After each paper section is drafted or revised; once on the whole paper before submitting | Checking numbers (use `results-checker`) |
| `results-checker` | After the full experiment run and the results section are written; after any rerun; last thing before submitting | Running experiments |
| `Explore` (built in) | "Where in the repo is X handled?" questions that would mean reading many files | Anything that needs a decision |
| `Plan` (built in) | Rarely; plan mode in the main session is usually enough | — |

All four project agents only *report*; the main session applies their findings.
They read `DECISIONS.md` first, so keep it up to date.

How to call one: name it in the prompt, e.g. *"Run the `paper-reviewer` agent
on `paper/sections/evaluation.tex`, then fix its findings one by one."*

Don't run several agents that **edit** the same files in parallel. The review
agents can run in parallel with each other (e.g. `paper-reviewer` on two
sections at once).

---

## 3. Build steps and agents (from DECISIONS.md D9)

| Step | Work (main session) | Agent afterwards | Done when |
|---|---|---|---|
| 0 | Commit current work; baseline `jpamb analyse` reports; check Docker build | — | clean `git status`, baseline saved |
| 1 | Sign narrowing; three entry points (D7) | — | three analyzers scored, narrowing fixes `Simple.checkBeforeDivideByN2` |
| 2 | Interval domain, worklist, widening (D8) | — | lattice-law tests pass; loops terminate |
| 3 | Export per-PC abstract states and uncertain sites | — | JSON for every method, mapped to source lines |
| 4 | Site finder; rewrite rules 1–2 (D6) | `rewrite-auditor` per rule | no open counterexamples |
| 5 | Random, syntax-based, guided selection | — | same seed gives the same output |
| 6 | Validation: compile + synthesized inputs | `rewrite-auditor` (does validation catch a deliberately wrong rule?) | invalid variants are discarded |
| 7 | New benchmark cases (D12) | — | `jpamb build` passes |
| 8 | `experiments/run.py`, `stats.py`; dry run, then full run | `results-checker` (after the paper's results section exists) | CSV + generated tables/figures |
| P1 | Paper skeleton in `paper/` (start after step 4) | — | compiles in Overleaf |
| P2 | Gap + Related Work | `literature-scout` **before**, `paper-reviewer` after | 6–10 verified citations |
| P3 | Approach, Implementation, worked example, pipeline figure | `paper-reviewer` | — |
| P4 | Evaluation, Threats, Conclusion | `results-checker`, then `paper-reviewer` | all numbers traced |
| P5 | Final pass on the whole paper | `paper-reviewer` + `results-checker` | ≤ 11 pages, no `\todo{}` |

Suggested calendar: 23–24 Nov steps 0–2 · 25 Nov steps 3–4 + P1 ·
26 Nov steps 5–7 + P2 · 27 Nov step 8 + P3 · 28 Nov P4 · 29 Nov P5.
If you fall behind, cut in the order given in D6 and D11 (loop rule first,
then the time-budget experiment).

---

## 4. Prompts

**Session start**
> Read `CLAUDE.md`, `project/DECISIONS.md`, `project/STATUS.md` and
> `project/WORKFLOW.md`. Work only on this branch. Today's task: step [N] —
> [task]. Start in plan mode.

**Step prompts**
1. > Implement branch narrowing in `solutions/static/` and expose the three
   > analyzers from D7 as separate entry points. Show `jpamb analyse` scores for all three.
2. > Implement `Interval` fully per D8, with a worklist fixpoint and widening at
   > backward jumps. Add hypothesis lattice-law tests. Show scores before and after.
3. > Export per-PC abstract states and mark uncertain sites as JSON, mapped to
   > source lines. First check whether the decompiled JSON has line numbers, and tell me.
4. > Build `solutions/metamorphic/` with a tree-sitter site finder and rules 1–2
   > from D6. Each rule needs a precondition function and an equivalence argument.
   > Then run the `rewrite-auditor` agent on each rule.
5. > Implement random, syntax-based and guided selection with a benchmark-wide
   > budget N and a seed (D11).
6. > Validate variants: compile them, synthesize test inputs from intervals, and
   > drop any variant whose outcome differs.
7. > Add new benchmark cases per D12 and run `jpamb build`.
8. > Write `experiments/run.py` and `experiments/stats.py` per D10–D11. Do a tiny
   > dry run and show me before the full run.

**Paper prompts**
> Create `paper/main.tex` from the proposal's acmart setup with one file per
> section in `paper/sections/`: Introduction, Approach, Implementation,
> Evaluation, Related Work, Threats to Validity, Conclusion. Target 10–11 pages.
> Put `\todo{}` wherever a number or citation is missing; never invent them.

> Run the `literature-scout` agent for Related Work. Add only verified entries to
> `paper/bibfile.bib`.

> Draft section [X] from the code, `DECISIONS.md` and the results. Then run the
> `paper-reviewer` agent on it and fix what it finds.

> Before submitting: run the `results-checker` and `paper-reviewer` agents on the
> whole paper and fix what they find. (Then compile in Overleaf and check it is
> ≤ 11 pages; paste any LaTeX errors back to Claude.)

**Overleaf round trip:** upload the `paper/` folder to Overleaf (or sync it via
Overleaf's Git/GitHub integration). When you edit in Overleaf, copy the changed
`.tex` files back into `paper/` before asking Claude to work on them, so Claude
never overwrites your edits.

**Useful at any time**
> Update `DECISIONS.md` and `STATUS.md` with what we decided and did in this session.

> I'm behind schedule. Using `DECISIONS.md`, propose what to cut so the paper
> still answers the research question.

---

## 5. Rules for Claude on this project

- Work only on `project/metamorphic-isolated`; don't read other branches.
- Every number in the paper comes from `experiments/`. Never type results by hand.
- Every citation is verified by `literature-scout` (or by the user).
- Write the paper as if earlier versions never existed: no logbook style.
- New cases go in `cases/jpamb/cases/` (the path in `docs/extending-jpamb.md` is outdated).
- Use `report.sexp` as the filename for `jpamb --report`.
- Commit only when the user asks.
