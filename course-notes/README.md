# Program Analysis: A Study Guide

This guide teaches the subject of **program analysis**, starting from zero.
It follows DTU course 02242 (the JPAMB benchmark, the assignments, the
project), but the chapters are written so that you understand the ideas
themselves and could explain them in an exam, in an interview, or when
reading a research paper.

## How the guide is organized

### Part A: Orientation
| # | Chapter | What you get |
|---|---|---|
| 01 | [Prerequisites](01-prerequisites.md) | The background the course assumes: sets & relations, logic, computability, Java & the JVM, the Python features used in the code. Fill gaps here first. |
| 02 | [Course map](02-course-map.md) | The big picture: how every topic connects. |

### Part B: The core topics (read in order)
| # | Chapter | Core question |
|---|---|---|
| 03 | [Introduction: what analysis can and can't do](03-intro-limits-of-analysis.md) | Why is perfect analysis impossible, and what do we do about it? |
| 04 | [Syntactic analysis](04-syntactic-analysis.md) | How far can we get by looking only at the code's *form*? |
| 05 | [Semantics and the JVM](05-semantics-and-the-jvm.md) | What does a program *mean*, precisely? |
| 06 | [Dynamic analysis](06-dynamic-analysis.md) | What can we learn by *running* the program? |
| 07 | [Abstract interpretation (static analysis)](07-abstract-interpretation.md) | How can we reason about *all* runs at once? |

### Part C: Beyond the course
| # | Chapter | What you get |
|---|---|---|
| 08 | [The wider field](08-beyond-the-course.md) | Data-flow analysis, symbolic execution, SMT, model checking, type systems, pointer & taint analysis, real tools (Infer, CodeQL, SpotBugs...), books and courses to continue with. |

### Part D: Reference and practice
| # | Chapter | Use it to |
|---|---|---|
| 09 | [Glossary & cheat sheet](09-glossary-cheatsheet.md) | Look up a term or a formula. Keep it open. |
| 10 | [Practice questions](10-practice-questions.md) | Test yourself: the course quizzes plus exam-style questions per topic, with answers. |
| 11 | [Repo & commands](11-repo-and-commands.md) | Find a file or run something in this repo. |
| 12 | [The project & your role](12-project-and-your-role.md) | What the group project is and what you are building. |

## How to study with this guide

Each chapter in Part B has the same shape:
1. **The question**: what problem this technique solves.
2. **The ideas**: explained with small examples.
3. **Worked example**: done by hand, step by step.
4. **In the code**: where it appears in this repo.
5. **Strengths & limits**: when to use it and when not.
6. **Check yourself**: a few questions (answers in chapter 10).

A good way to learn the material:
- **Read actively.** Do every worked example on paper *before* reading the solution.
- **Connect to code.** After each chapter, open the matching file in `solutions/` and find the idea in it.
- **Explain it out loud.** If you can explain "why do we need widening?" in 2 minutes without notes, you understand it.
- **Come back to the glossary.** Most confusion in this course is vocabulary (narrowing means two different things, may/must, sound/complete).

## Suggested schedule

| Session | Read | Do |
|---|---|---|
| 1 | 01, 02, 03 | Explain to yourself why the halting problem kills perfect analysis. |
| 2 | 04 | Run `uv run jpamb inspect` on 3 methods; write one regex rule. |
| 3 | 05 | Execute a bytecode method by hand on paper (stack + locals). |
| 4 | 06 | Read `solutions/dynamic/src/dynamic.py` `step()`; fuzz one method mentally. |
| 5-6 | 07 | Sign and interval analysis by hand on the worked examples. Read `solutions/static/`. |
| 7 | 08 | Skim; pick one topic that interests you and read its first linked resource. |
| 8 | 10 | All practice questions, closed book. |

## Other material in this repo
- `../assignment-guide/`: longer notes made per lecture/assignment, tied tightly to the assignments.
- `../docs/`: official JPAMB documentation (`rules.md` explains scoring).
- `../proposal/`: the group project proposal and explanations.
- `../../lectures/`: your own lecture note and quiz screenshots.
