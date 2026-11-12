import shutil
from pathlib import Path
import subprocess

from abstractions import Interval
from jvm.state import PC
from static import run_analysis
from synthesis import synthesize_integer_inputs

JAVA = Path(
    r"C:\Program Files\Eclipse Adoptium\jdk-21.0.13.9-hotspot\bin"
)

JAVAC = JAVA / "javac.exe"
JAVA_EXE = JAVA / "java.exe"

# Run multiple inputs in one JVM process, with an individual timeout for each execution.
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

def synthesize_method_inputs(bc, methodid, max_steps=300):
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
    class_folder = workdir / name / "classes"

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

# Execute all synthesized inputs in a single JVM invocation to reduce the overhead of starting separate processes.
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

    if "*" in original_results:
        return False

    return original_results == rewritten_results

# Compile and execute the original implementation once, then compare its results against each rewritten variant using the same inputs.
def validate_rewrite_variants(
    source_file,
    original_source,
    variants,
    methodid,
    inputs,
    workdir,
):
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

    results = {}

    for name, rewritten_source in variants.items():

        rewritten_folder = compile_java_source(
            workdir,
            name,
            source_file,
            rewritten_source,
            runtime_classes,
            project_root,
        )

        equivalent = check_rewrite_equivalence_local(
            workdir,
            original_results,
            rewritten_folder,
            methodid,
            inputs,
        )

        results[name] = equivalent

    return results