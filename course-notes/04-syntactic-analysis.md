# 04: Syntactic Analysis

## The question
How much can we learn about a program by looking at **how it's written**,
without reasoning about what values flow through it?

Surprisingly much. Most linters (ESLint, Pylint, Checkstyle, parts of
SpotBugs) are mainly syntactic. They're fast, simple, and work on code that
doesn't even compile.

## The ideas

### Levels of syntax
Each level is easier for a machine to process and keeps less of what the
developer meant:

```
source text   "if (n != 0) return 1 / n;"
   │ lexer
tokens        IF LPAREN ID(n) NEQ INT(0) RPAREN RETURN INT(1) DIV ID(n) SEMI
   │ parser
parse tree    every grammar rule as a node (CST)
   │ simplify
AST           If(cond=Ne(Var n, 0), then=Return(Div(1, Var n)))
   │ compiler
bytecode      load 0; ifz eq L; push 1; load 0; div; return ...
```

### Which tool fits which level (Chomsky again)
| Tool | Power | Good for | Fails at |
|---|---|---|---|
| `grep` / regex | regular | "does the file contain `assert false`?" | nesting: which `if` is this `return` inside? |
| Parser (Tree-sitter, JavaParser) | context-free | structure: "a division inside a loop", "assert as the first statement" | names/types: which `x` is this? |
| AST + symbol table / traversals | context-sensitive-ish | scoping, "variable used before assigned" | values |
| Bytecode pattern scan | simple linear scan | "method contains `div`" (no parsing needed) | loses intent |

### Traversals and folds
Most syntactic analyses are **tree walks**: visit every node, collect facts.
A **fold** (catamorphism) computes a result bottom-up: the result for a node
combines the results for its children. Example: "does this subtree contain a division?" =
`node is Div  OR  any(child contains division)`.

### Heuristics and why they work
A syntactic analyzer reasons like:
- contains `div` and the divisor is the constant `0` → divide by zero is very likely;
- contains `div` with a parameter divisor → maybe;
- no `div`/`rem` at all → **certainly no** divide by zero (this one is actually *sound*!);
- `while (true)` with no `break`/`return` → infinite loop likely.

Note the last-but-one: some syntactic facts **are** sound. If there's no
array access instruction, `out of bounds` is impossible. Use these to bet
confidently.

## Worked example
Method `checkBeforeDivideByN2`:
```java
if (n != 0) { return 1 / n; }
assert 10 > n;
return 0;
```
Syntactic reasoning:
- has `div` with a variable divisor → *divide by zero: maybe*
- has `assert` → *assertion error: maybe*
- no arrays → *out of bounds: no* (sound)
- no field/object use → *null pointer: no*
- no backward jump → *infinite loop: no* (sound for this method: no loops, no recursion)

Truth: only `ok`. The division is guarded by `n != 0`, and for `n == 0`,
`10 > 0` holds. Syntax can't see either of those facts. That needs values,
which is chapters 05-07.

## In the code
- `solutions/syntactic/src/syntactic_regex.py`: regex on source.
- `solutions/syntactic/src/syntactic_treesitter.py`: Tree-sitter AST queries.
- `solutions/syntactic/src/syntactic_bytecode.py`: scanning decompiled bytecode (your Assignment 1).

## Strengths & limits
| Strengths | Limits |
|---|---|
| very fast, scales to millions of lines | blind to values and data flow |
| works on incomplete/non-compiling code | easily fooled by equivalent rewrites (see the project!) |
| captures developer intent (names, patterns) | heuristics need tuning per codebase |
| easy to write and explain | false positives on guarded code |

## Check yourself
1. Give an outcome for which "the instruction doesn't occur ⇒ the outcome can't happen" is sound, and one where it isn't.
2. Why does a regex for "division by a variable" fail on `a / (b + c)`?
3. Two methods behave identically but your syntactic analyzer gives different answers. Is that a bug in the analyzer?

Deeper notes: `../assignment-guide/02-theory-syntactic-analysis.md`, `04-your-analyzer-explained.md`.
