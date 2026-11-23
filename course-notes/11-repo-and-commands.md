# 02: Repo Map and Commands

## Where things are

```
jpamb/
├── cases/jpamb/cases/*.java      ← the benchmark: Java methods + @Case annotations (the "truth")
├── target/
│   ├── stats/cases.txt           ← every case, one per line (generated)
│   └── decompiled/**/*.json      ← bytecode as JSON — what your analyzers actually read
├── src/                          ← the jpamb harness/library (you USE this, rarely edit it)
│   ├── cli.py                    ← the `jpamb` command
│   ├── jpamb/                    ← scoring, case parsing, helpers (getmethodid, printinfo...)
│   └── jvm/                      ← JVM model: opcode.py (one class per instruction), state.py, base.py
├── solutions/                    ← YOUR code (each is a small Python package)
│   ├── syntactic/                ← Assignment 1
│   ├── dynamic/                  ← Assignment 2 (interpreter + fuzzer)
│   └── static/                   ← Assignment 4 + project work (sign / interval analysis)
│       ├── src/abstractions.py   ← lattices: SignSet (done), Interval (stub)
│       ├── src/static.py         ← abstract interpreter (manystep = abstract step function)
│       └── tests/                ← property tests for the lattices (hypothesis)
├── docs/                         ← official docs: rules.md (scoring!), python.md, interpret.md
├── assignment-guide/             ← study notes per lecture/assignment
├── proposal/                     ← group project proposal (LaTeX + explanations)
└── course-notes/                 ← you are here
```

Also outside the repo, next to the `jpamb/` folder: `lectures/`, which holds your own lecture note and quiz screenshots.

## Commands you'll actually use

All from the repo root.

```bash
# Is everything set up?
uv run jpamb checkhealth

# See the bytecode of one method (use this a lot to understand cases)
uv run jpamb inspect "jpamb.cases.Simple.divideByZero:()I"

# Run tests of the harness
uv run pytest
```

### Running your own solutions

The solutions are separate packages. The simplest way is to run them from their own folder:

```bash
cd solutions/static
uv run pytest                                   # lattice property tests
uv run static-analysis "jpamb.cases.Simple.divideByN:(I)I"   # one method, prints predictions
cd ../..
```

To score them through `jpamb`, use the shared venv (once, from `docs/python.md`):

```bash
uv venv --no-project --clear --prompt jpamb-eval .jpamb-eval
source .jpamb-eval/bin/activate
uv pip install --editable .
uv pip install --editable solutions/*
```

Then:

```bash
jpamb analyse static-analysis                         # score the static analyzer
jpamb analyse --report report.sexp static-analysis    # same, and write the report to upload
jpamb interpret --abstract static-interpreter         # check abstract interpreter covers all program points
jpamb analyse dynamic-analysis                        # the fuzzer
jpamb analyse syntactic-bytecode                      # the syntactic analyzer
```

(Run `jpamb analyse --help` to confirm exact flags. Reports are always named `report.sexp`.)

### Rebuilding the benchmark (only if you change `cases/`)

```bash
uv run jpamb build     # needs Docker or Podman
```

The project plans to add new JPAMB cases (milestone M3), so this is how they get compiled.

## How an analyzer talks to jpamb

```
$ static-analysis jpamb.cases.Simple.divideByN:(I)I
ok;yes
divide by zero;yes
assertion error;no
out of bounds;no
null pointer;no
*;no
```

- One `outcome;prediction` line per outcome on **stdout**. Use stderr for debugging.
- A prediction can be a wager (`5`, `-10`), a percentage (`75%`), or a category (`yes`/`no`). Categories are easiest: jpamb picks the best bet for each group. Details: `docs/rules.md`.
- Called with `info`, it prints 5 lines: name, version, group, tags, system.
