# Course 02242 — Program Analysis: Your Personal Guide

This folder is **not** part of the official JPAMB repo — it's your own study
notes, written to get you from "zero idea" to "comfortable" with the course
and Assignment 1. It is not tracked by the upstream course repo and won't
interfere with anything you submit.

Read the files in this order:

1. **[01-theory-introduction.md](01-theory-introduction.md)** — the "why"
   behind the whole course: what program analysis is, why it's fundamentally
   limited (halting problem), and the vocabulary (sound/complete, may/must)
   you'll see in every later topic.
2. **[02-theory-syntactic-analysis.md](02-theory-syntactic-analysis.md)** —
   the specific lecture behind Assignment 1: what "syntactic" means, the
   levels of syntax (text → tokens → CST → AST → IR → bytecode), the Chomsky
   hierarchy, and the concrete tools (regex, Tree-sitter, bytecode scanning)
   used at each level.
3. **[03-assignment-1-syntactic-analysis.md](03-assignment-1-syntactic-analysis.md)**
   — the actual assignment: deadline, rules, scoring, submission steps, and
   where things stand for you right now.
4. **[04-your-analyzer-explained.md](04-your-analyzer-explained.md)** — a
   line-by-line walkthrough of the analyzer you already submitted
   (`solutions/syntactic/src/syntactic_bytecode.py`), tying every check back
   to the theory in file 2.
5. **[05-improve-it-yourself.md](05-improve-it-yourself.md)** — a step-by-step,
   do-it-yourself guide to raising your score further, from easiest to
   hardest, with exact code patterns you can adapt (not copy-paste-ready
   solutions — you write the final line).
6. **[06-theory-semantics.md](06-theory-semantics.md)** — the "how do we
   define what a program *means*" lecture: axiomatic/denotational/
   operational semantics, small-step vs. big-step, and the JVM small-step
   rules you need to finish `solutions/dynamic/src/dynamic.py`'s `step()`.
7. **[07-theory-dynamic-analysis.md](07-theory-dynamic-analysis.md)** — the
   lecture behind Assignment 2: trace selection/analysis/abstraction,
   testing strategies, and the fuzzing spectrum (random → dictionary →
   coverage-guided → property-based → small-scope), mapped onto the fuzzer
   already stubbed out in `dynamic.py`'s `analyse()`.
8. **[08-assignment-2-plan.md](08-assignment-2-plan.md)** — the actual
   implementation plan for Assignment 2, restricted deliberately to what
   the lectures themselves hand you or explicitly assign (Push/Load/Return/
   Ifz/Dup from file 6, the 5 named fuzzing techniques from file 7) rather
   than JVM opcodes or techniques pulled from outside knowledge, plus the
   submission checklist for both Autolab components.
9. **[09-theory-bounded-static-analysis.md](09-theory-bounded-static-analysis.md)**
   — the lecture behind Assignment 4: many-step function, posets,
   lattices, Galois connections, the Sign abstraction, and the chain of
   abstractions (trace → state → per-PC → per-variable → Sign) that
   `solutions/static/src/static.py` implements.
10. **[10-theory-unbounded-static-analysis.md](10-theory-unbounded-static-analysis.md)**
   — dependent values, fixed points, intervals, widening, and the
   worklist algorithm — the ideas that push the static score higher.
11. **[11-assignment-4-static-plan.md](11-assignment-4-static-plan.md)**
   — what to actually do for Assignment 4 (due **October 11, 2026**):
   current measured baseline, the scaffold's concrete bugs, an ordered
   fix list, and the submission checklist for both Autolab components.

## The short version, if you only read one paragraph

JPAMB gives you small Java methods and asks you to predict which of 6
outcomes (`ok`, `divide by zero`, `assertion error`, `out of bounds`,
`null pointer`, `*` = infinite loop) each one can produce. You write a
program that looks at a method (its source, its AST, or its bytecode — your
choice) and prints a guess for each outcome. `jpamb` scores your guesses
against the real, known answers. Assignment 1 asks for a **syntactic**
analyzer (pattern-matching on structure, not on program behavior) that
scores **at least 100 points**. You've already built one and submitted a
report scoring **118.24** — files 1-5 explain what you built, why it works,
and how to push it further. Assignment 2 (due **September 27, 2026**) is
**dynamic** analysis — actually running the program via a small JVM
bytecode interpreter you write (`solutions/dynamic/src/dynamic.py`) and
fuzzing it for crashes — covered by files 6-8, with file 8 being the
concrete plan to actually execute.
Assignment 4 (due **October 11, 2026**) is **static** analysis — an
abstract interpreter over the Sign lattice in `solutions/static/` that
must score ≥ 100 and handle ≥ 50% of cases with `--abstract` — covered by
files 9-11, with file 11 being the plan.
