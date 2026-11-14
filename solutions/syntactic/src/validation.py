import io
import json
import shutil
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

JAVA = Path(
    r"C:\Program Files\Eclipse Adoptium\jdk-21.0.13.9-hotspot\bin"
)

JAVAC = JAVA / "javac.exe"
JAVA_EXE = JAVA / "java.exe"

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

    return synthesize_integer_inputs(intervals)

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
        timeout=60,
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

    result = subprocess.run(
        command,
        cwd=workdir,
        capture_output=True,
        text=True,
        timeout=max(30, len(inputs) * 6),
        check=False,
    )

    if result.returncode != 0:
        print("Java batch execution failed:")
        print("Return code:", result.returncode)
        print("STDOUT:", result.stdout)
        print("STDERR:", result.stderr)
        raise RuntimeError("Local Java batch execution failed")

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
    """Compare cached original results with rewritten results."""

    if not inputs:
        return False

    rewritten_results = execute_inputs_local(
        workdir,
        rewritten_folder,
        methodid,
        inputs,
    )

    if "*" in original_results or "*" in rewritten_results:
        return False

    return original_results == rewritten_results

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
    method = bc.getmethod(methodid)

    # Map the source-level rewrite site to its corresponding bytecode line.
    source_line = source[:site.start_byte].count(b"\n") + 1

    # Find the corresponding entry in the bytecode line table.
    line_index = next(
        (
            i
            for i, entry in enumerate(method.lines)
            if entry["line"] == source_line
        ),
        None,
    )

    if line_index is None:
        return None

    start = method.lines[line_index]["offset"]
    end = (
        method.lines[line_index + 1]["offset"]
        if line_index + 1 < len(method.lines)
        else None
    )

    # Find conditional branches associated with the source line.
    branches = [
        i
        for i, opcode in enumerate(method.opcodes)
        if opcode.offset >= start
        and (end is None or opcode.offset < end)
        and isinstance(opcode, (jvm.If, jvm.Ifz))
    ]

    # Some Java conditions are mapped to the following bytecode line.
    if not branches and line_index + 1 < len(method.lines):
        next_start = method.lines[line_index + 1]["offset"]
        next_end = (
            method.lines[line_index + 2]["offset"]
            if line_index + 2 < len(method.lines)
            else None
        )

        branches = [
            i
            for i, opcode in enumerate(method.opcodes)
            if opcode.offset >= next_start
            and (next_end is None or opcode.offset < next_end)
            and isinstance(opcode, (jvm.If, jvm.Ifz))
        ]

    # Avoid assigning a result when the source-to-bytecode mapping is ambiguous.
    if len(branches) != 1:
        return None

    branch_index = branches[0]
    opcode = method.opcodes[branch_index]
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

    # A condition is uncertain when both outcomes are possible in the abstract state.
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

    project_root = Path.cwd().resolve()
    runtime_classes = project_root / "target" / "classes"

    if not runtime_classes.exists():
        raise FileNotFoundError(
            f"JPAMB runtime classes not found: {runtime_classes}"
        )

    source_file = Path(source_file).resolve()
    workdir = Path(workdir).resolve()
    workdir.mkdir(parents=True, exist_ok=True)

    # Compile and execute the original implementation.
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

    # Analyze the original implementation with both abstract domains.
    original_abstract = analyze_class_folder(
        original_folder,
        methodid,
    )

    results = {}

    for name, rewritten_source in variants.items():

        # Compile the rewritten implementation.
        rewritten_folder = compile_java_source(
            workdir,
            name,
            source_file,
            rewritten_source,
            runtime_classes,
            project_root,
        )

        # Compare concrete execution results using the same synthesized inputs.
        concrete_equivalent = check_rewrite_equivalence_local(
            workdir,
            original_results,
            rewritten_folder,
            methodid,
            inputs,
        )

        # Analyze the rewritten implementation.
        rewritten_abstract = analyze_class_folder(
            rewritten_folder,
            methodid,
        )

        # Compare the abstract outcomes only when both analyses completed.
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

        results[name] = {
            "concrete_equivalent": concrete_equivalent,
            "abstract": abstract_comparisons,
        }

    return results

if __name__ == "__main__":
    import tempfile

    methodid = AbsMethodID.decode(
        "jpamb.cases.Dependent.badNormalizedDistance:(II)I"
    )

    project_root = Path.cwd().resolve()
    source_file = (
        project_root / "cases" / "jpamb" / "cases" / "Dependent.java"
    )

    with tempfile.TemporaryDirectory() as temp:
        workdir = Path(temp).resolve()

        class_folder = compile_java_source(
            workdir,
            "original",
            source_file,
            source_file.read_bytes(),
            project_root / "target" / "classes",
            project_root,
        )

        bc = create_analysis_bytecode(class_folder, methodid)

        method = bc.getmethod(methodid)
        print(f"Bytecode created: {methodid}")
        print(f"Instructions: {len(method.opcodes)}")

        for abstraction in (Interval, SignSet):
            with redirect_stderr(io.StringIO()):
                ai, outcomes = run_analysis(
                    bc,
                    methodid,
                    abstraction=abstraction,
                    max_steps=300,
                )

            print(f"\nAbstraction: {abstraction.__name__}")
            print(f"Outcomes: {outcomes}")
            print(f"Remaining worklist: {len(ai.worklist)}")