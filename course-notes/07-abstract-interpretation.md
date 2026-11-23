# 07: Abstract Interpretation (Static Analysis)

This is the heart of the course and the most mathematical part. Take it slowly.

## The question
Dynamic analysis runs *some* inputs. Can we run the program on **all inputs
at once**, and still terminate?

**Yes, if we run it on *descriptions* of values instead of values.** Instead
of `n = 5`, track `n is positive`. One abstract run covers infinitely many
concrete runs. This is **abstract interpretation** (Cousot & Cousot, 1977).

## Part 1: The intuition

The "rule of signs" from school is abstract interpretation:
- positive × negative = negative, *whatever the numbers are*.
- positive + negative = ??? (could be anything). We lose information.

So:
1. Pick an **abstract domain** (signs, intervals, ...).
2. Define each operation on it so that it **over-approximates** the real one.
3. Run the program's semantics (chapter 05) on abstract values.
4. When a branch can go both ways, follow **both**.
5. Where paths meet, **join** the information.

The result is sound: anything that can happen concretely shows up abstractly.
The price is false alarms.

## Part 2: The mathematics (why it's correct)

### Posets: "how much do I know?"
A **partial order** `⊑` on abstract values means "is more precise than / contains fewer concrete values than".
For signs: `{+} ⊑ {0,+} ⊑ {-,0,+}`. `{+}` and `{-}` are **incomparable**.

### Lattices: "combine what I know"
A **lattice** is a poset where any two elements have:
- a **join** `a ⊔ b`: least upper bound. Used at merge points ("x is `+` on one path, `0` on the other" → `{0,+}`).
- a **meet** `a ⊓ b`: greatest lower bound. Used to *refine* ("x is ⊤, but this branch says x>0" → `{+}`).
- **⊤ (top):** know nothing (any value). **⊥ (bottom):** no value possible (unreachable code).

The Sign lattice (subsets of `{-,0,+}` ordered by ⊆):
```
              {-,0,+}  = ⊤
            /    |    \
       {-,0}  {-,+}  {0,+}
         |  \/    \/  |
         |  /\    /\  |
        {-}   {0}   {+}
            \  |  /
              {}       = ⊥
```

### Galois connection: linking abstract and concrete
- **α (abstraction):** set of concrete values → best abstract value. `α({3, 7}) = {+}`.
- **γ (concretization):** abstract value → set of values it means. `γ({0,+}) = {0, 1, 2, ...}`.
- They form a **Galois connection** when `α(C) ⊑ A  ⇔  C ⊆ γ(A)`.
  In words: *A is a correct description of C exactly when C fits inside what A means.*

This is what makes the analysis provably sound.

### Abstract operations must be sound
For every operation `op`, the abstract version `op#` must satisfy
`op(γ(a), γ(b)) ⊆ γ(op#(a, b))`: the abstract result covers every concrete result.
The *best* abstract operation is `op#(a,b) = α(op(γ(a), γ(b)))`.

Sign addition:
| + | {-} | {0} | {+} |
|---|---|---|---|
| **{-}** | {-} | {-} | {-,0,+} |
| **{0}** | {-} | {0} | {+} |
| **{+}** | {-,0,+} | {+} | {+} |

(For sets, apply it element-wise and union the results.)
Division `a / b` reports **divide by zero** iff `0 ∈ b`.

## Part 3: Running it (bounded analysis)

The abstract state at each PC = abstract values for locals + stack. The
**many-step** function takes a set of abstract states and produces their
successors. A branch whose condition is unknown produces **two** successors.

### Worked example: sign analysis of `checkBeforeDivideByN2`
Input: `n ∈ ⊤ = {-,0,+}`.

| PC | instruction | state (locals; stack) | notes |
|---|---|---|---|
| 0 | load 0 | n=⊤ ; [⊤] | |
| 1 | ifz eq 6 | n=⊤ ; [] | is ⊤ == 0? **both possible** → go to 2 and 6 |
| 2-3 | push 1, load 0 | n=⊤ ; [{+}, ⊤] | |
| 4 | div | | divisor ⊤ contains 0 → **report divide by zero** ⚠ |
| 5 | return | | **ok** |
| 6-9 | ... push 10, load 0 | n=⊤ ; [{+}, ⊤] | |
| 10 | if gt 15 | | {+} > ⊤? **both** → 11 and 15 |
| 11-14 | new, throw | | **report assertion error** ⚠ |
| 15-16 | push 0, return | | **ok** |

Result: `{ok, divide by zero, assertion error}`. The truth is `{ok}`: two false alarms.

**Why?** At PC 1 the analysis *knew* which branch means `n == 0`, but it sent
the same `n = ⊤` down both. Fix: **refine at branches** (also called
*branch narrowing* or *filtering*):
- on the jump to 6 (`n == 0` true): `n := n ⊓ {0} = {0}`
- on the fall-through to 2 (`n == 0` false): `n := n ⊓ {-,+} = {-,+}`

