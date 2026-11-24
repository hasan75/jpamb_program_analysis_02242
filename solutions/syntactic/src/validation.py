import io
import json
import os
import shutil
import time
import subprocess
from contextlib import redirect_stderr
from pathlib import Path
import jvm
import jpamb
from jpamb.utils import DockerRunner, Effect
from jvm.classfile import AbsMethodID
from jvm.state import PC, StackInt
from abstractions import Interval, SignSet
from static import run_analysis
from synthesis import synthesize_integer_inputs

JAVA_HOME = os.environ.get("JAVA_HOME")

if JAVA_HOME:
    JAVA = Path(JAVA_HOME) / "bin"
    JAVAC = JAVA / ("javac.exe" if os.name == "nt" else "javac")
    JAVA_EXE = JAVA / ("java.exe" if os.name == "nt" else "java")
else:
    JAVAC = shutil.which("javac") or "javac"
    JAVA_EXE = shutil.which("java") or "java"

# Execute multiple inputs in one JVM process, with an individual timeout for each execution.
BATCH_RUNNER = r"""
package jpamb;

import java.lang.reflect.*;
import java.util.concurrent.*;

import jpamb.utils.CaseContent.ResultType;
import jpamb.utils.InputParser;

public class BatchRunner {

    private static String execute(
        Method method,
        String input
    ) throws Exception {

        Object[] params = InputParser.parse(input);

        try {
            method.invoke(null, params);
            return ResultType.SUCCESS.toString();

        } catch (InvocationTargetException e) {
            return ResultType.fromThrowable(e.getCause()).toString();
        }
    }

    public static void main(String[] args) throws Exception {

        String methodId = args[0];

        java.util.regex.Pattern pattern =
            java.util.regex.Pattern.compile(
                "(.*)\\.([^.(]*):\\((.*)\\)(.*)"
            );

        java.util.regex.Matcher matcher =
            pattern.matcher(methodId);

        if (!matcher.find()) {
            throw new RuntimeException("Invalid method ID");
        }

        String className = matcher.group(1);
        String methodName = matcher.group(2);
        String signature = matcher.group(3);

        Method method = Class.forName(className).getMethod(
            methodName,
            Runtime.parseMethodSignature(signature)
        );

        for (int i = 1; i < args.length; i++) {

            final String input = args[i];

            FutureTask<String> task = new FutureTask<>(
                () -> execute(method, input)
            );

            Thread thread = new Thread(task);
            thread.setDaemon(true);
            thread.start();

            try {
                System.out.println(
                    task.get(5, TimeUnit.SECONDS)
                );

            } catch (TimeoutException e) {
                task.cancel(true);
                System.out.println("*");
            }
        }
    }
}
"""

def create_analysis_bytecode(class_folder, methodid):
    analysis_root = class_folder.parents[1]
    decompiled_folder = analysis_root / "target" / "decompiled"
    decompiled_file = decompiled_folder / Path(
        *methodid.classname.packages,
        methodid.classname.name,
    ).with_suffix(".json")

    decompiled_file.parent.mkdir(parents=True, exist_ok=True)

    eff = Effect(None)
    docker = DockerRunner.create(
        analysis_root,
        "ghcr.io/kalhauge/jvm2json:jdk-latest",
        eff,
    )

    class_file = class_folder / Path(
        *methodid.classname.packages,
        methodid.classname.name,
    ).with_suffix(".class")

    try:
        output = docker.run(
            [
                "jvm2json",
                "-s",
                class_file.relative_to(analysis_root).as_posix(),
            ],
            eff=eff,
            timeout=120,
        )
    except subprocess.CalledProcessError as error:
        print("STDOUT:", error.stdout)
        print("STDERR:", error.stderr)
        raise

    decompiled_file.write_text(
        json.dumps(json.loads(output), indent=2),
        encoding="utf-8",
    )

    suite = jpamb.Suite.from_workdir(analysis_root)
    return jpamb.Bytecode(suite, eff, {})

def synthesize_method_inputs(bc, methodid, max_steps=300):
    with redirect_stderr(io.StringIO()):
        ai, _ = run_analysis(
            bc,
            methodid,
            abstraction=Interval,
            max_steps=max_steps,
        )

    initial_pc = PC(methodid, 0)
    initial_state = ai.states.get(initial_pc)

    if initial_state is None:
        return ()

    parameter_count = len(methodid.extension.params)
    intervals = initial_state.locals[:parameter_count]

    if not all(isinstance(interval, Interval) for interval in intervals):
        return ()

    return synthesize_integer_inputs(intervals, max_abs=1000)

