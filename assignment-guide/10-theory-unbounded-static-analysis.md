# 10 — Theory: Unbounded Static Analysis

Source: [`topics/unbounded-static-analysis.html`](https://courses.compute.dtu.dk/02242/topics/unbounded-static-analysis.html)
(Topic 06). Builds on file [09](09-theory-bounded-static-analysis.md).
Not strictly required to pass Assignment 4, but every idea here is a
direct score improvement for it (fewer false "maybe"s, termination on loops).

## 1. Dependent values

**Problem:** the per-variable abstraction (file 09 §4) forgets that two
stack slots/locals hold *the same* value. Classic false positive:

```java
@Case("(0) -> ok") @Case("(1) -> ok")
public static int safeDivByN(int n) {
  if (n != 0) return 1 / n;
  return 0;
}
```

Bytecode: `load n; ifeq L; push 1; load n; div; …`. The `ifeq` refines
the *popped copy* of n, but the second `load n` reads the local, which is
still `{−,0,+}` → spurious "divide by zero".

**Fix — named values with constraints.** Give each value a name (e.g. `n`)
and keep a constraint per name (`n ∈ {−,0,+}`). On a branch, refine the
*name's* constraint:

- branch `n ≠ 0` → `n ∈ {−,+}`
- branch `n = 0` → `n ∈ {0}`

Every later `load n` sees the refined constraint.

Guidelines from the lecture:
- Never mutate a named value; a reassigned variable gets a **new** name.
- Precision vs. speed — too many names slows the analysis.
- Instructions that *create* dependencies: `dup`, `load`, array/field accesses.

A cheap version that fits `static.py`: when `Ifz`/`If` compares a value
that was just produced by `Load(index=i)`, also refine `locals[i]` with
`&` (meet) in each successor state. Needs you to remember "stack slot k
came from local i".

### 1.1 Relations between different values
`a >= 0 && b > a ⟹ b > 0` needs relational domains: **polyhedra**
(Cousot & Halbwachs 1978) or the faster **octagons**. Out of scope for a
one-day job; good to know the names for the exam.

## 2. Unbounded analysis = run to a fixed point

Bounded analysis says nothing about traces longer than N. Instead iterate
until nothing changes.

### 2.1 Fixed points
For a monotone `f: A → A`, the **least fixed point** is `fⁿ(⊥)` for the
smallest n with `fⁿ(⊥) = fⁿ⁺¹(⊥)`. If the lattice has **finite height**,
this is guaranteed to happen — Sign's lattice has height 4, so each slot
can change at most ~3 times.

Making a non-monotone step monotone: `f(x) = x ⊔ a(x)`. E.g. with
`a(x) = x +_Sign {+}`:
```
f⁰ = {0},  f¹ = {0} ⊔ {+} = {0,+},  f² = {0,+} ⊔ {+} = {0,+}   ← fixed point
```
That's exactly what `states[pc_] = before | st` does in `static.py`.

**Practical consequence:** in `analyse()`, if the worklist becomes
**empty**, you've reached the fixed point and your "this outcome is
unreachable" answers are *sound for all trace lengths*. If you stopped
because `steps` ran out, they're only bounded claims.

### 2.2 Interval abstraction (`Itval`)
`[i, j]` = `{n | i ≤ n ≤ j}`.

```
α(S) = [min S, max S]            γ([i,j]) = {n ∈ ℤ | i ≤ n ≤ j}
[i,j] ⊑ [k,h] ≡ k ≤ i ∧ j ≤ h
[i,j] ⊔ [k,h] = [min(i,k), max(j,h)]
[i,j] ⊓ [k,h] = [max(i,k), min(j,h)]
⊤ = [−∞, ∞]                      ⊥ = [∞, −∞]   (empty)
```

The repo stub: `Interval(min, max)` in `abstractions.py`, `None` meaning
∞/−∞ — every method is `raise NotImplementedError("TODO")`, and the three
interval tests in `test_abstractions.py` are `@pytest.mark.skip("todo")`.
Lecture's assignments: implement it, test with hypothesis
(`abstract(xs)` contains all xs; `abstract(xs) | abstract(ys) == abstract(xs | ys)`;
`abstract(xs) + abstract(ys)` contains every `x + y`).

**Why intervals matter for JPAMB:** array bounds (`0 ≤ i < length`),
`x - 1 == 0`-style divisions, loops to a constant.

**Problem:** infinite height. `while (i >= 0) i++;` gives
`[0,0] → [0,1] → [0,2] → …` forever.

### 2.3 Widening ∇
Jump straight to a stable over-approximation. With **K** = all integer
constants in the program ∪ {−∞, ∞}:

```
[i,j] ∇ᴷ [k,h] = [ min_K{i,k}, max_K{j,h} ]
```
where `min_K` picks the largest k ∈ K ≤ the min, `max_K` the smallest
k ∈ K ≥ the max. Bounds can only snap to finitely many values, so the
iteration terminates. Above: `[0,0] ∇ [0,1] = [0, ∞]` (no constant ≥ 1
in K besides ∞) — done in one step.

Two laws to prove for any widening:
1. **Upper bound:** `a ⊑ a∇b` and `b ⊑ a∇b`.
2. **Finite chains:** any sequence `((a₀∇a₁)∇a₂)…` stabilises after
   finitely many steps.

Where to apply it: not everywhere (loses precision) — only at **loop
heads** (targets of backward jumps), i.e. in `step()` use
`before.widen(st)` instead of `before | st` when `pc_` is a back-edge
target, or after a PC has been updated more than a few times.

### 2.4 Worklist algorithm
Don't re-run the whole program each iteration; only re-process PCs whose
input state changed. The lecture's code is (almost exactly) what
`AbstractInterpreter.step()` in `static.py` already does:

```python
pc = self.worklist.pop()
for pc_, st in manystep(self.bc, pc, self.states[pc]):
    before = self.states.get(pc_, st)
    after = before | st
    if pc_ not in self.states or after != before:
        self.states[pc_] = after
        self.worklist.append(pc_)
```

### 2.4.1 Processing order
- **Reverse post-order** of the CFG: handle both arms of an `if` before
  the join point, so the join is computed once instead of twice.
- **SCCs**: collapse each loop (strongly connected component) into one
  node, run it to its fixed point, *then* continue after it.

Cheap approximation: `deque.pop()` (LIFO, DFS-ish) is what the scaffold
uses; switching to a priority queue on PC offset (smallest first) is
close to reverse post-order for structured Java code and is a one-liner.

## Discussion questions (exam-style)

1. *Dependent variables?* Their possible values constrain each other
   (`n` and the copy of `n` on the stack; `i` and `a.length`).
2. *Main problem of unbounded analysis?* Termination — infinite-height
   lattices give infinite ascending chains.
3. *Why widening?* To force convergence in finitely many steps, at the
   cost of over-approximation.

## References
Cousot & Halbwachs 1978 (polyhedra); Nielson & Nielson 2020, *Program
Analysis (an Appetizer)* — fixed points & widening p.110, worklist p.59,
control-flow analysis p.63.
