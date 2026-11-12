from pathlib import Path
import sys
import subprocess
import shutil
import pytest
import tree_sitter
import tree_sitter_java
import jpamb

sys.path.insert(
    0,
    str(Path(__file__).resolve().parents[1] / "src"),
)

from validation import validate_rewrite_variants
from rewriting import (
    find_integer_variables,
    find_integer_variables_for_site,
    find_rewrite_sites,
    invert_comparison,
    invert_if_comparison,
    is_integer_operand,
    is_safe_comparison,
)

def test_find_rewrite_sites():
    source = b"""
    class Example {
        void test(int x) {
            if (x < 10) {}
            while (x >= 0) {}
        }
    }
    """

    sites = find_rewrite_sites(source)

    assert len(sites) == 2
    assert sites[0].kind == "if_statement"
    assert sites[0].operator == "<"
    assert sites[1].kind == "while_statement"
    assert sites[1].operator == ">="

@pytest.mark.parametrize(
    ("operator", "expected"),
    [
        ("<", ">="),
        ("<=", ">"),
        (">", "<="),
        (">=", "<"),
        ("==", "!="),
        ("!=", "=="),
    ],
)
def test_invert_comparison(operator, expected):
    source = f"if (x {operator} y) {{}}".encode()
    sites = find_rewrite_sites(source)

    rewritten = invert_comparison(source, sites[0])

    assert rewritten == f"if (x {expected} y) {{}}".encode()

def test_invert_if_comparison_swaps_branches():
    source = b"""
    class Example {
        int test(int x) {
            if (x >= 10) {
                return 1;
            } else {
                return 2;
            }
        }
    }
    """

    site = find_rewrite_sites(source)[0]
    rewritten = invert_if_comparison(source, site, {"x"})

    assert b"if (x < 10)" in rewritten
    assert rewritten.index(b"return 2") < rewritten.index(b"return 1")

def test_invert_if_without_else():
    source = b"""
    class Example {
        void test(int x) {
            if (x > 0) {
                x++;
            }
        }
    }
    """

    site = find_rewrite_sites(source)[0]
    rewritten = invert_if_comparison(source, site, {"x"})

    assert b"if (x <= 0)" in rewritten
    assert b"else" in rewritten
    assert rewritten.index(b"x++;") > rewritten.index(b"else")

def test_invert_while_rejected():
    source = b"class Example { void test(int x) { while (x > 0) {} } }"
    site = find_rewrite_sites(source)[0]

    with pytest.raises(ValueError):
        invert_if_comparison(source, site)

def test_invert_if_comparison_preserves_java_behavior(tmp_path):
    source = b"""
    public class RewriteEquivalence {
        public static int test(int x) {
            if (x >= 10) {
                return 1;
            } else {
                return 2;
            }
        }

        public static void main(String[] args) {
            for (String arg : args) {
                System.out.println(test(Integer.parseInt(arg)));
            }
        }
    }
    """

    site = find_rewrite_sites(source)[0]
    rewritten = invert_if_comparison(source, site)

    original_dir = tmp_path / "original"
    rewritten_dir = tmp_path / "rewritten"

    original_dir.mkdir()
    rewritten_dir.mkdir()

    (original_dir / "RewriteEquivalence.java").write_bytes(source)
    (rewritten_dir / "RewriteEquivalence.java").write_bytes(rewritten)

    for directory in (original_dir, rewritten_dir):
        subprocess.run(
            ["javac", "RewriteEquivalence.java"],
            cwd=directory,
            check=True,
            capture_output=True,
            text=True,
        )

    inputs = ["-2147483648", "-1", "0", "9", "10", "11", "2147483647"]

    results = []

    for directory in (original_dir, rewritten_dir):
        result = subprocess.run(
            ["java", "-cp", str(directory), "RewriteEquivalence", *inputs],
            check=True,
            capture_output=True,
            text=True,
        )
        results.append(result.stdout)

    assert results[0] == results[1]

