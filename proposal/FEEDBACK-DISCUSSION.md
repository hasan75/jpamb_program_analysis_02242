# Round 2 feedback: what we changed and why

Discussion notes for a meeting with the professor. For each piece of
feedback: what we changed, why, and questions he might ask with short
answers.

---

## 1. Gap

**Feedback:** "*In JPAMB an analyzer receives only the method*" — how is that
relevant? What else would it receive?

**What we changed:** we removed that clause. The sentence now reads:

> "A static analyzer's prediction for a method does not depend on runtime
> inputs, so input-level guidance cannot reveal whether the analyzer's answer
> depends on how the code is written."

**Why:** the clause is true of every static analyzer, so it added nothing.
What matters is the argument against Domingues et al.: they guide a fuzzer's
*inputs*, and inputs can't show whether an analyzer depends on how the code is
written. We also added "runtime" before "inputs", so it can't be read as "the
method is the input". We left the rest of the paragraph alone because he
called it a great improvement.

**If he asks "so why doesn't Domingues et al. solve your problem?":**

> They test the *program*, and the abstract interpreter only helps choose
> inputs. We test the *analyzer*, so our "inputs" are equivalent versions of
> the program. That's why we have to vary the code, not the input values.

---

## 2. Innovation

### a) "Ranks candidate sites first; random selection draws uniformly…" — is random based on the ranked candidates, or a baseline? Why rank at all?

**What we changed:**

- Random selection is no longer in Innovation. It's only a **baseline**,
  introduced in Evaluation.
- "Ranks" is gone. There is now a **single budget of *N* rewrites for the
  whole benchmark**. The guided strategy spends it on candidate sites first,
  choosing among them at random, and uses other sites only when no candidates
  remain.

**Why there's no ranking score:** we counted branch and division instructions
in the 47 benchmark methods:

- 19 methods have no branches at all;
- most of the rest have 1–3;
- each `assert` adds a branch on `$assertionsDisabled` that can't be rewritten
  in the source.

So most methods have only 0–2 real sites. A score that orders candidates would
almost never change which sites get rewritten.

**Why the budget is for the whole benchmark, not per method:** with so few
sites, a per-method budget lets random selection rewrite nearly every site
too, and all strategies would look the same. With one budget across the
benchmark, guided selection spends it on candidates anywhere, while random
wastes part of it on sites that can't change the result.

### b) "Not a proof of equivalence" — how do you make sure you don't change behavior?

**What we changed:** this is now described as a plan in two layers.

1. **Preconditions give the guarantee.** Each rewrite rule has a precondition
   that the site finder checks before applying it:
   - the condition has no side effects;
   - it compares `int` values;
   - no rule changes arithmetic that may overflow. For example,
     `x+1 > y` → `x >= y` is wrong at `MAX_VALUE`, so that rule is excluded.
2. **Testing catches implementation mistakes.** We synthesize test inputs from
   the abstract state: inputs that make each rewritten condition true and
   false, plus the boundary values of each variable's interval. Any variant
   whose outcome differs from the original is discarded.

**If he asks "so it's still not a proof?":**

> The guarantee comes from the preconditions plus a short argument per rule,
> which goes in the paper. Testing is there to catch bugs in our
> implementation, not to prove equivalence.

### c) Score 1/4: not enough technical contribution for all members

**What we changed:** the table claimed **10 points for NTS (analysis-informed
test synthesis)**, but the text never described test synthesis. The input
synthesis in (b) is now that contribution: inputs are derived from the
abstract state and used to check rewrites. It's owned by $S_2$ (who provides
the abstract states) and $S_3$ (who builds the tests). Each table row now
matches a part of the text:

| Row | What it covers |
|---|---|
| ISY | site finder, syntax-based baseline |
| NCR | guided rewriting |
| NTS | test synthesis |

---

## 3. Evaluation

### a) "Faults are not mentioned… not a proposal log book"

