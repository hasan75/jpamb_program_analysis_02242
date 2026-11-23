# 01: Course Map

How the topics build on each other, and where each one lives in the repo.

```
  Intro: what can we know about programs?  (undecidability, sound/complete)
     │
     ▼
  Syntactic analysis ──────────────── Assignment 1 ── solutions/syntactic/
  "look at the text/structure"
     │  limitation: can't know values
     ▼
  Semantics ──────────────────────── (foundation for both below)
  "what does each instruction DO to the state?"
     │
     ├──────────────────────────┐
     ▼                          ▼
  Dynamic analysis            Static analysis (abstract interpretation)
  run with REAL values        run with ABSTRACT values (signs, intervals)
  Assignment 2                Assignment 4
  solutions/dynamic/          solutions/static/
  finds bugs that exist       covers ALL inputs, may give false alarms
  (under-approximation)       (over-approximation)
     │                          │
     └────────────┬─────────────┘
                  ▼
           Group project + paper  ── proposal/
           (uses static analysis to guide program rewriting)
```

## Each topic in 3 lines

### 1. Introduction
- **Study chapter:** [03-intro-limits-of-analysis.md](03-intro-limits-of-analysis.md)
- **Key idea:** any interesting question about program behavior is undecidable (Rice's theorem), so analyses approximate.
- **Know:** sound vs. complete, may vs. must, false positive vs. false negative.
- **Notes:** `assignment-guide/01-theory-introduction.md`

### 2. Syntactic analysis
- **Study chapter:** [04-syntactic-analysis.md](04-syntactic-analysis.md)
- **Key idea:** pattern-match on code form. Levels: text → tokens → parse tree → AST → bytecode. Tools: regex (regular languages), Tree-sitter (context-free), bytecode scanning.
- **Weakness:** knows nothing about values or data flow. `assert x > 0` looks the same whether or not it can fail.
- **Notes:** `assignment-guide/02-*.md` (theory), `03-*` (assignment), `04-*` (your analyzer explained), `05-*` (improvements)

### 3. Semantics
- **Study chapter:** [05-semantics-and-the-jvm.md](05-semantics-and-the-jvm.md)
- **Key idea:** a program's meaning as maths. Three styles: *operational* (how it executes, step by step), *denotational* (program = mathematical function), *axiomatic* (pre/post-conditions, Hoare logic).
- **For us:** small-step operational semantics of JVM bytecode. A function `step(state) → state'` for each opcode (push, load, store, add, if, goto, return...).
- **Notes:** `assignment-guide/06-theory-semantics.md`

### 4. Dynamic analysis
- **Study chapter:** [06-dynamic-analysis.md](06-dynamic-analysis.md)
- **Key idea:** execute the program (your own bytecode interpreter) on chosen inputs and observe what happens. Every bug you find is real; you can miss bugs you never triggered.
- **Input choice:** random fuzzing → dictionary → coverage-guided → property-based → small-scope ("try all small inputs").
- **Notes:** `assignment-guide/07-*` (theory), `08-*` (plan). Code: `solutions/dynamic/src/dynamic.py`

### 5. Static analysis: bounded
- **Study chapter:** [07-abstract-interpretation.md](07-abstract-interpretation.md)
- **Key idea:** replace each concrete value with an **abstraction** (e.g. its sign: `-`, `0`, `+`) and run the same step function on abstract states. One abstract run covers infinitely many concrete runs.
- **Math needed:** poset, lattice (join ⊔ / meet ⊓, top ⊤ / bottom ⊥), Galois connection (α abstracts, γ concretizes).
- **"Bounded"** means: stop after N steps.
- **Notes:** `assignment-guide/09-theory-bounded-static-analysis.md`. Code: `solutions/static/src/abstractions.py` (`SignSet`), `static.py` (`manystep`)

### 6. Static analysis: unbounded
- **Study chapter:** [07-abstract-interpretation.md](07-abstract-interpretation.md)
- **Key idea:** keep going until nothing changes (a **fixed point**). Then the result is valid for *every* execution, including infinite ones.
- **Problem:** with intervals, `[0,0] → [0,1] → [0,2] → ...` never stops. **Widening** (∇) jumps to `[0,+∞]` to force termination.
- **Algorithm:** a worklist. Re-process a program point only when its incoming state grew.
- **Notes:** `assignment-guide/10-theory-unbounded-static-analysis.md`. Code: `Interval` in `abstractions.py` is still a **stub (all TODO)**.

### 7. The project
- **Study chapter:** [12-project-and-your-role.md](12-project-and-your-role.md)
- **Your group's topic:** *Analysis-Guided Metamorphic Testing of Java Static Analyzers*. Rewrite a method into an equivalent one (e.g. flip an `if`) and check whether an analyzer changes its answer. Use the abstract state to choose *where* to rewrite.
- **Notes:** `proposal/PROPOSAL-EXPLAINED.md`, then [12-project-and-your-role.md](12-project-and-your-role.md)

## The one comparison to remember

| | Syntactic | Dynamic | Static (abstract interp.) |
|---|---|---|---|
| Looks at | code form | real executions | all executions (approximated) |
| Finds real bugs only? | no | **yes** | no (false alarms possible) |
| Finds all bugs? | no | no | **yes, if sound** |
| Approximation | heuristic | under-approx. | over-approx. |
| Typical answer | "looks like it might" | "it **can**, here's an input" | "it **can't**" or "it might" |
| Your code | `solutions/syntactic/` | `solutions/dynamic/` | `solutions/static/` |
