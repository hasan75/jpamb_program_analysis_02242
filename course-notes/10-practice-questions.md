# 10: Practice Questions

Three parts:
- **A:** the real course quizzes, with answers explained.
- **B:** answers to every "Check yourself" question in chapters 01-07.
- **C:** mixed exam-style questions that cross topics.

Try each question closed-book first.

---

## A. Course quizzes

### Syntactic analysis quiz (14 Sep)

**Q1. What are the limitations of a syntactic analysis?**
**Answer:** *It cannot resolve semantic properties such as variable types or data-flow dependencies.*
Syntax only sees the shape of code. It parses braces fine, it's cheap, and it
needs no compilation. What it can't know is what values flow where.

**Q2. When is syntactic analysis a good tool?**
**Answer:** *When you want to capture the intent of the developer.*
The source text is where intent is most visible (names, `assert`, structure).
The other options (alias analysis, proving absence of errors, symbolic
execution) all need semantics.

**Q3 (trick). Is the language of Java programs regular, context-free, context-sensitive, or recursively enumerable?**
Java's *grammar* is (mostly) context-free. But the set of *valid* Java
programs (those that compile) needs declare-before-use, scoping and type
checking. Those conditions are not context-free. Since Java generics type
checking has been shown to be undecidable (Grigore, 2017), the most accurate
class is **recursively enumerable**. Note that the option's stated reason
("because it's Turing-complete") is not the right argument: what a program
computes at runtime doesn't decide which class its *text* belongs to. The
lesson of the trick: "parses" is not the same as "is a valid program".
*If unsure which option the lecturer marked, ask. Know the reasoning.*

### Semantics quiz (21 Sep)

**Q1. What is the semantics of a program?**
**Answer:** *The formal mathematical description of the meaning of a program and its effect on state.*

**Q2. Ways to describe semantics?**
**Answer:** *Denotational, Operational, and Axiomatic semantics.*

**Q3. What does it mean to interpret code?**
**Answer:** *To execute the instructions by simulating their effects on a virtual state.*

### Your lecture note (28 Sep), clarified
> "Semantic Analysis works on Must Analysis / Dynamic Analysis works on May Analysis"

Be careful here. The safe framing:
- **Dynamic analysis** is an *under-approximation*. Its "yes, this error happens" answers are definite facts. It can't establish "never happens".
- **Static analysis** (abstract interpretation) is an *over-approximation* of what **may** happen. Its "no" answers are guarantees; its "yes" answers may be false alarms.

Check the slides for exactly how the lecturer phrased it.

> "Example of a partially ordered set is the integer numbers."

True, but `≤` on integers is a *total* order (every pair is comparable). The
typical *partial* order in this course is `⊆` on sets: `{+}` and `{-}` are
incomparable, yet both are `⊆ {-,0,+}`. That's the Sign lattice.

---

## B. Answers to the "Check yourself" questions

### Chapter 01: Prerequisites
1. No. `{-}` and `{+}` are incomparable (neither is a subset of the other).
2. `Integer.MIN_VALUE` = −2147483648 (wraps around, no exception).
3. `load:I 0; push:I 2; load:I 1; binary:I mul; binary:I add; return:I`.
   Operator precedence decides the order: `2*y` is computed first, then added.
4. Matching nesting needs unbounded counting (a stack). Finite automata have
   finite memory (pumping lemma). Regex is regular; balanced brackets are context-free.

### Chapter 03: Intro and limits
1. Reduce from halting: for any `P`, the program `P(); 1/0;` divides by zero
   iff `P` halts. A divide-by-zero decider would decide halting, which is impossible.
2. **Neither.** It missed 5 real bugs (not sound) and 40 warnings are false (not complete).
3. **Must.** "Definitely" means it must hold on all paths (intersection at merges).
4. **Complete** (w.r.t. bug reports): every crash it reports is real. It's not sound, because it can miss bugs.

### Chapter 04: Syntactic analysis
1. **Sound:** "no array instruction ⇒ no `out of bounds`" and "no `div`/`rem` ⇒ no `divide by zero`".
   **Not sound:** "no backward jump ⇒ no `*`", because recursion can loop forever without one.
   Also "no `assert` ⇒ no `assertion error`", because a *called* method may assert.
2. A regex sees characters, not expression structure. It can match `/ (` but
   can't tell if `b + c` can be zero, can't parse nested parentheses, and is
   fooled by comments and strings.
3. Not a "bug" in the sense of being wrong. It's imprecision: the analyzer
   depends on the code's form. But users experience it as inconsistency,
   which is exactly what your project measures.

### Chapter 05: Semantics
1. ```
       bc[ι] = load i
     ─────────────────────────────────
      ⟨λ, σ, ι⟩ → ⟨λ, σ·λ[i], ι+1⟩
   ```
2. In small-step, an infinite loop is simply an infinite sequence of steps.
   In big-step there is *no derivation at all*, which looks the same as a stuck program.
3. n = −3: PCs 0, 1 (−3 ≠ 0, fall through), 2, 3, 4 (`1 / -3 = 0` in Java, truncation toward zero), 5 → **ok**, returns 0.
4. `wp(x := x+1, x > 0) = x + 1 > 0 = x ≥ 0`. Being precise about Java
   overflow: `x ≥ 0 ∧ x ≠ Integer.MAX_VALUE`, because MAX+1 wraps to negative.

### Chapter 06: Dynamic analysis
1. Formally: **nothing** about absence of bugs. Only that those 1M inputs
   don't crash. At most a statistical statement about inputs from that same distribution.
