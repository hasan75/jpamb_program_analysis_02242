# 06: Dynamic Analysis

## The question
What can we learn by **actually running** the program, and how do we choose
which runs to make?

## The ideas

### Dynamic analysis = selection + observation + abstraction
1. **Trace selection:** which inputs to run (the hard part).
2. **Trace analysis:** what to look for in each run (crashes, coverage, values).
3. **Trace abstraction:** summarize many traces (e.g. "x was always positive").

### Its fundamental property
Every bug it reports **really happened**: it's an under-approximation, so
there are no false positives. But "I found nothing" proves nothing:

> "Program testing can be used to show the presence of bugs, but never to show their absence." (Dijkstra)

In JPAMB terms: if a fuzzer triggers `divide by zero`, bet everything on it.
If it never does, you can lean towards "no", but only with a hedge.

### Choosing inputs: the fuzzing spectrum

| Technique | Idea | Finds `if (x == 10054203)`? |
|---|---|---|
| **Random** | uniformly random ints | almost never (1 in 4 billion) |
| **Dictionary** | try "interesting" values: 0, 1, -1, MIN, MAX, and **constants in the code** | yes, if you harvest constants from bytecode |
| **Coverage-guided** | keep inputs that reach new code, mutate those (AFL, libFuzzer) | gradually, not for exact equality |
| **Property-based** | generate structured inputs, check a property, *shrink* failing ones (QuickCheck, Hypothesis) | with good generators |
| **Small-scope** | exhaustively test all small inputs (e.g. all ints in [-10,10], arrays up to length 3) | no, but finds most bugs with small inputs |

**Small-scope hypothesis** (Jackson): most bugs show up on some small
input. Cheap and surprisingly effective.

### Coverage
- **Statement / instruction coverage:** which instructions ran.
- **Branch coverage:** each branch taken both ways.
- **Path coverage:** each path through the method (grows exponentially with branches, and loops give infinitely many).

Coverage measures how much of the program your inputs explored, not
whether it's correct.

### Infinite loops dynamically
You can't wait forever. Options: a step limit (if exceeded, "probably `*`"),
or **detecting a repeated state**: if the full state (pc, stack, locals)
repeats, the program is *certainly* in an infinite loop, because execution
is deterministic.

### Beyond fuzzing (not required, good to know)
- **Symbolic execution:** run with symbolic inputs `x`, collect path conditions (`x > 0 ∧ x ≠ 5`), and ask an SMT solver for inputs reaching each path. Solves the `x == 10054203` problem exactly. (KLEE, Java PathFinder)
- **Concolic testing:** concrete and symbolic together (DART, SAGE).
- **Runtime verification / sanitizers:** monitors during execution (AddressSanitizer, Valgrind).

See chapter 08.

## Worked example
```java
static int divideByNMinus10054203(int n) { return 1 / (n - 10054203); }
```
- Random fuzzing over 32-bit ints: P(hit) ≈ 2⁻³² per try. Useless.
- Dictionary from bytecode constants: the constant `10054203` appears in a `push` → try `n = 10054203` → **divide by zero** on the first try.

Lesson: **use the program's own constants as inputs.** It's cheap and very effective.

## In the code
- `solutions/dynamic/src/dynamic.py`:
  - `interpret`: a concrete bytecode interpreter (`step()` = chapter 05 rules).
  - `analyse`: runs the interpreter on generated inputs and reports observed outcomes.
- `uv run jpamb interpret dynamic-interpreter` checks your interpreter against every known case.

## Strengths & limits
| Strengths | Limits |
|---|---|
| no false positives: every finding is real | can't prove absence of bugs |
| gives a concrete failing input (easy to debug) | needle-in-haystack conditions |
| handles anything the runtime can run | needs runnable code + environment |
| simple to build | infinite loops need step limits (guessing) |

## Check yourself
1. A fuzzer ran 1 million inputs with no crash. What can you conclude, formally?
2. Why does coverage-guided fuzzing help with `if (x > 1000 && y < 0)` but not with `if (x == 10054203)`?
3. Explain how a repeated state proves non-termination for a deterministic program.
4. What does "shrinking" do in property-based testing, and why is it useful?

Deeper notes: `../assignment-guide/07-theory-dynamic-analysis.md`, `08-assignment-2-plan.md`.
