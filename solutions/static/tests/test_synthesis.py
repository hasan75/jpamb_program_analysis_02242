import jpamb
import pytest
import shutil
from jpamb.utils import DockerRunner
from pathlib import Path
from jpamb.utils import Effect
from jvm.state import PC
from abstractions import Interval
from synthesis import (
    branch_condition,
    check_rewrite_equivalence,
    get_ifz_branch_conditions,
    representative_values,
    representative_values_for_condition,
    synthesize_integer_inputs,
    filter_values_by_condition,
    synthesize_ifz_branch_inputs,
    synthesize_inputs_for_ifz,
    is_parameter_unmodified,
)

def compile_rewrite_variants(tmp_path, original_condition, rewritten_condition):
    project_root = Path(__file__).resolve().parents[3]
    runtime_classes = project_root / "target" / "classes"

    if not runtime_classes.exists():
        pytest.skip("JPAMB runtime classes are not built")

    eff = Effect(None)
    docker = DockerRunner.create(
        tmp_path,
        "ghcr.io/kalhauge/jvm2json:jdk-latest",
        eff,
    )

    folders = []

    for name, condition in (
        ("original", original_condition),
        ("rewritten", rewritten_condition),
    ):
        class_folder = tmp_path / name / "classes"
        source_folder = tmp_path / name / "src" / "jpamb" / "cases"

        class_folder.parent.mkdir(parents=True)
        source_folder.mkdir(parents=True)

        shutil.copytree(runtime_classes, class_folder, dirs_exist_ok=True)

        source_file = source_folder / "RewriteTest.java"
        source_file.write_text(
            f"""
package jpamb.cases;

public class RewriteTest {{
    public static void assertPositive(int n) {{
        assert {condition};
    }}
}}
""".strip(),
            encoding="utf-8",
        )

        docker.run(
            [
                "javac",
                "-g",
                "-d",
                class_folder.relative_to(tmp_path).as_posix(),
                source_file.relative_to(tmp_path).as_posix(),
            ],
            timeout=60,
            eff=eff,
        )

        folders.append(class_folder)

    return docker, folders[0], folders[1], eff

def make_ifz_bytecode(condition):
    methodid = jpamb.jvm.AbsMethodID.decode("Test.method:()V")

    opcodes = [
        jpamb.jvm.Load(type=jpamb.jvm.Int(), index=0, offset=0),
        jpamb.jvm.Ifz(condition=condition, target=3, offset=1),
    ]

    method = jpamb.jvm.Method(methodid, opcodes, 1)

    bc = jpamb.Bytecode(
        jpamb.Suite(Path.cwd()),
        Effect(None),
        {methodid: method},
    )

    return bc, PC(methodid, 1)

def test_get_ifz_branch_conditions():
    bc, pc = make_ifz_bytecode(jpamb.jvm.CmpOpr.Gt)

    result = get_ifz_branch_conditions(bc, pc)

    assert result == (0, "gt", PC(pc.method, 3), "le")

def test_representative_values_bounded_interval():
    result = representative_values(Interval(2, 5))

    assert result == (2, 3, 4, 5)


def test_representative_values_single_value():
    result = representative_values(Interval(4, 4))

    assert result == (4,)


def test_representative_values_interval_containing_zero():
    result = representative_values(Interval(-2, 2))

    assert result == (-2, -1, 0, 1, 2)


def test_representative_values_bottom():
    result = representative_values(Interval(1, 0))

    assert result == ()


def test_representative_values_unbounded_interval():
    result = representative_values(Interval(None, None))

    assert result == (
        -(1 << 31),
        -(1 << 31) + 1,
        -1,
        0,
        1,
        (1 << 31) - 2,
        (1 << 31) - 1,
    )

def test_synthesize_integer_inputs():
    intervals = (Interval(1, 2), Interval(5, 6))

    inputs = synthesize_integer_inputs(intervals)

    values = tuple(
        tuple(value.value for value in input.values)
        for input in inputs
    )

    assert values == (
        (1, 5),
        (1, 6),
        (2, 5),
        (2, 6),
    )


def test_synthesize_integer_inputs_bottom():
    intervals = (Interval(1, 2), Interval(1, 0))

    assert synthesize_integer_inputs(intervals) == ()


def test_synthesize_integer_inputs_no_parameters():
    assert synthesize_integer_inputs(()) == (jpamb.case.Input(()),)

def test_check_rewrite_equivalence_same_results(monkeypatch):
    results = iter(["ok", "ok", "assertion error", "assertion error"])

    def fake_execute_input(*args, **kwargs):
        return next(results)

    monkeypatch.setattr("synthesis.execute_input", fake_execute_input)

    inputs = (
        jpamb.case.Input((jpamb.case.Int(1),)),
        jpamb.case.Input((jpamb.case.Int(-1),)),
    )

    assert check_rewrite_equivalence(
        None, None, None, None, None, inputs, None
    )