def test_invert_if_without_else_preserves_java_behavior(tmp_path):
    source = b"""
    public class RewriteEquivalence {
        public static int test(int x) {
            if (x > 0) {
                x++;
            }
            return x;
        }

        public static void main(String[] args) {
            for (String arg : args) {
                System.out.println(test(Integer.parseInt(arg)));
            }
        }
    }
    """

    site = find_rewrite_sites(source)[0]
    rewritten = invert_if_comparison(source, site)

    original_dir = tmp_path / "original"
    rewritten_dir = tmp_path / "rewritten"

    original_dir.mkdir()
    rewritten_dir.mkdir()

    (original_dir / "RewriteEquivalence.java").write_bytes(source)
    (rewritten_dir / "RewriteEquivalence.java").write_bytes(rewritten)

    for directory in (original_dir, rewritten_dir):
        subprocess.run(
            ["javac", "RewriteEquivalence.java"],
            cwd=directory,
            check=True,
            capture_output=True,
            text=True,
        )

    inputs = ["-2147483648", "-1", "0", "1", "10", "2147483647"]

    results = []

    for directory in (original_dir, rewritten_dir):
        result = subprocess.run(
            ["java", "-cp", str(directory), "RewriteEquivalence", *inputs],
            check=True,
            capture_output=True,
            text=True,
        )
        results.append(result.stdout)

    assert results[0] == results[1]

def test_find_integer_variables():
    source = b"""
    class Example {
        int test(int x, long y, double z) {
            int a = 10;
            boolean flag = true;
            char letter = 'A';

            if (x > a) {
                short b = 5;
            }

            return 0;
        }
    }
    """

    parser = tree_sitter.Parser(
        tree_sitter.Language(tree_sitter_java.language())
    )
    tree = parser.parse(source)

    method = tree.root_node.named_children[0].child_by_field_name("body")
    method = method.named_children[0]

    variables = find_integer_variables(method)

    assert variables == {"x", "y", "a", "letter", "b"}

@pytest.mark.parametrize(
    ("expression", "expected"),
    [
        ("x", True),
        ("count", True),
        ("0", True),
        ("123", True),
        ("-5", False),
        ("0x10", True),
        ("0b101", True),
        ("3.14", False),
        ("true", False),
        ("x + 1", False),
        ("calculate()", False),
    ],
)
def test_is_integer_operand(expression, expected):
    integer_variables = {"x", "count"}

    assert is_integer_operand(expression, integer_variables) == expected

def test_is_safe_comparison_accepts_integer_operands():
    source = b"""
    class Example {
        void test(int x) {
            if (x > 0) {}
        }
    }
    """

    site = find_rewrite_sites(source)[0]

    assert is_safe_comparison(site, {"x"})

@pytest.mark.parametrize(
    ("condition", "integer_variables"),
    [
        ("x > 0.5", {"x"}),
        ("x > y", {"x"}),
        ("x + 1 > 0", {"x"}),
    ],
)
def test_is_safe_comparison_rejects_unsupported_operands(
    condition, integer_variables
):
    source = f"""
    class Example {{
        void test(int x) {{
            if ({condition}) {{}}
        }}
    }}
    """.encode()

    site = find_rewrite_sites(source)[0]

    assert not is_safe_comparison(site, integer_variables)

def test_invert_if_comparison_rejects_unknown_variables():
    source = b"""
    class Example {
        void test(int x, double y) {
            if (x > y) {
                System.out.println(x);
            }
        }
    }
    """

    site = find_rewrite_sites(source)[0]

    rewritten = invert_if_comparison(source, site, {"x"})

    assert rewritten == source

def test_invert_if_comparison_rejects_missing_type_information():
    source = b"""
    class Example {
        void test(double x) {
            if (x > 0.0) {
                System.out.println(x);
            }
        }
    }
    """

    site = find_rewrite_sites(source)[0]

    rewritten = invert_if_comparison(source, site)

    assert rewritten == source

