# 01: Prerequisites

The course assumes background from several areas. You don't need all of it
in depth. Skim each section. If something is new, spend 20 minutes on it
before moving on.

---

## 1. Sets, relations, functions

**Sets.** `{1,2,3}`. Union `A ∪ B`, intersection `A ∩ B`, subset `A ⊆ B`,
empty set `∅`, power set `P(A)` = the set of all subsets of `A`.
Example: `P({-,0,+})` has 8 elements, from `∅` to `{-,0,+}`. That is the Sign domain.

**Relations.** A relation `R` on `A` is a set of pairs `(a,b)`. Properties:

| Property | Means | Example |
|---|---|---|
| reflexive | `a R a` for all `a` | `≤`, `⊆` |
| antisymmetric | `a R b` and `b R a` ⇒ `a = b` | `≤`, `⊆` |
| transitive | `a R b` and `b R c` ⇒ `a R c` | `≤`, `⊆`, `<` |
| total | every pair is comparable: `a R b` or `b R a` | `≤` on ints. **Not** `⊆` |

A relation that is reflexive, antisymmetric and transitive is a **partial
order**. If it's also total, it's a **total order**. Chapter 07 is built
on partial orders.

**Functions.** `f : A → B`. Composition `(f ∘ g)(x) = f(g(x))`.
**Monotone**: `x ⊑ y ⇒ f(x) ⊑ f(y)` ("more input info never gives less output info").
**Fixed point**: `x` with `f(x) = x`. Monotonicity plus fixed points are the
whole mathematical engine of static analysis.

**Upper bounds.** `u` is an upper bound of `{a,b}` if `a ⊑ u` and `b ⊑ u`.
The **least upper bound** (join, `a ⊔ b`) is the smallest such `u`.
For sets under `⊆`, join = union, meet = intersection.

---

## 2. Logic

- Propositional logic: `∧` and, `∨` or, `¬` not, `⇒` implies, `⇔` iff.
- Predicate logic: `∀x. P(x)` for all, `∃x. P(x)` exists.
- **Analyses answer ∃ questions:** "∃ input such that the program divides by zero?"
  To say "yes" you need *one* witness. To say "no" you need to reason about *all* inputs.
  This asymmetry explains why testing finds bugs but can't prove their absence.
- Hoare triples `{P} S {Q}`: if `P` holds before `S`, then `Q` holds after (chapter 05).

---

## 3. Computability (just the essentials)

- **Turing machine / Turing-complete:** a language that can compute anything computable. Java, Python and JVM bytecode are.
- **Decidable problem:** some algorithm always terminates with the correct yes/no.
- **Halting problem:** "does program P halt on input x?" is **undecidable** (Turing, 1936).
- **Rice's theorem:** *every* non-trivial question about what a program *does* is undecidable.
  "Can it divide by zero?" "Is it ever null here?" Undecidable.
- **Semi-decidable / recursively enumerable:** an algorithm says "yes" eventually when the answer is yes, but may run forever when it's no. "Can this program crash?" is semi-decidable: enumerate inputs and run them (with time-slicing). If a crash exists you find it eventually.

Chapter 03 shows the proof idea.

**Formal languages (Chomsky hierarchy):**

| Type | Language class | Recognized by | Example |
|---|---|---|---|
| 3 | Regular | finite automaton / regex | identifiers, numbers |
| 2 | Context-free | pushdown automaton / grammar | balanced brackets, Java syntax |
| 1 | Context-sensitive | linear-bounded automaton | `aⁿbⁿcⁿ`, declare-before-use |
| 0 | Recursively enumerable | Turing machine | anything computable |

Key fact: **regex can't match balanced parentheses**. You need a parser.

---

## 4. Java and the JVM

### Java features that appear in the benchmark
- `int`, `boolean`, `char`, arrays `int[]`, `char[]`, `String`
- `assert cond;` throws `AssertionError` if `cond` is false (*only if assertions are enabled*, `java -ea`).
- Exceptions: `ArithmeticException` (/ by zero), `ArrayIndexOutOfBoundsException`, `NullPointerException`.
- Integer overflow: `Integer.MAX_VALUE + 1 == Integer.MIN_VALUE` (no exception, wraps around!).
- Static methods, recursion, loops.

### How Java runs
```
Foo.java ──javac──▶ Foo.class (bytecode) ──JVM──▶ runs (interpreter + JIT)
```
JPAMB decompiles `.class` files to JSON with `jvm2json`. Your analyzers read the JSON.

### The JVM is a stack machine
Each method call has a **frame** with:
- **local variables** array: parameters first (`local[0]` = first arg for static methods),
- **operand stack**: instructions pop their inputs and push their results,
- **program counter (PC)**: index of the current instruction.

`return 1 / n;` compiles to:
```
push:I 1      stack: [1]
load:I 0      stack: [1, n]       (local 0 is n)
binary:I div  stack: [1/n]        (pops 2, pushes 1; throws if n == 0)
return:I      returns top of stack
```
Main instruction families (JPAMB names): `push`, `load`, `store`, `binary`
(add/sub/mul/div/rem), `incr` (i++), `ifz` (compare with 0 and jump),
`if` (compare two values and jump), `goto`, `new`, `newarray`, `array_load`,
`array_store`, `arraylength`, `invoke`, `return`, `throw`, `dup`, `get` (static field).

See `../OPCODES.md` for the full list and `uv run jpamb inspect <method>` to see any method's bytecode.

**Why analyze bytecode and not source?** It's much smaller and more regular
(about 30 instruction kinds versus the whole Java grammar), and loops,
`&&`, `for` and `while` all become plain jumps. The price: you lose names
and structure (the developer's *intent*).

---

## 5. Python features used in the solutions

| Feature | Looks like | Used for |
|---|---|---|
| dataclasses | `@dataclass(frozen=True) class State: ...` | immutable states, values |
| pattern matching | `match opr: case jvm.Push(value=v): ...` | dispatching on instruction type |
| generators | `yield (pc+1, state)` | a step that can produce several successors (branches!) |
| operator overloading | `def __or__(self, o)` → `a \| b` | join of lattice elements |
| type hints | `def f(x: int) -> SignSet` | documentation |
| `hypothesis` | `@given(st.integers())` | property-based tests (chapter 06) |
| `uv` | `uv run ...` | package/venv manager used for everything |

If `match`/`case` or `yield` are new to you, read the official Python tutorial
sections on them. Both appear on almost every line of `static.py`.

---

## Check yourself
1. Is `⊆` on `P({-,0,+})` a total order? Give two incomparable elements.
2. What does `Integer.MAX_VALUE + 1` evaluate to in Java?
3. Write the bytecode (in the style above) for `return x + 2 * y;` with `x = local 0`, `y = local 1`.
4. Why can't a regex check that every `{` in a Java file has a matching `}`?
