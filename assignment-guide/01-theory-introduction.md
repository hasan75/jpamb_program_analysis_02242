# 01 — Theory: Introduction to Program Analysis

Source: [`topics/introduction.html`](https://courses.compute.dtu.dk/02242/topics/introduction.html)

## What is a program, and what is "program analysis"?

A **program** is treated abstractly: an object from some language, plus a
**step function** that moves from one machine state to the next. Running the
program means repeatedly applying the step function; the sequence of states
you pass through is a **trace**.

**Program analysis** is the discipline of extracting facts about a program's
*structure* or *behavior*, automatically. "Will this terminate?" "Is this
syntax valid?" "Does this method have a bug?" — these are all program
analysis questions, and they range from fully manual (a human reading code)
to fully automatic, and from dynamic (run it and see) to static (reason
about it without running it).

## The uncomfortable truth: it's mostly undecidable

Most languages you actually use (Java, C, Python, and yes, JPAMB's Java
subset) are **Turing-complete**. That power comes at a cost:

- **The Halting Problem**: no algorithm can decide, for an arbitrary program
  and input, whether it will ever stop running. The classic proof is
  self-referential — if a `does_halt(p)` function existed, you could feed it
  a program that does the opposite of what `does_halt` predicts about
  itself, producing a contradiction.
- **Rice's Theorem** generalizes this: almost *any* non-trivial semantic
  property of a program (not just "does it halt") is undecidable, by
  reducing the halting problem to it.

This is why "predict what a Java method does" (exactly what JPAMB asks you
to do) can never be solved perfectly by any tool — including yours. That's
expected and fine; the course isn't asking for perfection, just for good
predictions.

## Sound vs. Complete — the vocabulary you'll see everywhere

- **Sound**: everything your analysis *proves* is actually *true*. A sound
  analysis never has false positives (it never claims a behavior can happen
  when it can't).
- **Complete**: everything that's actually *true* is *provable* by your
  analysis. A complete analysis never has false negatives (it never misses a
  behavior that really can happen).

Standard classifier terms map onto this:

| | Predicted "can happen" | Predicted "can't happen" |
|---|---|---|
| **Actually can happen** | True Positive | False Negative |
| **Actually can't happen** | False Positive | True Negative |

- Soundness ⇔ no false positives.
- Completeness ⇔ no false negatives.

You (almost) never get both for a Turing-complete language — this is a
direct consequence of undecidability above.

## May vs. Must analyses

- **May analysis**: over-approximates. It reports a superset of the real
  traces — "this *might* happen" — so it's usually easy to make sound (if
  you report everything, you can't miss the real behavior) but hard to make
  precise.
- **Must analysis**: under-approximates. Everything it reports is
  guaranteed real, but it may miss real behaviors — good for "must" claims
  like "this bug is *definitely* reachable."

## A relaxed, practical goal (this is what JPAMB actually rewards)

Real-world tools are almost always **unsound** in practice (linters,
compilers' warnings, etc. all have false positives or negatives somewhere).
The course leans on the idea of **"soundiness"** (see *"In Defense of
Soundiness: A Manifesto"*): instead of demanding a strict proof, treat your
analysis as a **classifier** that reports a *confidence* per outcome.

This is exactly why JPAMB's scoring format (see
[`docs/rules.md`](../docs/rules.md) in the repo root) lets you answer with:

- a **wager** (bet points, e.g. `5` or `-10`),
- a **percentage** (e.g. `75%` confidence), or
- a **category** (e.g. `yes`/`no`, or any label you invent) — the tool then
  *calibrates* the optimal wager for you, from how often that category
  turned out to be correct across the whole benchmark suite.

Categories are the easiest to reason about as a beginner, and it's what
your analyzer currently uses (see file 4 in this guide).

## Reflection questions from the lecture

1. What complicates program analysis? *(Undecidability — you can never be
   both sound and complete for a real language.)*
2. When would a "may" vs. a "must" analysis be more valuable? *(May: safety
   checks where missing a bug is costly. Must: proving a specific bug is
   real, e.g. for a bug bounty.)*
3. What does "sound" mean, exactly, and is it always about "no bugs" or
   sometimes about "no false claims of well-formedness"? *(Context matters:
   a type checker's soundness is about the *program* being well-formed; a
   dynamic bug-finder's soundness is about the *trace* actually containing
   the bug it claims.)*

Next: [02 — Theory: Syntactic Analysis](02-theory-syntactic-analysis.md)