Now PC 4's divisor is `{-,+}` → no divide by zero. At PC 10, `{+} > {0}` is
always true → no assertion error. Result: `{ok}`. **Exact.**

This one improvement is a big precision gain, and it's what your project
builds (chapter 12).

## Part 4: Loops and termination (unbounded analysis)

Bounded analysis stops after N steps, so it says nothing about behavior beyond
step N. For a real guarantee we iterate until the abstract states **stop
changing**: a **fixed point**.

### Fixed points
Let `F(S) = S₀ ∪ step#(S)`. Start from ⊥ and iterate `⊥, F(⊥), F(F(⊥)), ...`.
If `F` is monotone and the lattice has **finite height**, this reaches the least
fixed point (Kleene / Tarski). The Sign lattice has height 3, so it always terminates.

### Intervals: more precise, but a new problem
Interval domain: `[lo, hi]` with `lo, hi ∈ ℤ ∪ {-∞, +∞}`. It tells
`[1, 9]` apart from `[1, 1000000]`, which signs can't.

```java
int i = 0;
while (i < 100) i++;
```
Iterating at the loop head: `[0,0] → [0,1] → [0,2] → ...`, a hundred
iterations here, and infinitely many for `while (true) i++`. Intervals have
**infinite ascending chains**.

### Widening ∇
At loop heads, replace join with **widening**: if a bound grew, jump it straight to infinity.
```
[0,0] ∇ [0,1] = [0, +∞]
```
Now the loop head stabilizes in a couple of iterations. Soundness is kept
(we only lost precision). Precision can be partly recovered with:
- **branch refinement:** inside the loop, `i < 100` gives `i ∈ [0,99]`; after the loop, `i ≥ 100` gives `i ∈ [100, +∞]`;
- **narrowing (textbook sense):** a few decreasing iterations after the fixed point, e.g. getting `[100,100]` back.

> ⚠ Two meanings of "narrowing": (1) the textbook dual of widening, (2)
> refining with a branch condition. Your project proposal uses meaning (2).

### Worklist algorithm
```
state[entry] = initial;  worklist = {entry}
while worklist not empty:
    pc = worklist.pop()
    for (succ, s') in step#(pc, state[pc]):
        new = state[succ] ⊔ s'        (use ∇ if succ is a loop head)
        if new ≠ state[succ]:
            state[succ] = new
            worklist.add(succ)
```
It only revisits program points whose input actually changed.

### Infinite loops statically
A sound analysis can say "`*` is **impossible**" (e.g. no backward jumps,
no recursion), or "the loop exit is unreachable" (the exit state is ⊥, as in
`while (i > 0) {}` with `i ∈ {+}`). Proving termination in general requires
**ranking functions** (chapter 08).

## Part 5: Choosing a domain

| Domain | Tracks | Cost | Can prove |
|---|---|---|---|
| Sign | `-`,`0`,`+` | tiny | `x/y` safe when `y ∈ {+}` |
| Constant | exact value or ⊤ | tiny | constant folding |
| Interval | `[lo,hi]` per variable | small | array bounds `0 ≤ i < 10` |
| Octagon | `±x ± y ≤ c` | O(n³) | `i < n` relations |
| Polyhedra | any linear inequalities | exponential | complex linear invariants |

Signs and intervals are **non-relational**: they can't express `x < y`, so they
fail on methods where safety depends on a relation (see `Dependent.java` in the benchmark).

## In the code
- `solutions/static/src/abstractions.py`: `Poset`, `Lattice`, `SignSet` (complete), `Interval` (stub), plus property checks `is_lattice`, `is_galoi`.
- `solutions/static/src/static.py`: `State` (locals + stack of abstract values), `manystep` (abstract step), `AbstractInterpreter`.
- `solutions/static/tests/test_abstractions.py`: hypothesis tests that the lattice laws hold.
- `uv run jpamb interpret --abstract static-interpreter` checks your abstract states cover every reachable program point.

## Strengths & limits
| Strengths | Limits |
|---|---|
| sound: "no" answers are guarantees | false alarms (imprecision) |
| always terminates (finite height / widening) | precision depends heavily on the domain |
| no inputs or environment needed | more math, harder to implement |
| scales (industrial: Astrée, Infer) | sensitive to how code is written (the project's topic!) |

## Check yourself
1. Compute `{-,0} ⊔ {+}` and `{-,0} ⊓ {0,+}`.
2. Is `{+} ⊑ {0,+}`? Is `[2,5] ⊑ [0,10]`?
3. Show that sign addition loses precision on `x + (-x)`.
4. Why does sign analysis terminate without widening, but interval analysis doesn't?
5. Redo the worked example with intervals and branch refinement. What's the divisor's interval at PC 4?
6. Write `[a,b] ∇ [c,d]`.

Deeper notes: `../assignment-guide/09-theory-bounded-static-analysis.md` and `10-theory-unbounded-static-analysis.md`.
