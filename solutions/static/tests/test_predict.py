"""`static.predict` (used by the step 8 experiments) gives the same outcome
sets as the analyzer programs scored by `jpamb analyse` in step 7."""

import re
from pathlib import Path

import pytest
from static import ANALYZERS, predict

import jpamb
from jpamb import jvm
from jpamb.utils import Effect

ROOT = Path(__file__).resolve().parents[3]
RESULT = re.compile(
    r':"([^"]+)" \(\(analysis-result\s+:response \(response\s+'
    r":predictions \((.*?)\)",
    re.DOTALL,
)
LINE = re.compile(r':(\*|"[^"]+"|\w+) (\w+)')


def reported(analyzer: str) -> dict[str, set[str]]:
    text = (ROOT / "project/step7" / analyzer / "report.sexp").read_text()
    out = {}
    for method, block in RESULT.findall(text):
        out[method] = {
            q.strip('"') for q, a in LINE.findall(block) if a.endswith("yes")
        }
    return out


@pytest.mark.parametrize("analyzer", sorted(ANALYZERS))
def test_predict_matches_step7_report(analyzer):
    bc = jpamb.Bytecode(jpamb.Suite.from_workdir(ROOT), Effect(None), {})
    narrow, domain = ANALYZERS[analyzer]
    expected = reported(analyzer)
    assert len(expected) == 160
    for method, outcomes in expected.items():
        got = predict(bc, jvm.AbsMethodID.decode(method), narrow, domain)
        assert got == outcomes, method
