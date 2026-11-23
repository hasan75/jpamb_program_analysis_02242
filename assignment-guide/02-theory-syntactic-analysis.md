# 02 — Theory: Syntactic Analysis

Source: [`topics/syntactic-analysis.html`](https://courses.compute.dtu.dk/02242/topics/syntactic-analysis.html)
(slides: `syntactic-analysis.slides.html`)

This is the lecture Assignment 1 is directly built on.

## Syntax vs. semantics

**Syntactic analysis** looks at a program's *structure*, not its *meaning*.
`2 + 1` and `1 + 2` are semantically equal but syntactically different
strings — a syntactic analysis can tell them apart trivially; a semantic one
has to actually reason about addition being commutative.

Most linters are syntactic: pattern-matching on structure is far cheaper to
build and maintain than reasoning about behavior, and it gives fast,
explainable feedback to developers.

## The levels of syntax (this is the key mental model)

There's a ladder from raw bits down to "what the compiler ultimately runs",
and **each level down trades away developer intent for easier automated
matching**:

| Level | What it looks like | Example |
|---|---|---|
| Text | raw file bytes/whitespace | `"1232"` |
| Tokens | text grouped into lexical units | `INT_LITERAL(1232)` |
| Concrete Syntax Tree (CST) | tokens arranged with **all** structure, including parens | `10 + (5 + 3)` → `(paren (+ 10 (paren (+ 5 3))))` |
| Abstract Syntax Tree (AST) | CST with "unimportant" structure (like redundant parens) stripped | `((10))` and `(10)` both become just `10` |
| Intermediate Representation (IR) | fully-qualified, desugared (LLVM-IR, ClangIR, RTL, ...) | `x + 2 + 4` → `mypackage.Class.x + 6` |
| Bytecode | final compiled form, source style gone | JVM opcodes like `iadd`, `if_icmpeq` |

**Worked example — why the level matters**: at the CST level you can tell
`a && b || c` (parens implicit, might confuse a reader) apart from
`(a && b) || c` (explicit, no ambiguity) — useful for a "confusing operator
precedence" linter. Go down to the AST and that distinction is already gone
(the AST doesn't care how a human wrote it, only what it means structurally).

**JPAMB's `syntactic-bytecode` example (in your repo) works at the very
bottom of this ladder** — it looks at bytecode opcodes, which is precise and
robust (no source formatting issues to worry about) but has thrown away
almost all the "this is an `assert` statement" intent; you have to
reverse-engineer that from the pattern `new AssertionError; invokespecial
<init>; athrow`, which is exactly what your analyzer does.

## What developers actually want (the empirical finding)

Christakis & Bird (2016), *"What developers want and need from program
analysis: an empirical study"*, found developers strongly prefer
**completeness over soundness** — they tolerate missed bugs far better than
false positives. Rule of thumb from the paper: keep your **false-positive
rate under 15–20%**, or developers will just ignore your tool. This is a
real-world justification for JPAMB's "soundiness"/classifier framing from
lecture 1: a tool that's occasionally wrong but rarely obnoxiously wrong is
more useful than a "perfectly sound" tool that floods you with noise.

## What can we pattern-match on? (formal language theory, briefly)

- A **language** `L` over an alphabet `Σ` is just a set of valid strings:
  `L ⊆ Σ*`.
- A **grammar** `G = (N, Σ, →, S)` (non-terminals, alphabet, production
  rules, start symbol) generates a language by rewriting `S` using the rules
  until only terminal symbols (from `Σ`) remain.

### The Chomsky hierarchy, mapped to real tools

This is the most useful part of the lecture to remember, because it tells
you **which tool to reach for**:

| Type | Class | Can express | Real tool | Can't do |
|---|---|---|---|---|
| 3 | Regular | flat patterns | **Regex** | nested/balanced structures (can't match arbitrary-depth parens) |
| 2 | Context-Free | nesting | **Parsers / grammars (BNF), Tree-sitter** | context (e.g., "is this variable in scope *here*?") |
| 1 | Context-Sensitive | nesting *with* context | tree traversal + manual context tracking | — |
| 0 | Recursively Enumerable | anything a Turing machine can recognize | bespoke matching (real linters: SpotBugs, ESLint) | fully general reasoning is undecidable (lecture 1 again) |

**Context-sensitivity example from the slides** — whether a variable `z` is
in scope depends on *where in the tree* you are, not just on the tree's
shape:
```java
int hello(int x) {
  int y;             // scope: {x, y}
  {
    int z;           // scope: {x, y, z} — is z in scope here? Yes
  }
  // scope: {x, y}    — is z in scope here? No
}
```
A plain grammar/CFG can't express this by itself; you need to track state
(a symbol table) while you walk the tree.

### Regular expressions (Type 3) — the simplest tool

Grammar: `e := ε | a | e₁e₂ | e₁+e₂ | e₁*` (empty, symbol, concatenation,
alternative, Kleene star). Runs in **O(n)**. This is what
`solutions/syntactic/src/syntactic_regex.py` uses — it searches the raw
Java source text for the literal word `assert`. Fast and dependency-free,
but brittle: it can't tell if `assert` is inside a comment or a string
literal, and it breaks the moment source formatting changes in ways the
lecture explicitly warns about (indentation, `static`/non-static, removed
case statements, other files matching the same pattern).

### Grammars & Parsers (Type 2) — Tree-sitter

Regex can't handle nesting, so real language syntax uses **context-free
grammars**, usually written in **BNF** (`A := abc | B | x*`). A **parser**
turns a token stream into a CST.

**Tree-sitter** is the parser generator this course uses (it ships as a
Python dependency in `solutions/syntactic/pyproject.toml`). You write
**queries** against the parsed tree — e.g., to find every division:

```
(binary_expression operator: "/") @divide
```

`solutions/syntactic/src/syntactic_treesitter.py` uses exactly this style:
it first queries for the right class, then the right method (matching name
*and* parameter count — this makes it *context-aware* in a limited way,
because it scopes the search to the right method body before looking for
`assert_statement` nodes, avoiding the classic false-positive of matching
an assert or a divide that lives in some *other* method of the same file).

### Context-sensitive matching (Type 1) — folds and traversals

Tree-sitter queries alone can't nest queries inside each other (e.g. "find
a divide, but only if it's inside an `if` that checks the divisor isn't
zero") — that needs genuine context tracking. Two general techniques:

- **Fold / catamorphism**: recursively collapse a tree bottom-up, given a
  function that says how to combine already-computed values from children
  into a value for the parent. This is the abstract-algebra/recursion-schemes
  view of "processing a tree."
- **Tree traversal** (pre/in/post-order): the practical, iterative version —
  walk the tree with an explicit cursor instead of recursion, so you can
  carry state (like a scope stack) along with you. Tree-sitter gives you a
  cursor object for exactly this; the lecture's example code walks it
  manually with `goto_first_child` / `goto_next_sibling` / `goto_parent`.

### Bespoke matching (Type 0) — where most real linters live

Beyond context-sensitivity, general tools get sparse; most production
linters (SpotBugs, ESLint) end up writing custom, ad-hoc logic rather than
using a single formal framework. **This is also where your submitted
analyzer lives** — `syntactic_bytecode.py` doesn't use a grammar or a parser
library at all, it just walks a list of decoded JSON bytecode instructions
and checks each `dict`'s `"opr"` field directly. It's "bespoke" in the sense
the lecture means, but it's precise because JPAMB has already done the hard
parsing work for you (via the `jvm2json` tool baked into `jpamb build`).

## Closing questions from the lecture

1. What are the limitations of syntactic analysis? *(It can't reason about
   values/behavior — e.g., it can spot "there's a division" but not "is the
   divisor provably always non-zero.")*
2. When is syntactic analysis a good tool? *(Cheap, fast, explainable
   feedback where some false positives/negatives are acceptable — exactly
   JPAMB's scoring model.)*
3. Trick question: is **Java** a regular language, context-free, or
   recursively enumerable? *(Java's grammar is context-free for the most
   part, but full semantic validity — e.g. "this identifier resolves to a
   declared variable" — needs context-sensitivity; and "this program
   halts" is only recursively enumerable, i.e. undecidable in general —
   exactly lecture 1's Rice's Theorem.)*

Next: [03 — Assignment 1: Syntactic Analysis](03-assignment-1-syntactic-analysis.md)
