# 03: Introduction: What Analysis Can and Can't Do

## The question
Given a program, can we automatically answer questions like:
- Can this method ever throw a `NullPointerException`?
- Does this loop always terminate?
- Is this password ever written to a log file?

That is **program analysis**: programs that reason about programs. It's used
in compilers (optimizations), IDEs (warnings), security scanners, and
verification of safety-critical software (planes, cars, medical devices).

## The bad news: it's impossible in general

### The halting problem, proof idea
Suppose a perfect analyzer `halts(P, x)` existed, always answering correctly
whether program `P` halts on input `x`. Build:

```python
def trouble(P):
    if halts(P, P):     # would P halt when given itself?
        while True: pass   # ...then loop forever
    else:
        return             # ...else halt
```

Now ask `halts(trouble, trouble)`:
- If it says **halts**, then `trouble` loops forever. Contradiction.
- If it says **loops**, then `trouble` halts. Contradiction.

So `halts` can't exist.

### Rice's theorem
The trick generalizes: **any non-trivial property of a program's behavior is
undecidable.** "Can divide by zero" reduces to halting: for any `P`, the
program `P(); 1/0;` divides by zero iff `P` halts.

**Consequence: every real analyzer approximates.** The interesting question
is *how* it approximates.

## The vocabulary of approximation

Think of the set of behaviors a program **really** has (R) and the set the
analyzer **reports** (A).

```
   Over-approximation (A ⊇ R)        Under-approximation (A ⊆ R)
   ┌──────────────── A ─┐            ┌──────────── R ─┐
   │  ┌──── R ────┐     │            │  ┌── A ──┐     │
   │  │  real     │ false│           │  │ found │ missed
   │  │ behaviors │ alarms           │  │       │ bugs │
   │  └───────────┘     │            │  └───────┘     │
   └────────────────────┘            └────────────────┘
   "sound" for proving safety         "complete": every report is real
   static analysis                    testing / dynamic analysis
```

| Term | Definition | Errs by |
|---|---|---|
| **Sound** (w.r.t. bugs) | reports every real bug | false positives |
| **Complete** | every reported bug is real | false negatives |
| **Precise** | few false positives | |

You can't have sound + complete + always-terminating at the same time
(Rice). Pick two:
- **sound + terminating** → abstract interpretation (chapter 07)
- **complete + terminating** → bounded testing/fuzzing (chapter 06)
- **sound + complete** → may never terminate (e.g. exhaustive search on infinite inputs)

> Careful: "sound" and "complete" are swapped in some papers depending on
> whether the claim is "there is a bug" or "the program is safe". Always
> check which property is being approximated.

### May vs. must
- **May** analysis: "X happens on *some* path" (combine paths with ∪). Example: "x *may* be null here".
- **Must** analysis: "X happens on *every* path" (combine paths with ∩). Example: "x is *definitely* initialized here".

## The practical compromise: JPAMB's scoring

Instead of demanding a yes/no answer, JPAMB lets you **bet**. For each outcome
you give a wager, a percentage, or a category, and points depend on how
confident you were and whether you were right. This rewards:
- being right with confidence,
- hedging when unsure,
- **never** betting everything on a guess.

Read `../docs/rules.md`. The scoring is the reason "probably yes" can beat a
sound but useless "maybe" on everything.

## Strengths & limits
- **Strength:** even approximate answers are very valuable (most bugs found by tools are found by approximate tools).
- **Limit:** false alarms annoy developers. Too many, and they ignore the tool. Missed bugs give false confidence.

## Check yourself
1. Explain in two sentences why "can this method divide by zero?" is undecidable.
2. An analyzer flags 100 warnings; 60 are real bugs, and it missed 5 real bugs. Is it sound? Complete?
3. Is "variable x is definitely assigned before use" a may- or must-analysis?
4. Which of sound/complete does a fuzzer give you?

Deeper notes: `../assignment-guide/01-theory-introduction.md`.
