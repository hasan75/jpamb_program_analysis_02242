#!/usr/bin/env python3
"""A syntactic analysis that detects assertion errors and generates analysis-guided rewrites."""

import logging
import sys
import tempfile
from pathlib import Path

import jpamb
import tree_sitter
import tree_sitter_java

from rewriting import (
    find_rewrite_sites,
    find_integer_variables_for_site,
    is_safe_comparison,
    invert_if_comparison,
)
from validation import (
    synthesize_method_inputs,
    validate_rewrite_variants,
    prioritize_rewrite_sites,
)

def main():
    methodid = jpamb.getmethodid(
        "syntaxer",
        "1.0",
        "The Rice Theorem Cookers",
        ["syntactic", "python"],
        for_science=True,
    )

    java_language = tree_sitter.Language(tree_sitter_java.language())
    parser = tree_sitter.Parser(java_language)

    log = logging
    log.basicConfig(level=logging.INFO)

    suite, eff = jpamb.setup()

    srcfile = suite.sourcefile(methodid.classname).relative_to(Path.cwd())

    with open(srcfile, "rb") as f:
        log.debug("Parsing source file %s", srcfile)
        source = f.read()
        tree = parser.parse(source)

    simple_classname = str(methodid.classname.name)

    class_query = tree_sitter.Query(
        java_language,
        f"""
        (class_declaration
            name: ((identifier) @class-name
                   (#eq? @class-name "{simple_classname}"))) @class
        """,
    )

    for node in tree_sitter.QueryCursor(class_query).captures(tree.root_node)["class"]:
        break
    else:
        log.error("Could not find class %s in %s", simple_classname, srcfile)
        sys.exit(-1)

    method_name = methodid.extension.name

    method_query = tree_sitter.Query(
        java_language,
        f"""
        (method_declaration name:
          ((identifier) @method-name (#eq? @method-name "{method_name}"))
        ) @method
        """,
    )

    for method_node in tree_sitter.QueryCursor(method_query).captures(node)["method"]:
        parameters = method_node.child_by_field_name("parameters")

        if parameters is None:
            log.debug("Could not find parameters for %s", method_name)
            continue

        params = [
            child
            for child in parameters.children
            if child.type == "formal_parameter"
        ]

        if len(params) != len(methodid.extension.params):
            continue

        for parameter_type, parameter in zip(methodid.extension.params, params):
            type_node = parameter.child_by_field_name("type")

            if type_node is None or type_node.text is None:
                break
        else:
            break
    else:
        log.warning(
            "Could not find method %s in class %s",
            method_name,
            simple_classname,
        )
        sys.exit(-1)

    body = method_node.child_by_field_name("body")
    assert body is not None and body.text is not None

    for line in body.text.splitlines():
        log.debug("Line: %s", line.decode())

    assert_query = tree_sitter.Query(
        java_language,
        """(assert_statement) @assert""",
    )

    assert_found = any(
        capture_name == "assert"
        for capture_name, _ in tree_sitter.QueryCursor(assert_query).captures(body).items()
    )

    if assert_found:
        log.debug("Found assertion")
        print("assertion error;found")
    else:
        log.debug("No assertion")
        print("assertion error;not-found")

    rewrite_sites = find_rewrite_sites(source)

    # Restrict rewrite candidates to the selected method.
    method_rewrite_sites = [
        site
        for site in rewrite_sites
        if site.method_start_byte == method_node.start_byte
        and site.method_end_byte == method_node.end_byte
    ]

    output_dir = (
        Path(__file__).resolve().parents[1]
        / "generated"
        / f"{simple_classname}_{method_name}"
    )

    method_bytecode = jpamb.Bytecode(suite, eff, {})

    # Only if statements are currently supported by the rewrite transformation.
    eligible_sites = []

    for site in method_rewrite_sites:
        if site.kind != "if_statement":
            continue

        integer_variables = find_integer_variables_for_site(source, site)

        if not is_safe_comparison(site, integer_variables):
            log.debug("Skipping unsafe rewrite: %s", site.condition)
            continue

        eligible_sites.append(site)

    # Rank eligible sites according to uncertainty in the abstract states.
    ordered_sites, priorities = prioritize_rewrite_sites(
        method_bytecode,
        methodid,
        source,
        eligible_sites,
    )

    print("\nAnalysis-guided site prioritization:")

    for site in ordered_sites:
        priority = priorities[site]
        uncertainty = priority["uncertainty"]

        print(
            f"  {site.condition}: "
            f"score={priority['score']}/2, "
            f"Interval={uncertainty['Interval']}, "
            f"SignSet={uncertainty['SignSet']}"
        )

    generated_count = 0
    variants = {}

    for site in ordered_sites:
        integer_variables = find_integer_variables_for_site(source, site)

        rewritten_source = invert_if_comparison(
            source,
            site,
            integer_variables,
        )

        if rewritten_source == source:
            log.debug("Rewrite produced no changes: %s", site.condition)
            continue

        site_dir = output_dir / f"site_{site.start_byte}"
        site_dir.mkdir(parents=True, exist_ok=True)

        output_file = site_dir / srcfile.name
        output_file.write_bytes(rewritten_source)

        variants[f"site_{site.start_byte}"] = rewritten_source
        generated_count += 1

        log.info(
            "Generated rewrite: %s -> %s (priority=%d/2)",
            site.condition,
            output_file,
            priorities[site]["score"],
        )

    log.info("Generated %d rewrite variants", generated_count)

    if variants:
        # Generate concrete inputs from the interval analysis of the target method.
        inputs = synthesize_method_inputs(
            method_bytecode,
            methodid,
        )

        print(f"\nSynthesized inputs: {len(inputs)}")

        # Compile and validate all generated variants in a temporary directory.
        with tempfile.TemporaryDirectory(
            prefix="syntactic-validation-"
        ) as temporary_dir:

            results = validate_rewrite_variants(
                srcfile,
                source,
                variants,
                methodid,
                inputs,
                Path(temporary_dir),
            )

        print("\nRewrite validation results:")

        for name, result in results.items():
            concrete_status = (
                "EQUIVALENT"
                if result["concrete_equivalent"]
                else "NOT EQUIVALENT"
            )

            print(f"\n{name}:")
            print(f"  Concrete equivalence: {concrete_status}")

            for abstraction_name, comparison in result["abstract"].items():
                if not comparison["complete"]:
                    abstract_status = "INCOMPLETE"
                elif comparison["equivalent"]:
                    abstract_status = "EQUIVALENT"
                else:
                    abstract_status = "DIFFERENT"

                print(f"  {abstraction_name}: {abstract_status}")
                print(f"    Original:  {comparison['original']}")
                print(f"    Rewritten: {comparison['rewritten']}")

    for query in jpamb.QUERIES:
        if query != "assertion error":
            print(f"{query};skip")

    sys.exit(0)

if __name__ == "__main__":
    main()