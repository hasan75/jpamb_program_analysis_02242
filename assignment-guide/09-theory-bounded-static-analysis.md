# 09 — Theory: Bounded Static Analysis

Source: [`topics/bounded-static-analysis.html`](https://courses.compute.dtu.dk/02242/topics/bounded-static-analysis.html)
(Topic 05). This is the lecture the Assignment 4 page links as its
learning material, and the one `solutions/static/` is built around.

## The one-sentence idea

Dynamic analysis (file [07](07-theory-dynamic-analysis.md)) runs **one**
trace at a time, depth-first. Static analysis runs the semantics on **all
initial states at once**, breadth-first — and because "all states" is
infinite, it runs on a finite **abstraction** of them instead.

"Bounded" means: we only look at traces up to length *n* (a step budget).

## 1. Goal and notation

- `p, n ⊢^must_BSA Q` — "our analysis claims Q holds for every trace of
  length ≤ n in program p".
- Soundness: `p, n ⊢^must_BSA Q ⟹ p, n ⊨_must Q` (if we claim it, it's true).

The practical trick is to do a **may** analysis of the *negation*: if we
over-approximate all traces and *still* can't find one that violates Q,
then Q must hold.

```
¬(p, n ⊢^¬may_BSA ¬Q)  ≡  p, n ⊢^must_BSA Q
```

Concretely for JPAMB: "assertion error is impossible" =
`∀τ ∈ Sem_n(p). ¬ae(τ)` where `ae(τ) ≡ last(τ) = err('assertion error')`.
So if the abstract interpreter never reaches `"assertion error"`, you may
answer `assertion error;no` (or a low percentage). **This is why every
dropped path in your analyzer is dangerous**: a path you forget to explore
becomes a confident, wrong "no".

## 2. The many-step function

The single-step relation `δ_p(s, s')` (file [06](06-theory-semantics.md))
lifted to *sets of traces*:

```
Δ_p(T)  = { τ' s  |  τ' ∈ T, δ_p(last(τ'), s) }
Δ⁰_p    = I_p                          (initial states)
Δⁿ_p    = Δ_p(Δⁿ⁻¹_p) ∪ Δⁿ⁻¹_p           (all traces up to length n)
```

and the approximation hierarchy `Δ_must(T) ⊆ Δ(T) ⊆ Δ_may(T)`. We build
`Δ_may` — a step function that may produce *extra* states but never
*misses* one.

## 3. Abstractions

### 3.1 Sign abstraction
Replace every integer by its sign: `Sign = {+, 0, −}`, and a set of
integers by the set of signs occurring in it:

```
α({1,2,3}) = {+}     α({0}) = {0}     α({−1,3}) = {+,−}     α({−1,0,3}) = {−,0,+}
```

In the repo this is `SignSet` in `solutions/static/src/abstractions.py`
(signs stored as `-1, 0, 1`).

### 3.2 Posets
`(L, ⊑)` with ⊑ **reflexive**, **antisymmetric**, **transitive**.
Examples: `(ℤ, ≤)`, `({tt,ff}, ⟹)`, `(2^Sign, ⊆)`. The repo's
`is_poset()` checks exactly those three laws, and `test_signset_is_poset`
runs it via hypothesis.

### 3.3 Lattices
A poset with **join** ⊔ (least upper bound) and **meet** ⊓ (greatest lower
bound), plus ⊥ (bottom) and ⊤ (top):

```
⊤ ⊓ a = a = a ⊔ ⊥        ⊤ ⊔ a = ⊤        a ⊓ ⊥ = ⊥
```

For signs: ⊑ = ⊆, ⊔ = ∪, ⊓ = ∩, ⊥ = ∅, ⊤ = {−,0,+}. Hasse diagram is the
cube of subsets of {−,0,+}. In Python: `|` is join (`__or__`), `&` is
meet (`__and__`), `<=` is ⊑. `is_lattice()` checks the laws.

### 3.4 Galois connections
Two posets `(C, ⊑_C)` (concrete) and `(A, ⊑_A)` (abstract), with
`α: C → A` and `γ: A → C`, such that

```
c ⊑_C γ(a)   ⇔   α(c) ⊑_A a
```

Free consequences worth remembering:
1. `c ⊑ γ(α(c))` — abstracting never loses concrete values (soundness!)
2. `α(γ(a)) ⊑ a`
3. `α∘γ∘α = α`, `γ∘α∘γ = γ` — information is lost only once
4. γ preserves joins, α preserves meets

In code: `abstract()` is α, and `__contains__` is "is this concrete value
in γ(a)?". `is_galoi()` checks property 1: every value you abstracted is
`in` the result.

### 3.5 Abstract operations
Concrete addition on sets: `A +ᵢ₃₂ B = {a+b | a∈A, b∈B}`. The abstract
version must over-approximate:

```
A +ᵢ₃₂ B ⊆ γ(α(A) +_Sign α(B))       equivalently      α(A +ᵢ₃₂ B) ⊑ α(A) +_Sign α(B)
```

Addition table (rows = left operand):

| +    | {+}      | {0} | {−}      |
|------|----------|-----|----------|
| {+}  | {+}      | {+} | {−,0,+}  |
| {0}  | {+}      | {0} | {−}      |
| {−}  | {−,0,+}  | {−} | {−}      |

The test for this is literally the proof obligation:
`test_signset_arithmetic` asserts `real <= abstracted`. You extend the
`sampled_from([...])` lists in the test file as you add `Sub`, `Mul`,
`Div`, `Rem` and `Ne`, `Eq`, `Lt`, `Gt`, `Ge`.

Two things specific to JPAMB's version of these operations:
- `arithmetic()` returns `(result, errors)` — e.g. `Div` with a divisor
  containing `0` must return `"divide by zero"` in the error set (and the
  result only covers the non-zero divisors).
- `compare()` returns the **set of possible booleans** — `{True}`,
  `{False}` or `{True, False}`. `Ifz` then follows every branch whose
  boolean is possible.

## 4. Bounded abstract interpretation

Given an abstract domain A with step `Δ_A` and a Galois connection from
`(2^Trace, ⊆)`:

```
Δ⁰_A = α(I_P)
Δⁿ_A = Δ_A(Δⁿ⁻¹_A) ⊔_A Δⁿ⁻¹_A
```

**Soundness theorem** (by induction): `Δⁿ ⊆ γ(Δⁿ_A)` as long as each step
is sound: `α(Δ(T)) ⊑_A Δ_A(α(T))`. I.e. *you only have to prove each
opcode case sound on its own* — the whole analysis is then sound.

The lecture builds the domain as a chain of abstractions, each a Galois
connection, so the composite is sound:

```
(2^Trace,⊆) ⇄ (2^State,⊆) ⇄ (PC,⊑_PC) ⇄ (PV,⊑_PV) ⇄ (PV[Sign],⊑_PV[Sign])
```

| Layer | Keeps | Throws away | Where in `static.py` |
|---|---|---|---|
| **State** `α(T) = {last(τ)}` | final state of each trace | history | we never store traces |
| **Per-instruction** `PC = ι → 2^State` | one bucket of states per PC | which state came from where | `AbstractInterpreter.states: dict[PC, State]` |
| **Per-variable** `PV = ι → (ℕ→2^V) × (2^V)*` | per local / per stack slot set of values | correlation between variables (**first big precision loss**) | `State(locals, stack)` merged with `State.__or__` |
| **PV[Sign]** | per slot, a sign set | actual numbers | `locals: tuple[SignSet,...]` |

The per-instruction step:
```
Δ_PC(C) = ⨆ { ι' ↦ {s'} | (ι ↦ S) ∈ C, s' ∈ Δ_ι(S) }
```
This is exactly `manystep(bc, pc, state)`: given the merged abstract state
at one PC, yield every `(next_pc, next_state)` — or an outcome string like
`"ok"` / `"divide by zero"` — and the caller joins (`|`) the result into
`states[next_pc]`.

The lecture also suggests pseudo-elements **Bot** (joins to anything),
**Err** and **Ok** — the repo handles Err/Ok by yielding strings instead.

## 5. Exercises the lecture assigns (= Assignment 4 work)

1. Complete `SignSet` in `abstractions.py`, driven by `tests/test_abstractions.py`.
2. Add opcode cases to `manystep` in `src/static.py`, using your concrete
   interpreter (`solutions/dynamic/src/dynamic.py`) as the guide.
3. Abstract more of the state if you want (e.g. try other abstractions —
   §3.4 "experiment with alternatives beyond Sign"; intervals in file 10).

## Reflection questions (exam-style)

1. *Why abstract?* Sets of states are infinite; abstractions are finite
   and computable while (via Galois connections) staying sound.
2. *What do Galois connections buy you?* A recipe: prove each abstract
   operation sound locally, compose connections, and soundness of the
   whole analysis follows for free.
3. *What can Sign not catch?* Anything depending on actual values or on
   relations between variables: `x / (x - 1)`, array bounds (`i < len`),
   `n != 0` guards on a *copy* of n, loops counting to a constant, etc.