def test_check_rewrite_equivalence_different_results(monkeypatch):
    results = iter(["ok", "assertion error"])

    def fake_execute_input(*args, **kwargs):
        return next(results)

    monkeypatch.setattr("synthesis.execute_input", fake_execute_input)

    inputs = (jpamb.case.Input((jpamb.case.Int(1),)),)

    assert not check_rewrite_equivalence(
        None, None, None, None, None, inputs, None
    )


def test_check_rewrite_equivalence_timeout(monkeypatch):
    results = iter(["*", "*"])

    def fake_execute_input(*args, **kwargs):
        return next(results)

    monkeypatch.setattr("synthesis.execute_input", fake_execute_input)

    inputs = (jpamb.case.Input((jpamb.case.Int(1),)),)

    assert not check_rewrite_equivalence(
        None, None, None, None, None, inputs, None
    )


def test_check_rewrite_equivalence_no_inputs():
    assert not check_rewrite_equivalence(
        None, None, None, None, None, (), None
    )

def test_filter_values_by_condition():
    values = (-2, -1, 0, 1, 2)

    assert filter_values_by_condition(values, "eq") == (0,)
    assert filter_values_by_condition(values, "ne") == (-2, -1, 1, 2)
    assert filter_values_by_condition(values, "lt") == (-2, -1)
    assert filter_values_by_condition(values, "le") == (-2, -1, 0)
    assert filter_values_by_condition(values, "gt") == (1, 2)
    assert filter_values_by_condition(values, "ge") == (0, 1, 2)


def test_filter_values_by_condition_empty():
    assert filter_values_by_condition((), "ne") == ()


def test_filter_values_by_condition_invalid():
    import pytest

    with pytest.raises(ValueError):
        filter_values_by_condition((0, 1), "invalid")

def test_representative_values_for_not_equal_zero():
    values = representative_values_for_condition(Interval.top(), "ne")

    assert values
    assert 0 not in values
    assert -1 in values
    assert 1 in values

@pytest.mark.parametrize(
    "condition, expected",
    [
        (jpamb.jvm.CmpOpr.Eq, "eq"),
        (jpamb.jvm.CmpOpr.Ne, "ne"),
        (jpamb.jvm.CmpOpr.Lt, "lt"),
        (jpamb.jvm.CmpOpr.Le, "le"),
        (jpamb.jvm.CmpOpr.Gt, "gt"),
        (jpamb.jvm.CmpOpr.Ge, "ge"),
    ],
)
def test_branch_condition_taken(condition, expected):
    assert branch_condition(condition, True) == expected

@pytest.mark.parametrize(
    "condition, expected",
    [
        (jpamb.jvm.CmpOpr.Eq, "ne"),
        (jpamb.jvm.CmpOpr.Ne, "eq"),
        (jpamb.jvm.CmpOpr.Lt, "ge"),
        (jpamb.jvm.CmpOpr.Le, "gt"),
        (jpamb.jvm.CmpOpr.Gt, "le"),
        (jpamb.jvm.CmpOpr.Ge, "lt"),
    ],
)
def test_branch_condition_not_taken(condition, expected):
    assert branch_condition(condition, False) == expected

def test_synthesize_ifz_branch_inputs_greater_than_zero():
    inputs = synthesize_ifz_branch_inputs(
        (Interval(-2, 2),),
        0,
        "gt",
    )

    values = tuple(
        value.value
        for input in inputs
        for value in input.values
    )

    assert values == (1, 2)


def test_synthesize_ifz_branch_inputs_less_or_equal_zero():
    inputs = synthesize_ifz_branch_inputs(
        (Interval(-2, 2),),
        0,
        "le",
    )

    values = tuple(
        value.value
        for input in inputs
        for value in input.values
    )

    assert values == (-2, -1, 0)


def test_synthesize_ifz_branch_inputs_multiple_parameters():
    inputs = synthesize_ifz_branch_inputs(
        (Interval(5, 6), Interval(-2, 2)),
        1,
        "ne",
    )

    values = tuple(
        tuple(value.value for value in input.values)
        for input in inputs
    )

    assert values == (
        (5, -2),
        (5, -1),
        (5, 1),
        (5, 2),
        (6, -2),
        (6, -1),
        (6, 1),
        (6, 2),
    )


def test_synthesize_ifz_branch_inputs_invalid_index():
    with pytest.raises(IndexError):
        synthesize_ifz_branch_inputs(
            (Interval(-2, 2),),
            1,
            "gt",
        )


def test_synthesize_ifz_branch_inputs_bottom():
    assert synthesize_ifz_branch_inputs(
        (Interval(1, 0),),
        0,
        "gt",
    ) == ()

