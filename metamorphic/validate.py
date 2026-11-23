"""Validate rewrites: run original and variant on the same inputs and compare outcomes.

usage: python3 -I validate.py <cases_root> <workdir> [--controls] [--only File.java]
  <cases_root> contains jpamb/cases/*.java and jpamb/utils/*.java
"""
import argparse, itertools, os, subprocess, sys, shutil, concurrent.futures as cf
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import sites as S
import rewrites as R

HERE = os.path.dirname(os.path.abspath(__file__))
BASE = [-2, -1, 0, 1, 2]


def sh(cmd, **kw):
    return subprocess.run(cmd, capture_output=True, text=True, **kw)


def javac(out, cp, files):
    os.makedirs(out, exist_ok=True)
    return sh(["javac", "-nowarn", "-cp", cp, "-d", out] + files)


def inputs_for(info, consts):
    vals = set(BASE)
    for c in consts:
        vals.update({c - 1, c, c + 1})
    vals = sorted(vals)
    out = [list(t) for t in itertools.product(vals, repeat=info.arity)]
    for c in info.case_inputs:
        if len(c) == info.arity and c not in out:
            out.append(c)
    return out


def run(cp, cls, method, ins):
    stdin = "\n".join(" ".join(map(str, i)) for i in ins) + "\n"
    r = sh(["java", "-ea", "-cp", cp, "Runner", f"jpamb.cases.{cls}", method], input=stdin)
    return r.stdout.strip().splitlines()


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("root"); ap.add_argument("work")
    ap.add_argument("--controls", action="store_true")
    ap.add_argument("--only")
    a = ap.parse_args()
    root, work = os.path.abspath(a.root), os.path.abspath(a.work)
    shutil.rmtree(work, ignore_errors=True)
    cases = f"{root}/jpamb/cases"
    files = sorted(f for f in os.listdir(cases) if f.endswith(".java"))
    if a.only:
        files = [f for f in files if f == a.only]

    # 1. originals + runner
    orig, runner = f"{work}/orig", f"{work}/runner"
    allsrc = [f"{cases}/{f}" for f in os.listdir(cases) if f.endswith(".java")]
    allsrc += [f"{root}/jpamb/utils/{f}" for f in os.listdir(f"{root}/jpamb/utils") if f.endswith(".java")]
    r = javac(orig, ".", allsrc)
    if r.returncode:
        sys.exit("original does not compile:\n" + r.stderr)
    javac(runner, ".", [f"{HERE}/Runner.java"])

    rules = dict(R.REWRITES)
    if a.controls:
        rules.update(R.CONTROLS)

    # 2. jobs = (site, rewrite) pairs
    jobs, infos = [], {}
    for f in files:
        src, sites, ins = S.scan(f"{cases}/{f}")
        for i in ins:
            infos[(i.cls, i.name)] = i
        for s in sites:
            for name, fn in rules.items():
                new = fn(s)
                if new is not None:
                    jobs.append((f, src, s, name, new))
    print(f"{len({(j[2].cls, j[2].method, j[2].line) for j in jobs})} sites, {len(jobs)} variants to check\n")

    consts = {}
    for _, _, s, _, _ in jobs:
        consts.setdefault((s.cls, s.method), set()).add(s.const)
    orig_cache = {}

    def original_result(key):
        if key not in orig_cache:
            ins = inputs_for(infos[key], consts[key])
            orig_cache[key] = (ins, run(os.pathsep.join([orig, runner]), key[0], key[1], ins))
        return orig_cache[key]

    for key in consts:  # fill cache serially (thread-safe)
        if infos[key].all_int and infos[key].arity <= 3:
            original_result(key)

    def check(idx_job):
        idx, (f, src, s, name, new) = idx_job
        key = (s.cls, s.method)
        if key not in orig_cache:
            return idx, "skipped (non-int params / arity>3)", 0
        vdir = f"{work}/v{idx}"
        os.makedirs(f"{vdir}/src/jpamb/cases", exist_ok=True)
        vsrc = f"{vdir}/src/jpamb/cases/{f}"
        open(vsrc, "wb").write(R.apply(src, s, new))
        r = javac(f"{vdir}/out", orig, [vsrc])
        if r.returncode:
            return idx, "COMPILE-ERROR", 0
        ins, want = orig_cache[key]
        got = run(os.pathsep.join([f"{vdir}/out", orig, runner]), key[0], key[1], ins)
        diff = [(w, g) for w, g in zip(want, got) if w != g]
        if len(got) != len(want):
            return idx, "INVALID (runner failed)", len(ins)
        return idx, ("valid" if not diff else f"INVALID e.g. {diff[0][0]}  vs  {diff[0][1].split('=> ')[1]}"), len(ins)

    results = {}
    with cf.ThreadPoolExecutor(8) as ex:
        for idx, status, n in ex.map(check, enumerate(jobs)):
            results[idx] = (status, n)

    tally = {}
    for idx, (f, src, s, name, new) in enumerate(jobs):
        status, n = results[idx]
        kind = status.split(" ")[0]
        tally[kind] = tally.get(kind, 0) + 1
        print(f"{f}:{s.line:<4} {s.method:<22} {name:<14} `{s.var} {s.op} {s.const_text}` -> `{new}`  [{n} inputs] {status}")
    print("\nSUMMARY:", tally)


main()