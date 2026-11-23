# 03: Glossary and Cheat Sheet

Terms are roughly in the order the course introduces them.

## Foundations

| Term | Meaning |
|---|---|
| **Program analysis** | Automatically answering questions about a program's behavior. |
| **Rice's theorem** | Every non-trivial semantic property of programs is undecidable. So all analyses must approximate. |
| **Sound** | Never misses a real error. If it says "can't happen", it can't. May raise false alarms. |
| **Complete** | Never raises a false alarm. If it says "can happen", it can. May miss errors. |
| **False positive** | Warns about an error that can't happen (hurts precision). |
| **False negative** | Misses an error that can happen (hurts soundness). |
| **Precision** | How few false alarms a (sound) analysis gives. |
| **Over-approximation** | Computes a *superset* of possible behaviors → sound. Static analysis. |
| **Under-approximation** | Computes a *subset* of possible behaviors → complete. Dynamic analysis / testing. |
| **May analysis** | "Is there *some* path where X happens?" Combine paths with union. |
| **Must analysis** | "Does X happen on *all* paths?" Combine paths with intersection. |

## Syntax

| Term | Meaning |
|---|---|
| **Token / lexer** | Splitting text into words (keywords, identifiers, numbers). |
| **CST / parse tree** | Tree that keeps every grammar detail. |
| **AST** | Abstract syntax tree: the simplified tree of the program's structure. |
| **Bytecode** | Low-level stack-machine instructions the JVM runs. JPAMB gives it to you as JSON. |
| **Chomsky hierarchy** | Regular (regex) ⊂ context-free (grammars/parsers) ⊂ context-sensitive ⊂ recursively enumerable. |
| **Tree-sitter** | Parser library used to get Java ASTs in `syntactic_treesitter.py`. |

## Semantics and interpretation

| Term | Meaning |
|---|---|
| **Semantics** | The formal, mathematical meaning of a program and its effect on state. |
| **Operational** | Meaning = how it executes (rules for each step). What we use. |
| **Denotational** | Meaning = a mathematical function from inputs to outputs. |
| **Axiomatic** | Meaning = what you can prove about it (Hoare triples `{P} S {Q}`). |
| **Small-step** | One rule per single instruction: `state → state'`. |
| **Big-step** | One rule relates a whole statement to its final result. |
| **State (JVM)** | Program counter (PC) + operand stack + local variables (+ heap). |
| **Interpreter** | Executes code by simulating each instruction's effect on a (virtual) state. |
| **Trace** | The sequence of states an execution goes through. |

## Dynamic analysis

| Term | Meaning |
|---|---|
| **Fuzzing** | Running the program on many generated inputs looking for crashes. |
| **Coverage-guided** | Prefer inputs that reach new code. |
| **Property-based testing** | Generate inputs and check a property holds (e.g. `hypothesis` in Python). |
| **Small-scope hypothesis** | Most bugs show up on small inputs, so try all small ones. |

## Abstract interpretation (the important part for the project)

| Term | Meaning |
|---|---|
| **Abstraction / abstract domain** | A simpler set of values that stands for many concrete ones. E.g. Sign `{-,0,+}`, Interval `[lo,hi]`. |
| **Poset** | A set with a partial order `⊑` (reflexive, antisymmetric, transitive). "Less information / more precise" is lower. |
| **Lattice** | A poset where every pair has a **join** `⊔` (least upper bound) and **meet** `⊓` (greatest lower bound). |
| **⊤ (top)** | "Could be anything." No information. |
| **⊥ (bottom)** | "No possible value." Unreachable. |
| **Join ⊔** | Combine info at a merge point: `{+} ⊔ {0} = {0,+}`, `[1,3] ⊔ [5,7] = [1,7]`. Loses precision. |
| **Meet ⊓** | Intersect info: `[1,10] ⊓ [5,20] = [5,10]`. Used for narrowing at branches. |
| **α (abstraction fn)** | Concrete set → abstract value. `α({1,5}) = {+}` or `[1,5]`. |
| **γ (concretization fn)** | Abstract value → set of concrete values it represents. |
| **Galois connection** | α and γ fit together: `α(C) ⊑ A ⇔ C ⊆ γ(A)`. Guarantees the abstraction is sound. |
| **Abstract operation** | E.g. `+` on signs: `{+} + {+} = {+}`, `{+} + {-} = {-,0,+}`. Must over-approximate the real one. |
| **Bounded analysis** | Run the abstract step function a fixed number of steps. |
| **Fixed point** | A state where applying the step function changes nothing. The analysis result. |
| **Widening ∇** | Jump ahead to guarantee termination: `[0,1] ∇ [0,2] = [0,+∞]`. |
| **Narrowing (textbook)** | After widening, recover some precision with a decreasing iteration. |
| **Narrowing (in your proposal)** | **Refinement at branches**: after `if (x > 0)`, set `x := x ⊓ [1,+∞]` in the true branch. Different meaning! See the note in `proposal/PROPOSAL-EXPLAINED.md`. |
| **Worklist algorithm** | Keep a queue of program points whose input state changed. Process until empty. |
| **Relational domain** | Tracks relations *between* variables (e.g. `x < y`). Signs and intervals are **non-relational**. |

## Project vocabulary

| Term | Meaning |
|---|---|
| **Metamorphic testing** | Test without knowing the right answer, by checking a relation between outputs. Here: equivalent programs ⇒ same prediction. |
| **Semantics-preserving rewrite** | A code change that keeps behavior identical (e.g. `if (c) A else B` → `if (!c) B else A`). |
| **Site** | A place in a method where a rewrite can be applied. |
| **Uncertain site** | At that point the abstract state can't decide a branch, or a divisor/index might be 0/out of bounds. |
| **Candidate site** | Uncertain *and* a rewrite there changes something the analyzer's precision depends on. |
| **Inconsistency** | Same analyzer, original vs. rewritten method → different set of predicted outcomes. |
| **Rewrite budget / time budget** | Fix the number of rewrites N, or the wall-clock time T, when comparing strategies. |
| **Mann-Whitney U** | Non-parametric statistical test comparing two strategies' results across seeds. |

## Cheat-sheet: Sign and Interval operations

**Sign** (sets of `-`, `0`, `+`; ⊤ = `{-,0,+}`):

| `a` | `b` | `a + b` | `a * b` | `a / b` |
|---|---|---|---|---|
| + | + | + | + | 0,+ |
| + | − | −,0,+ | − | −,0 |
| + | 0 | + | 0 | **error: divide by zero** |
| 0 | x | x | 0 | 0 (if b≠0) |

Division can raise `divide by zero` exactly when `0 ∈ b`.

**Interval** `[a,b]` and `[c,d]`:
- `+` → `[a+c, b+d]`
- `−` → `[a−d, b−c]`
- `*` → `[min(ac,ad,bc,bd), max(...)]`
- join → `[min(a,c), max(b,d)]`; meet → `[max(a,c), min(b,d)]` (⊥ if empty)
- widening `[a,b] ∇ [c,d]` → `[c<a ? −∞ : a,  d>b ? +∞ : b]`
- `x / [c,d]` may divide by zero iff `c ≤ 0 ≤ d`
- Watch out: Java ints overflow at ±2³¹. Either clamp to `[-2^31, 2^31-1]` or treat overflow as ⊤.