2. `x > 1000` and `y < 0` are large regions that each branch reaches
   separately. The fuzzer gets "new coverage" feedback for partial progress.
   `x == 10054203` is a single point with no partial progress to reward.
   (Modern fuzzers add comparison-splitting / CmpLog tricks for this.)
3. Deterministic: the next state is a function of the current state. If
   state sᵢ = sⱼ (i < j), the run cycles sᵢ…sⱼ forever and never returns.
   The state must include *everything* (pc, stack, locals, heap).
4. Shrinking minimizes a failing input (e.g. list of 200 numbers → `[0]`) while
   it still fails. Small counterexamples are much easier to understand and debug.

### Chapter 07: Abstract interpretation
1. `{-,0} ⊔ {+} = {-,0,+}`; `{-,0} ⊓ {0,+} = {0}`.
2. Yes (`{+} ⊆ {0,+}`). Yes (`[2,5]` lies inside `[0,10]`).
3. `x ∈ {+}` ⇒ `-x ∈ {-}` ⇒ `{+} + {-} = {-,0,+}`. The truth is always `{0}`.
   The domain forgets that the two operands are related (non-relational).
4. The Sign lattice has finite height (longest chain ⊥ ⊏ {+} ⊏ {0,+} ⊏ ⊤), so
   values can only grow 3 times. Intervals have infinite ascending chains
   `[0,0] ⊏ [0,1] ⊏ [0,2] ⊏ …`.
5. **Trick question.** Refining `n ∈ [−∞,+∞]` with `n ≠ 0` gives "everything
   except 0", which is **not an interval** (it has a hole). So the divisor
   stays `[−∞,+∞]` and the false alarm remains. Here signs (`{-,+}`) beat
   intervals! Fixes: sets of intervals, or combine both domains (a
   **reduced product**). Refining by `≠ c` only helps an interval when `c` is
   an endpoint: `[0,10]` with `≠ 0` gives `[1,10]`.
   *Relevant to your project: interval analysis is not uniformly more precise than sign analysis.*
6. `[a,b] ∇ [c,d] = [ (c < a ? −∞ : a),  (d > b ? +∞ : b) ]`.

---

## C. Mixed exam-style questions

1. **Compare** syntactic, dynamic and static analysis on `Simple.divideByNMinus10054203`. Which one(s) find the bug, and with what confidence?
   <details><summary>Answer</summary>Syntactic: sees a division by a variable expression → "maybe". Dynamic: random fuzzing almost surely misses it; dictionary fuzzing with code constants finds it → "definitely yes". Static (signs): `n − {+}` = ⊤ contains 0 → "maybe" (sound, but no witness). Intervals: same, ⊤. Only symbolic execution/SMT or dictionary fuzzing gives a witness.</details>

2. **Why** does JPAMB let you bet instead of answering yes/no? Relate to Rice's theorem.
   <details><summary>Answer</summary>Exact answers are impossible in general, so every tool approximates. Betting rewards calibrated confidence: sound "no"s can be bet heavily, guesses only lightly. It measures usefulness instead of only soundness.</details>

3. **Design** an abstract domain that would prove `arrayInBounds`-style accesses safe. What must it track?
   <details><summary>Answer</summary>Intervals for indices plus the array length (as an interval). The access `a[i]` is safe if `0 ≤ lo(i)` and `hi(i) < lo(len)`. If the length is a variable, you need a relational domain (e.g. octagons: `i − len ≤ −1`).</details>

4. **Explain** why branch refinement can change an analyzer's answer when a programmer inverts an `if` (swaps the branches and negates the condition).
   <details><summary>Answer</summary>Refinement depends on what the condition can express in the domain (e.g. `x > 0` vs `x ≤ 0`; `≠` is poorly expressed in intervals), and on where joins happen. Inverting can change which branch gets a representable refinement, or move a merge point, so different precision may survive. This is the hypothesis of your project.</details>

5. **True or false:** "A sound static analyzer that reports no errors proves the program has no bugs."
   <details><summary>Answer</summary>True only for the properties it checks, under its assumptions (e.g. JPAMB's static analyzer assumes assertions are enabled and models calls crudely). Soundness is always relative to a semantics and to the properties checked.</details>

6. **Small-step trace:** write the concrete trace of `Loops.neverDivides` (`int i = 1; while (i > 0) {} return 0/0;`). What outcome? What does a sign analysis say?
   <details><summary>Answer</summary>Concretely: `i = 1` and the loop never changes `i`, so the program loops forever → `*`. Sign analysis: `i ∈ {+}`, the loop condition `i > 0` is always true, so the exit branch is ⊥ (unreachable). It therefore correctly reports no `divide by zero`, and `*` is possible (backward jump).</details>

7. **Lattice laws:** what are the absorption laws, and why test them with property-based tests?
   <details><summary>Answer</summary>`a ⊔ (a ⊓ b) = a` and `a ⊓ (a ⊔ b) = a`. Hand-written join/meet code easily breaks them in edge cases (⊥, infinities). Hypothesis generates many random elements and finds such counterexamples. That's what `solutions/static/tests/test_abstractions.py` does.</details>

8. **Widening trade-off:** what goes wrong if you widen at *every* program point instead of only loop heads?
   <details><summary>Answer</summary>Still sound and terminating, but precision is lost needlessly: bounds jump to ±∞ even in straight-line code where a normal join would have been exact.</details>