# Compile each source variant against the same JPAMB runtime classes.
def compile_java_source(
    workdir,
    name,
    source_file,
    source,
    runtime_classes,
    project_root,
):
    class_folder = workdir / name / "target" / "classes"

    relative_source = source_file.resolve().relative_to(project_root)
    output_source = workdir / name / "src" / relative_source

    class_folder.mkdir(parents=True)
    output_source.parent.mkdir(parents=True)

    shutil.copytree(
        runtime_classes,
        class_folder,
        dirs_exist_ok=True,
    )

    output_source.write_bytes(source)

    support_sources = [
        project_root / "cases" / "jpamb" / "utils" / "Case.java",
        project_root / "cases" / "jpamb" / "utils" / "Cases.java",
    ]

    compile_sources = [output_source]

    for path in support_sources:
        copied_source = (
            workdir / name / "src" / path.relative_to(project_root)
        )

        copied_source.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(path, copied_source)

        compile_sources.append(copied_source)

    batch_source = workdir / name / "src" / "jpamb" / "BatchRunner.java"
    batch_source.parent.mkdir(parents=True, exist_ok=True)
    batch_source.write_text(BATCH_RUNNER, encoding="utf-8")

    compile_sources.append(batch_source)

    command = [
        str(JAVAC),
        "-g",
        "-cp",
        class_folder.relative_to(workdir).as_posix(),
        "-d",
        class_folder.relative_to(workdir).as_posix(),
        *[
            path.relative_to(workdir).as_posix()
            for path in compile_sources
        ],
    ]

    subprocess.run(
        command,
        cwd=workdir,
        capture_output=True,
        text=True,
        check=True,
        timeout=180,
    )

    return class_folder

# Execute all synthesized inputs in a single JVM invocation to reduce process startup overhead.
def execute_inputs_local(
    workdir,
    classfiles_folder,
    methodid,
    inputs,
):
    if not inputs:
        return []

    command = [
        str(JAVA_EXE),
        "-cp",
        classfiles_folder.relative_to(workdir).as_posix(),
        "-ea",
        "jpamb.BatchRunner",
        methodid.encode(),
        *[test_input.encode() for test_input in inputs],
    ]

    try:
        result = subprocess.run(
            command,
            cwd=workdir,
            capture_output=True,
            text=True,
            timeout=max(120, 6 * len(inputs)),
            check=False,
        )

    except subprocess.TimeoutExpired:
        raise RuntimeError("Batch Java execution timed out")

    if result.returncode != 0:
        print("Java execution failed:")
        print("Return code:", result.returncode)
        print("STDOUT:", result.stdout)
        print("STDERR:", result.stderr)
        raise RuntimeError("Local Java execution failed")

    outputs = result.stdout.splitlines()

    if len(outputs) != len(inputs):
        raise RuntimeError(
            f"Expected {len(inputs)} results, got {len(outputs)}"
        )

    return [output.strip() for output in outputs]

def check_rewrite_equivalence_local(
    workdir,
    original_results,
    rewritten_folder,
    methodid,
    inputs,
):
    """Compare original and rewritten execution results."""

    if not inputs:
        return None

    rewritten_results = execute_inputs_local(
        workdir,
        rewritten_folder,
        methodid,
        inputs,
    )

    if len(original_results) != len(rewritten_results):
        return None

    inconclusive = False

    for original, rewritten in zip(original_results, rewritten_results):
        if original == "*" or rewritten == "*":
            inconclusive = True
            continue

        if original != rewritten:
            return False

    return None if inconclusive else True

def analyze_class_folder(class_folder, methodid, max_steps=300):
    bc = create_analysis_bytecode(class_folder, methodid)

    results = {}

    for abstraction in (Interval, SignSet):
        with redirect_stderr(io.StringIO()):
            ai, outcomes = run_analysis(
                bc,
                methodid,
                abstraction=abstraction,
                max_steps=max_steps,
            )

        results[abstraction.__name__] = {
            "outcomes": outcomes,
            "complete": not ai.worklist,
        }

    return results

def is_site_uncertain(bc, ai, methodid, source, site):
    from rewriting import find_rewrite_sites
    from tree_sitter import Language, Parser
    import tree_sitter_java

    method = bc.getmethod(methodid)

    parser = Parser()
    parser.language = Language(tree_sitter_java.language())
    tree = parser.parse(source)

    def contains_logical_operator(node):
        if node.type in {"&&", "||"}:
            return True

        return any(
            contains_logical_operator(child)
            for child in node.children
        )

    method_sites = [
        candidate
        for candidate in find_rewrite_sites(source)
        if candidate.kind == "if_statement"
        and candidate.method_start_byte == site.method_start_byte
        and candidate.method_end_byte == site.method_end_byte
    ]

    if not method_sites:
        return None

    method_sites.sort(key=lambda candidate: candidate.start_byte)

    site_positions = [
        index
        for index, candidate in enumerate(method_sites)
        if candidate.start_byte == site.start_byte
        and candidate.end_byte == site.end_byte
    ]

    if len(site_positions) != 1:
        return None

    def find_condition(node):
        if node.type == "if_statement":
            condition = node.child_by_field_name("condition")

            if (
                condition is not None
                and condition.start_byte == site.start_byte
                and condition.end_byte == site.end_byte
            ):
                return condition

        for child in node.children:
            result = find_condition(child)

            if result is not None:
                return result

        return None

    root = tree.root_node
    condition = find_condition(root)

    if condition is None or contains_logical_operator(condition):
        return None

    branches = [
        (index, opcode)
        for index, opcode in enumerate(method.opcodes)
        if isinstance(opcode, (jvm.If, jvm.Ifz))
    ]

    if len(method_sites) != len(branches):
        return None

    expected_conditions = {
        "<": "ge",
        "<=": "gt",
        ">": "le",
        ">=": "lt",
        "==": "ne",
        "!=": "eq",
    }

    site_position = site_positions[0]
    operator = site.operator

    if isinstance(operator, bytes):
        operator = operator.decode()

    branch_index, opcode = branches[site_position]

    expected = expected_conditions.get(operator)

    if expected is None or str(opcode.condition) != expected:
        return None

    state = ai.states.get(PC(methodid, branch_index))

    if state is None:
        return None

    if isinstance(opcode, jvm.If):
        if len(state.stack) < 2:
            return None

        left, right = state.stack[-2:]

    else:
        if not state.stack:
            return None

        left = state.stack[-1]
        right = type(left).abstract([StackInt(0)])

    possible_results = left.compare(right, opcode.condition)

    return possible_results == {True, False}