def test_synthesize_inputs_for_ifz():
    suite, eff = jpamb.setup()

    methodid = jpamb.jvm.AbsMethodID.decode(
        "jpamb.cases.Simple.assertPositive:(I)V"
    )

    bc = jpamb.Bytecode(suite, eff, {})
    bc.getmethod(methodid)

    true_inputs, false_inputs = synthesize_inputs_for_ifz(
        bc,
        methodid,
        PC(methodid, 3),
    )

    true_values = {
        test_input.values[0].value
        for test_input in true_inputs
    }

    false_values = {
        test_input.values[0].value
        for test_input in false_inputs
    }

    assert true_values
    assert false_values

    assert all(value > 0 for value in true_values)
    assert all(value <= 0 for value in false_values)

def test_parameter_unmodified():
    bc, pc = make_ifz_bytecode(jpamb.jvm.CmpOpr.Gt)
    method = bc.getmethod(pc.method)

    assert is_parameter_unmodified(method, 0, pc)


def test_parameter_modified_before_ifz():
    methodid = jpamb.jvm.AbsMethodID.decode("Test.method:(I)V")

    opcodes = [
        jpamb.jvm.Push(type=jpamb.jvm.Int(), value=1, offset=0),
        jpamb.jvm.Store(type=jpamb.jvm.Int(), index=0, offset=1),
        jpamb.jvm.Load(type=jpamb.jvm.Int(), index=0, offset=2),
        jpamb.jvm.Ifz(condition=jpamb.jvm.CmpOpr.Gt, target=4, offset=3),
    ]

    method = jpamb.jvm.Method(methodid, opcodes, 1)
    pc = PC(methodid, 3)

    assert not is_parameter_unmodified(method, 0, pc)

def test_synthesize_inputs_for_ifz_rejects_modified_parameter():
    methodid = jpamb.jvm.AbsMethodID.decode("Test.method:(I)V")

    opcodes = [
        jpamb.jvm.Push(type=jpamb.jvm.Int(), value=1, offset=0),
        jpamb.jvm.Store(type=jpamb.jvm.Int(), index=0, offset=1),
        jpamb.jvm.Load(type=jpamb.jvm.Int(), index=0, offset=2),
        jpamb.jvm.Ifz(condition=jpamb.jvm.CmpOpr.Gt, target=4, offset=3),
        jpamb.jvm.Return(type=None, offset=4),
    ]

    method = jpamb.jvm.Method(methodid, opcodes, 1)

    bc = jpamb.Bytecode(
        jpamb.Suite(Path.cwd()),
        Effect(None),
        {methodid: method},
    )

    true_inputs, false_inputs = synthesize_inputs_for_ifz(
        bc,
        methodid,
        PC(methodid, 3),
    )

    assert true_inputs == ()
    assert false_inputs == ()

def test_synthesize_inputs_for_ifz_rejects_non_integer_parameters():
    methodid = jpamb.jvm.AbsMethodID.decode("Test.method:(J)V")

    opcodes = [
        jpamb.jvm.Load(type=jpamb.jvm.Long(), index=0, offset=0),
        jpamb.jvm.Ifz(condition=jpamb.jvm.CmpOpr.Gt, target=2, offset=1),
        jpamb.jvm.Return(type=None, offset=2),
    ]

    method = jpamb.jvm.Method(methodid, opcodes, 2)

    bc = jpamb.Bytecode(
        jpamb.Suite(Path.cwd()),
        Effect(None),
        {methodid: method},
    )

    true_inputs, false_inputs = synthesize_inputs_for_ifz(
        bc,
        methodid,
        PC(methodid, 1),
    )

    assert true_inputs == ()
    assert false_inputs == ()

def test_check_rewrite_equivalence_real_equivalent_rewrite(tmp_path):
    docker, original_folder, rewritten_folder, eff = (
        compile_rewrite_variants(
            tmp_path,
            "n > 0",
            "n >= 1",
        )
    )

    methodid = jpamb.jvm.AbsMethodID.decode(
        "jpamb.cases.RewriteTest.assertPositive:(I)V"
    )

    inputs = tuple(
        jpamb.case.Input((jpamb.case.Int(value),))
        for value in (-1, 0, 1)
    )

    assert check_rewrite_equivalence(
        docker,
        tmp_path,
        original_folder,
        rewritten_folder,
        methodid,
        inputs,
        eff,
    )


def test_check_rewrite_equivalence_real_different_rewrite(tmp_path):
    docker, original_folder, rewritten_folder, eff = (
        compile_rewrite_variants(
            tmp_path,
            "n > 0",
            "n >= 0",
        )
    )

    methodid = jpamb.jvm.AbsMethodID.decode(
        "jpamb.cases.RewriteTest.assertPositive:(I)V"
    )

    inputs = tuple(
        jpamb.case.Input((jpamb.case.Int(value),))
        for value in (-1, 0, 1)
    )

    assert not check_rewrite_equivalence(
        docker,
        tmp_path,
        original_folder,
        rewritten_folder,
        methodid,
        inputs,
        eff,
    )