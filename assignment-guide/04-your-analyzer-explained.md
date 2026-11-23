# 04 — Your Analyzer, Explained

File: `solutions/syntactic/src/syntactic_bytecode.py`
Entry point: `syntactic-bytecode` (registered in
`solutions/syntactic/pyproject.toml` under `[project.scripts]`)

This is a line-by-line tour, tying each piece back to file 2's theory and
to `docs/rules.md`'s prediction contract.

## Why bytecode, not source text or Tree-sitter?

Per file 2's "levels of syntax" ladder, bytecode is the *lowest* level —
you lose the most developer intent, but in exchange you get a
representation that:
- is already fully parsed and normalized for you (JPAMB's `jvm2json`
  pipeline, run once by `jpamb build`, produced the JSON under
  `target/decompiled/`),
- has no source-formatting fragility (comments, indentation, `static` vs.
  non-static, extra whitespace — all the robustness worries the lecture
  raises about regex — simply don't exist at this level),
- needs zero extra dependencies (unlike `syntactic_treesitter.py`, which
  needs the `tree-sitter` / `tree-sitter-java` packages).

The trade-off: you have to know **which opcode patterns correspond to which
outcome**, which is what the rest of this file documents.

## The `info` contract (lines 12–18)

```python
methodid = jpamb.getmethodid(
    "bytecoder", "1.1", "Potato Analyzer",
    ["syntactic", "python"], for_science=True,
)
```

`jpamb.getmethodid(...)` (defined in `src/jpamb.py`) is dual-purpose:
- If your program is invoked as `./program info`, it prints the 5 required
  lines (name, version, group, comma-joined tags, system-info-or-`no`) and
  exits — this is what `jpamb analyse` calls first to identify your
  analyzer.
- Otherwise, it parses `sys.argv[1]` as a method ID (e.g.
  `jpamb.cases.Simple.divideByZero:()I`) and returns it as a
  `jvm.AbsMethodID`.

This is exactly the analyzer contract described in `docs/rules.md` — you
never have to write argument-parsing code yourself.

## Loading the method's bytecode (lines 23–26)

```python
suite, eff = jpamb.setup()
m = suite.findmethod(methodid, eff=eff)
```

`jpamb.setup()` builds a `Suite` rooted at the current working directory
(must be the JPAMB repo root — this is one of the assumptions
`docs/rules.md` guarantees). `suite.findmethod(methodid, ...)` looks up the
already-decompiled JSON for that method under `target/decompiled/` and
returns a dict shaped like:

```python
{"name": "divideByZero", "params": [...], "code": {"bytecode": [...], "max_locals": ...}}
```

`m["code"]["bytecode"]` is a **list of plain dicts**, one per instruction,
each with an `"opr"` key naming the opcode. You can see this raw shape
yourself for any method:

```bash
source .jpamb-eval/bin/activate
python3 -c "
import json
d = json.load(open('target/decompiled/jpamb/cases/Simple.json'))
for m in d['methods']:
    if m['name'] == 'divideByZero':
        for op in m['code']['bytecode']:
            print(op)
"
```
which prints:
```
{'offset': 0, 'opr': 'push', 'value': {'type': 'integer', 'value': 1}}
{'offset': 1, 'opr': 'push', 'value': {'type': 'integer', 'value': 0}}
{'offset': 2, 'operant': 'div', 'opr': 'binary', 'type': 'int'}
{'offset': 3, 'opr': 'return', 'type': 'int'}
```
— note the `binary` / `operant: 'div'` instruction. That's exactly the
pattern the analyzer looks for.

(If you want the fully-typed version of this instead of raw dicts, look at
`jvm.Opcode.from_json` in `src/jvm/opcode.py` and `suite.method_opcodes(...)`
in `src/jpamb.py` — those turn each dict into a proper Python dataclass with
named fields. The current analyzer intentionally stays at the raw-dict
level to match the style of the original starter file.)

## The three real checks (lines 33–50)

```python
for inst in m["code"]["bytecode"]:
    opr = inst["opr"]

    if opr == "invoke" and inst["method"]["ref"]["name"] == "java/lang/AssertionError":
        assert_found = True
    elif opr == "binary" and inst["operant"] in ("div", "rem"):
        divzero_found = True
    elif opr in ("array_load", "array_store"):
        oob_found = True
```

Each check is a **"may" analysis** in file 1's terms: it looks for whether
the *opcode is present anywhere in the method*, not whether it's actually
reachable for some concrete input. This over-approximates on purpose — it's
allowed to have false positives (e.g. a division that's provably never by
zero would still be flagged), and that's an accepted trade-off per file 1's
"relaxed goal" and file 2's "developers tolerate false positives" finding.

1. **`assertion error`** — Java's `assert` statement compiles to exactly
   `new AssertionError(); invokespecial <init>; athrow` when it fires. The
   check looks for the `invoke` instruction whose target class is
   `java/lang/AssertionError`. This is quite precise: almost nothing else
   constructs that specific class.
2. **`divide by zero`** — a `binary` opcode with operator `div` *or* `rem`.
   Both throw `ArithmeticException` on a zero right-hand side, and JPAMB
   maps *every* `ArithmeticException` to `"divide by zero"` (see
   `cases/jpamb/utils/CaseContent.java`'s `fromThrowable`) — so `%` (modulo)
   counts too, not just `/`.
3. **`out of bounds`** — any `array_load` or `array_store` opcode (reading
   or writing an array element). These throw
   `ArrayIndexOutOfBoundsException` if the index is bad.

## Printing predictions as categories (lines 54–63)

```python
print(f"assertion error;{'assert-yes' if assert_found else 'assert-no'}")
print(f"divide by zero;{'div-yes' if divzero_found else 'div-no'}")
print(f"out of bounds;{'oob-yes' if oob_found else 'oob-no'}")
print("ok;ok-yes")

for q in jpamb.QUERIES:
    if q not in ("assertion error", "divide by zero", "out of bounds", "ok"):
        print(f"{q};skip")
```

Each printed line is `<outcome>;<category>`. As explained in file 3, using
**distinct labels per outcome** (`assert-yes`/`assert-no` rather than a bare
`yes`/`no` shared across checks) matters because `jpamb` calibrates each
category's wager from its own hit-rate across the whole suite — mixing
unrelated outcomes into one shared label dilutes the calibration.

`ok;ok-yes` is a **static default**, not a check — it's not backed by any
bytecode pattern, it's just betting that "most methods can finish normally
for *some* input" is usually true. Cheap and effective (see the "score"
column for `ok-yes` when you run `jpamb analyse` — it's one of the larger
contributors).

`null pointer` and `*` (infinite loop) fall through to `skip` — a
placeholder category meaning "no real prediction", left unimplemented on
purpose to keep this analyzer modest. See file 5 for how to add them
yourself.

## How to see your own score breakdown

```bash
source .jpamb-eval/bin/activate
jpamb analyse syntactic-bytecode
```
Scroll to the bottom `--- Categories ---` table:

```
Category    Found  Missed  Percentage  Wager  Reward  Score
assert-yes   17.0     5.0      77.27%   +1.2    0.55   3.27
div-no        0.0    31.0       0.00%   -inf    1.00    nan
oob-yes       4.0     6.0      40.00%  -0.25    0.20   0.20
ok-yes       33.0    13.0      71.74%  +0.77    0.43   4.35
skip          6.0    86.0       6.52%   -6.7    0.87  34.78
assert-no     2.0    22.0       8.33%   -5.0    0.83   8.33
oob-no        0.0    36.0       0.00%   -inf    1.00    nan
div-yes       6.0     9.0      40.00%  -0.25    0.20   0.30
```

Reading this table:
- **Found / Missed**: out of all predictions using this category, how many
  times the *actual* outcome happened ("Found") vs. didn't ("Missed"). For
  `assert-yes` (17 found / 5 missed), that's 17 methods where we correctly
  guessed "yes, this can assert-fail" and 5 where we guessed "yes" but it
  turned out it couldn't.
- **Percentage**: `Found / (Found + Missed)` — the empirical hit-rate.
- **Wager**: the mathematically optimal bet size for that hit-rate (formula
  in `docs/rules.md`) — this is computed *for you*, not something you pick.
- **Reward**: your score *per occurrence* if you're right (the flip side of
  the wager formula).
- **Score**: this category's total contribution to your overall score.

A category near 0% or 100% gets an extreme wager (`±inf` when it's *always*
right) because betting big on a sure thing is the mathematically correct
move — that's why `div-no`, `oob-no`, and `npe-no`-style all-correct
categories show `-inf`/`+inf` wagers when a check happens to be perfectly
accurate on this benchmark suite.

Next: [05 — Improve It Yourself](05-improve-it-yourself.md)