def prioritize_rewrite_sites(bc, methodid, source, sites, max_steps=300):
    analyses = {}

    # Run each abstract interpretation once and reuse its states for all rewrite sites.
    for abstraction in (Interval, SignSet):
        with redirect_stderr(io.StringIO()):
            ai, _ = run_analysis(
                bc,
                methodid,
                abstraction=abstraction,
                max_steps=max_steps,
            )

        analyses[abstraction.__name__] = ai

    priorities = {}

    for site in sites:
        uncertainty = {
            name: is_site_uncertain(
                bc,
                ai,
                methodid,
                source,
                site,
            )
            for name, ai in analyses.items()
        }

        # Give one point to each abstraction that considers the condition uncertain.
        score = sum(value is True for value in uncertainty.values())

        priorities[site] = {
            "score": score,
            "uncertainty": uncertainty,
        }

    ordered_sites = sorted(
        sites,
        key=lambda site: priorities[site]["score"],
        reverse=True,
    )

    return ordered_sites, priorities

# Compile and execute the original implementation once, then compare each rewritten variant using the same inputs.
def validate_rewrite_variants(
    source_file,
    original_source,
    variants,
    methodid,
    inputs,
    workdir,
):
    if isinstance(methodid, str):
        methodid = AbsMethodID.decode(methodid)

    experiment_start = time.perf_counter()
    first_inconsistency_time = None

    project_root = Path.cwd().resolve()
    runtime_classes = project_root / "target" / "classes"

    if not runtime_classes.exists():
        raise FileNotFoundError(
            f"JPAMB runtime classes not found: {runtime_classes}"
        )

    source_file = Path(source_file).resolve()
    workdir = Path(workdir).resolve()
    workdir.mkdir(parents=True, exist_ok=True)

    original_folder = compile_java_source(
        workdir,
        "original",
        source_file,
        original_source,
        runtime_classes,
        project_root,
    )

    original_results = execute_inputs_local(
        workdir,
        original_folder,
        methodid,
        inputs,
    )

    original_abstract = analyze_class_folder(
        original_folder,
        methodid,
    )

    results = {}

    for name, rewritten_source in variants.items():
        variant_start = time.perf_counter()

        rewritten_folder = compile_java_source(
            workdir,
            name,
            source_file,
            rewritten_source,
            runtime_classes,
            project_root,
        )

        concrete_equivalent = check_rewrite_equivalence_local(
            workdir,
            original_results,
            rewritten_folder,
            methodid,
            inputs,
        )

        rewritten_abstract = analyze_class_folder(
            rewritten_folder,
            methodid,
        )

        abstract_comparisons = {}

        for abstraction_name in original_abstract:
            original_analysis = original_abstract[abstraction_name]
            rewritten_analysis = rewritten_abstract[abstraction_name]

            complete = (
                original_analysis["complete"]
                and rewritten_analysis["complete"]
            )

            abstract_equivalent = (
                original_analysis["outcomes"]
                == rewritten_analysis["outcomes"]
                if complete
                else None
            )

            abstract_comparisons[abstraction_name] = {
                "original": original_analysis["outcomes"],
                "rewritten": rewritten_analysis["outcomes"],
                "equivalent": abstract_equivalent,
                "complete": complete,
            }

        abstract_inconsistency = (
            concrete_equivalent is True
            and any(
                comparison["complete"]
                and comparison["equivalent"] is False
                for comparison in abstract_comparisons.values()
            )
        )

        elapsed_seconds = time.perf_counter() - variant_start
        cumulative_seconds = time.perf_counter() - experiment_start

        if abstract_inconsistency and first_inconsistency_time is None:
            first_inconsistency_time = cumulative_seconds

        results[name] = {
            "concrete_equivalent": concrete_equivalent,
            "abstract": abstract_comparisons,
            "abstract_inconsistency": abstract_inconsistency,
            "elapsed_seconds": elapsed_seconds,
            "cumulative_seconds": cumulative_seconds,
            "time_to_first_inconsistency": first_inconsistency_time,
        }

    return results

if __name__ == "__main__":
    print("This module provides rewrite validation utilities.")
