# 08: The Wider Field

The course covers the core ideas. This chapter shows the rest of the field:
what the other techniques are, how they relate to what you learned, and
where to go next. Each section: idea → relation to the course → tools → where to learn.

---

## 1. Classic data-flow analysis
**Idea:** compute facts at each program point by propagating along the
control-flow graph (CFG) until a fixed point. It's abstract interpretation
with specific (usually finite) set-based domains, as used in compilers.

| Analysis | Question | Direction | May/Must |
|---|---|---|---|
| Reaching definitions | which assignments may reach here? | forward | may (∪) |
| Live variables | is x used later? (dead-code elimination) | backward | may (∪) |
| Available expressions | was `a+b` already computed on all paths? | forward | must (∩) |
| Very busy expressions | will `a+b` be computed on all paths? | backward | must (∩) |

**Link to course:** the same worklist/fixed-point algorithm as chapter 07.
**Learn:** *Static Program Analysis* by Møller & Schwartzbach (free online,
Aarhus, very readable). Strongly recommended as a companion to this course.

## 2. Inter-procedural analysis
Analyzing calls. Options: **inline** callees, compute **summaries** per method
(Infer does this), or be **context-sensitive** (analyze per call site / call
string). JPAMB's `Calls.java` cases need this. The current static solution
just assumes "any call might throw".

## 3. Pointer / alias analysis
"Can `p` and `q` point to the same object?" It's needed for nearly every
analysis of real Java/C. Classic algorithms: **Andersen** (inclusion-based,
precise) and **Steensgaard** (unification-based, near-linear).
**Tools:** Soot/SootUp, WALA, Doop (Datalog-based).

## 4. Symbolic execution and SMT solvers
**Idea:** run the program with symbolic inputs, and keep a **path condition**
per path. Ask an **SMT solver** (Z3, cvc5) "is this path feasible? give me an input".
- Precise per path, but **path explosion** (2ⁿ paths for n branches, infinite with loops).
- **Concolic** = concrete + symbolic, used in industry (Microsoft SAGE).

**Link to course:** sits between dynamic (one path at a time) and static
(symbolic values). Would solve JPAMB's `x == 10054203` cases instantly.
**Tools:** KLEE (C), Java PathFinder / SPF (Java), angr (binaries), Z3 Python API (`pip install z3-solver`, worth trying!).

## 5. Deductive verification (Hoare logic in practice)
Write pre/postconditions and loop invariants; a tool proves them using SMT.
**Tools:** Dafny, KeY (Java/JML), Why3, Frama-C WP, Viper.
**Link:** axiomatic semantics from chapter 05. Sound and complete relative to
annotations, but you must write the invariants.

## 6. Model checking
Exhaustively explore all states of a (finite or abstracted) system, checking
temporal-logic properties (LTL/CTL: "every request is eventually answered").
**Tools:** SPIN, NuSMV, CBMC (bounded model checking for C), TLA+.
**Link:** like the dynamic interpreter, but over *all* states, with
abstraction (CEGAR) to keep it finite.

## 7. Type systems as static analysis
Type checking *is* a sound static analysis: "well-typed programs don't go wrong" (Milner).
Extensions: nullability types (Kotlin, Checker Framework's `@NonNull`),
ownership (Rust's borrow checker), refinement types (Liquid Haskell: `{v:Int | v > 0}`).

## 8. Termination analysis
Proving loops end with **ranking functions**: a value that decreases on every
iteration and is bounded below. Tools: AProVE, T2. This is the sound way to
predict JPAMB's `*`.

## 9. Security analyses
- **Taint analysis:** does untrusted input (source) reach a dangerous call (sink) without sanitizing? Finds SQL injection and XSS.
- **Information flow / non-interference:** secret data never influences public output.
**Tools:** CodeQL, Semgrep, FlowDroid (Android), SonarQube.

## 10. Testing the analyzers themselves
How do you know an analyzer is right? Differential testing (compare
analyzers), random program generation (Csmith), and **metamorphic testing**
(equivalent programs ⇒ same answer), which is your project topic.

## 11. ML and LLMs for program analysis
Learned bug detectors, LLMs that explain warnings, suggest invariants, or
triage false positives. Main problem: no soundness guarantee. A hot research
area; some earlier DTU student papers in this course compare LLMs with Infer.

---

## Industrial tools worth knowing by name

| Tool | Technique | Language | Notes |
|---|---|---|---|
| **Infer** (Meta) | abstract interpretation, separation logic, summaries | Java, C, ObjC | open source; null/resource bugs |
| **SpotBugs** | bytecode patterns (syntactic + light data-flow) | Java | successor of FindBugs |
| **Error Prone** (Google) | AST checks in the compiler | Java | |
| **CodeQL** (GitHub) | queries over a code database (Datalog-like) | many | security |
| **Semgrep** | syntactic patterns | many | fast lint/security |
| **Astrée** | abstract interpretation | C | proves no runtime errors in Airbus flight software |
| **Coverity** | mixed | C/C++/Java | commercial |
| **AFL++, libFuzzer** | coverage-guided fuzzing | C/C++ | |
| **Jazzer** | coverage-guided fuzzing | Java | |
| **Z3** | SMT solver | API in many languages | core of most symbolic tools |

## Where to keep learning

**Books / notes**
- Møller & Schwartzbach, *Static Program Analysis* (free PDF, cs.au.dk/~amoeller/spa). **Best next step.**
- Nielson, Nielson & Hankin, *Principles of Program Analysis* (the classic, mathematical).
- Rival & Yi, *Introduction to Static Analysis: An Abstract Interpretation Perspective* (MIT Press).
- Nielson & Nielson, *Semantics with Applications* (free PDF): operational/denotational/axiomatic semantics.
- Zeller et al., *The Fuzzing Book* (fuzzingbook.org, free, Python, interactive). Great for chapter 06.
- Pierce, *Types and Programming Languages*: type systems.

**Courses**
- Aarhus "Static Program Analysis" (lecture videos by Møller).
- CMU 17-355 "Program Analysis" (Aldrich): slides and notes online.

**Hands-on**
- Try Z3 in Python on a JPAMB method: encode `1/(n-10054203)` and ask for `n`.
- Run Infer or SpotBugs on a small Java project and classify its warnings as true or false positives.

> Book and tool names above come from general knowledge, not from the course
> material. Check exact editions and URLs before citing them in your paper.