**What we changed:** we deleted the sentence about replacing injected faults.
Its point is now stated directly: the three analyzers (sign without narrowing,
sign with narrowing, interval) **differ only in precision, for reasons
unrelated to our selection strategies**.

**Lesson to mention:** every paragraph should read as if earlier versions
never existed. The history lives in our own notes, not in the paper.

### b) "What is a rewrite budget, how is it different from a time budget? Too long."

**What we changed:** a separate paragraph with short sentences.

| Budget | What it fixes | What it measures |
|---|---|---|
| **Rewrite budget** | every strategy produces the same number *N* of variants | how well each strategy chooses sites |
| **Time budget** | every strategy runs for the same time *T*; the guided strategy's analysis time counts towards *T* | whether the guidance is worth its cost |

### c) "Different analysis methods for guiding? If not, which one?"

**What we changed:** we named it. The guided strategy uses the **interval
analysis**, and that it is also one of the analyzers under test is listed
under threats to validity.

**Why interval:**

- A guide is only useful if it *rules sites out*. Sign analysis is too coarse:
  almost everything looks uncertain to it, so guided selection would behave
  like random.
- We build the interval domain anyway as one of the analyzers under test, so
  using it as the guide costs nothing extra.

**Why we don't compare several guides:** it would add another experiment
dimension, and we don't have time for it in four weeks.

**If he asks about bias** (interval guidance may suit the interval analyzer
best):

> Yes, that's why it's listed as a threat to validity. Inconsistencies are
> always measured within one analyzer, so results are reported per analyzer,
> and the comparison with the two sign analyzers shows whether the guidance
> helps beyond the analyzer it comes from.

### Changes made so Evaluation matches Innovation

- Random selection is defined here as uniform over all eligible sites.
- Same benchmark-wide budget *N* as in Innovation.
- "Valid variants" are defined: they compile and pass the synthesized tests.
- The syntax-based baseline is now "close to a division or assertion". The old
  "near branches" made no sense, because every site is already a branch.

---

## 4. Plan (no new feedback; updated for consistency)

| Change | Reason |
|---|---|
| M3 now includes "rewrites checked with synthesized test inputs"; $S_3$ owns test synthesis | NTS needed a place in the schedule |
| Experiments moved to **18–27 Nov** in the Gantt chart | The old bar ended on the same day as the benchmark they need, and disagreed with M4 in the text |
| Fallback: sign analysis with narrowing as a temporary guide if the interval domain is late | The guided strategy and the interval domain are both due at M2 |
| $S_4$ owns the syntax-based baseline | It's syntactic analysis, so it fits $S_4$'s ISY share |
| Gantt "today" moved to 21 Oct | Group's choice |

---

## Likely follow-up questions

**"What if M1 shows no inconsistencies at all?"**

> Then the narrowing hypothesis fails for that rewrite and we replace the
> rewrite before M2. That's why first narrowing is already in M1.

**"Why should a narrowing analyzer be inconsistent?"**

> Narrowing makes precision depend on where branches merge. A rewrite that
> moves the merge point can lose the narrowed information in one version but
> not the other. Our current sign analyzer doesn't narrow, so it warns on both
> versions of `f` and shows nothing. That's why candidate sites require the
> rewrite to change a feature the analyzer's precision depends on.

**"Is the interval domain realistic in time?"**

> `Interval` in our code is currently a stub. It's scheduled for M2, starting
> before M1 ends, and the sign-with-narrowing fallback keeps the guided
> strategy moving if it's late.

**"What counts as one distinct inconsistency?"** (not in the text yet, so have
an answer ready)

> A unique combination of method, rewrite rule and changed outcome set, so
> that one weakness found many times counts once.

---

## Points that are still open, in case he asks

- Gap still cites only the two DTU papers. Outside references would be needed
  for 4/4, and they still have to be checked.
- The interval domain has no contribution row of its own.
- The redesigned Gantt chart hasn't been applied yet.