def test_find_integer_variables_for_site():
    source = b"""
    class Example {
        void first(int x, double y) {
            if (x > 0) {}
        }

        void second(double a, long b) {
            if (b > 10) {}
        }
    }
    """

    sites = find_rewrite_sites(source)

    first_variables = find_integer_variables_for_site(source, sites[0])
    second_variables = find_integer_variables_for_site(source, sites[1])

    assert first_variables == {"x"}
    assert second_variables == {"b"}

def test_find_integer_variables_for_site_without_method():
    source = b"""
    class Example {
        int x = 10;
        {
            if (x > 0) {}
        }
    }
    """

    sites = find_rewrite_sites(source)

    assert sites
    assert find_integer_variables_for_site(source, sites[0]) == set()

def test_find_integer_variables_for_site_respects_block_scope():
    source = b"""
    class Example {
        void test(int x) {
            if (x > 0) {
                int count = 10;
            }

            if (x > 1) {
                System.out.println(x);
            }
        }
    }
    """

    sites = find_rewrite_sites(source)

    variables = find_integer_variables_for_site(source, sites[1])

    assert variables == {"x"}

def test_find_integer_variables_for_site_ignores_later_declarations():
    source = b"""
    class Example {
        void test(int x) {
            if (x > 0) {
                System.out.println(x);
            }

            int count = 10;
        }
    }
    """

    sites = find_rewrite_sites(source)

    variables = find_integer_variables_for_site(source, sites[0])

    assert variables == {"x"}

def test_find_integer_variables_for_site_includes_outer_scope():
    source = b"""
    class Example {
        void test() {
            int count = 10;

            if (count > 0) {
                System.out.println(count);
            }
        }
    }
    """

    sites = find_rewrite_sites(source)

    variables = find_integer_variables_for_site(source, sites[0])

    assert variables == {"count"}

def test_find_integer_variables_for_site_includes_method_scope_in_nested_block():
    source = b"""
    class Example {
        void test() {
            int count = 10;

            if (true) {
                if (count > 0) {
                    System.out.println(count);
                }
            }
        }
    }
    """

    sites = find_rewrite_sites(source)

    variables = find_integer_variables_for_site(source, sites[0])

    assert variables == {"count"}

def test_find_integer_variables_for_site_respects_for_scope():
    source = b"""
    class Example {
        void test() {
            for (int i = 0; i < 10; i++) {
                if (i > 5) {
                    System.out.println(i);
                }
            }

            if (i > 0) {}
        }
    }
    """

    sites = find_rewrite_sites(source)

    variables_inside = find_integer_variables_for_site(source, sites[1])
    variables_outside = find_integer_variables_for_site(source, sites[2])

    assert variables_inside == {"i"}
    assert variables_outside == set()

def test_find_rewrite_sites_includes_for_condition():
    source = b"""
    class Example {
        void test(int n) {
            for (int i = 0; i < n; i++) {
                System.out.println(i);
            }
        }
    }
    """

    sites = find_rewrite_sites(source)

    assert len(sites) == 1
    assert sites[0].kind == "for_statement"
    assert sites[0].operator == "<"
    assert sites[0].left_expression == "i"
    assert sites[0].right_expression == "n"

def test_find_integer_variables_for_site_includes_for_initializer():
    source = b"""
    class Example {
        void test(int n) {
            for (int i = 0; i < n; i++) {
                System.out.println(i);
            }
        }
    }
    """

    sites = find_rewrite_sites(source)

    variables = find_integer_variables_for_site(source, sites[0])

    assert variables == {"n", "i"}

def test_find_rewrite_sites_includes_do_while_condition():
    source = b"""
    class Example {
        void test(int n) {
            int i = 0;

            do {
                i++;
            } while (i < n);
        }
    }
    """

    sites = find_rewrite_sites(source)

    assert len(sites) == 1
    assert sites[0].kind == "do_statement"
    assert sites[0].operator == "<"
    assert sites[0].left_expression == "i"
    assert sites[0].right_expression == "n"

@pytest.mark.parametrize(
    "condition",
    [
        "(dst == 0)",
        "(x < 0)",
        "(y < 0)",
        "(x >= y)",
    ],
)
def test_normalized_distance_rewrite_preserves_behavior(tmp_path, condition):
    project_root = Path(__file__).resolve().parents[3]
    source_path = project_root / "cases" / "jpamb" / "cases" / "Dependent.java"
    case_path = project_root / "cases" / "jpamb" / "utils" / "Case.java"
    cases_path = project_root / "cases" / "jpamb" / "utils" / "Cases.java"

    source = source_path.read_bytes()
    sites = find_rewrite_sites(source)

    site = next(
        (site for site in sites if site.condition == condition),
        None,
    )

    assert site is not None

    integer_variables = find_integer_variables_for_site(source, site)
    assert is_safe_comparison(site, integer_variables)

    rewritten = invert_if_comparison(source, site, integer_variables)
    assert rewritten != source

    original_dir = tmp_path / "original"
    rewritten_dir = tmp_path / "rewritten"

    driver = """
    package jpamb.cases;

    public class RewriteTest {
        public static void main(String[] args) {
            int x = Integer.parseInt(args[0]);
            int y = Integer.parseInt(args[1]);

            System.out.print(Dependent.normalizedDistance(x, y));
        }
    }
    """

    for directory in (original_dir, rewritten_dir):
        (directory / "jpamb" / "cases").mkdir(parents=True)
        (directory / "jpamb" / "utils").mkdir(parents=True)

        shutil.copy2(
            case_path,
            directory / "jpamb" / "utils" / "Case.java",
        )

        shutil.copy2(
            cases_path,
            directory / "jpamb" / "utils" / "Cases.java",
        )

    shutil.copy2(
        source_path,
        original_dir / "jpamb" / "cases" / "Dependent.java",
    )

    (
        rewritten_dir / "jpamb" / "cases" / "Dependent.java"
    ).write_bytes(rewritten)

    for directory in (original_dir, rewritten_dir):
        (directory / "jpamb" / "cases" / "RewriteTest.java").write_text(
            driver,
            encoding="utf-8",
        )
        result = subprocess.run(
            [
                "javac",
                "jpamb/utils/Case.java",
                "jpamb/utils/Cases.java",
                "jpamb/cases/Dependent.java",
                "jpamb/cases/RewriteTest.java",
            ],
            cwd=directory,
            capture_output=True,
            text=True,
        )

        assert result.returncode == 0, result.stderr

    test_inputs = [
        (-5, -3),
        (-3, 0),
        (0, 0),
        (1, 2),
        (2, 1),
        (-4, 2),
        (3, -6),
    ]

    for x, y in test_inputs:
        outputs = []

        for directory in (original_dir, rewritten_dir):
            result = subprocess.run(
                [
                    "java",
                    "-cp",
                    str(directory),
                    "jpamb.cases.RewriteTest",
                    str(x),
                    str(y),
                ],
                cwd=directory,
                capture_output=True,
                text=True,
            )

            assert result.returncode == 0, result.stderr
            outputs.append(result.stdout.strip())

        assert outputs[0] == outputs[1], (
            f"Different results for inputs ({x}, {y}): "
            f"{outputs[0]} != {outputs[1]}"
        )

def test_validate_rewrite_variants_detects_non_equivalent_rewrite(tmp_path):
    source_file = (
        Path.cwd()
        / "cases"
        / "jpamb"
        / "cases"
        / "RewriteTest.java"
    )

    original_source = b"""
package jpamb.cases;

public class RewriteTest {
    public static void assertPositive(int n) {
        assert n > 0;
    }
}
"""

    rewritten_source = b"""
package jpamb.cases;

public class RewriteTest {
    public static void assertPositive(int n) {
        assert n >= 0;
    }
}
"""

    inputs = tuple(
        jpamb.case.Input((jpamb.case.Int(value),))
        for value in (-1, 0, 1)
    )

    results = validate_rewrite_variants(
        source_file=source_file,
        original_source=original_source,
        variants={
            "different": rewritten_source,
        },
        methodid="jpamb.cases.RewriteTest.assertPositive:(I)V",
        inputs=inputs,
        workdir=tmp_path,
    )

    assert results == {"different": False}