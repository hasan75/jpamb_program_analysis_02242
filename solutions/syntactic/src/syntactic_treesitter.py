#!/usr/bin/env python3
"""A syntactic analysis that selects rewrite sites using different strategies."""

import logging
import json
import sys
import tempfile
from pathlib import Path
import argparse
import random
import jpamb
import tree_sitter
import tree_sitter_java

from rewriting import (
    REWRITES,
    apply_rewrite,
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

JVM_TO_JAVA_TYPES = {
    "Int": "int",
    "Long": "long",
    "Float": "float",
    "Double": "double",
    "Boolean": "boolean",
    "Byte": "byte",
    "Char": "char",
    "Short": "short",
}

def matches_parameter_type(parameter_type, type_node):
    expected_type = JVM_TO_JAVA_TYPES.get(type(parameter_type).__name__)

    if expected_type is None or type_node.text is None:
        return False

    actual_type = type_node.text.decode("utf-8").replace(" ", "")
    return actual_type == expected_type

def main():
    argument_parser = argparse.ArgumentParser()

    argument_parser.add_argument(
        "--strategy",
        choices=["analysis-guided", "random", "syntax-based"],
        default="analysis-guided",
    )
    argument_parser.add_argument("--seed", type=int, default=42)
    argument_parser.add_argument("--budget", type=int, default=None)

    argument_parser.add_argument(
        "--results-json",
        type=Path,
        default=None,
        help="Export validation results to a JSON file",
    )

    argument_parser.add_argument(
        "--selection-only",
        action="store_true",
        help="Generate rewrite variants without validating them",
    )

    args, remaining_args = argument_parser.parse_known_args()

    if len(remaining_args) != 1:
        argument_parser.error("Expected exactly one JPAMB method identifier")

    sys.argv = [sys.argv[0], remaining_args[0]]

    if args.budget is not None and args.budget < 0:
        argument_parser.error("--budget must be non-negative")

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

            if type_node is None or not matches_parameter_type(parameter_type, type_node):
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

    priorities = {}

    if args.strategy == "analysis-guided":
        ordered_sites, priorities = prioritize_rewrite_sites(
            method_bytecode,
            methodid,
            source,
            eligible_sites,
        )

    elif args.strategy == "random":
        ordered_sites = eligible_sites.copy()
        random.Random(args.seed).shuffle(ordered_sites)

    else:
        # Prefer shorter conditions as syntactically simpler rewrite sites.
        ordered_sites = sorted(
            eligible_sites,
            key=lambda site: (len(site.condition), site.start_byte),
        )

    print(f"\nRewrite site selection: {args.strategy}")

    if args.strategy == "analysis-guided":
        for site in ordered_sites:
            priority = priorities[site]
            uncertainty = priority["uncertainty"]

            print(
                f"  {site.condition}: "
                f"score={priority['score']}/2, "
                f"Interval={uncertainty['Interval']}, "
                f"SignSet={uncertainty['SignSet']}"
            )
    else:
        for site in ordered_sites:
            print(f"  {site.condition}")

    generated_count = 0
    variants = {}

    for site in ordered_sites:
        if args.budget is not None and generated_count >= args.budget:
            break

        integer_variables = find_integer_variables_for_site(source, site)

        rewrites = {
            "invert": lambda: invert_if_comparison(
                source,
                site,
                integer_variables,
            ),
        }

        for rewrite_name in REWRITES:
            rewrites[rewrite_name] = lambda name=rewrite_name: apply_rewrite(
                source,
                site,
                name,
            )

        for rewrite_name, rewrite_function in rewrites.items():
            if args.budget is not None and generated_count >= args.budget:
                break

            rewritten_source = rewrite_function()

            if rewritten_source is None or rewritten_source == source:
                continue

            variant_name = f"site_{site.start_byte}_{rewrite_name}"

            site_dir = output_dir / variant_name
            site_dir.mkdir(parents=True, exist_ok=True)

            output_file = site_dir / srcfile.name
            output_file.write_bytes(rewritten_source)

            variants[variant_name] = rewritten_source
            generated_count += 1

            log.info(
                "Generated %s rewrite: %s -> %s",
                rewrite_name,
                site.condition,
                output_file,
            )

    log.info("Generated %d rewrite variants", generated_count)

    if args.selection_only:
        print("\nSelected rewrite variants:")
        for name in variants:
            print(f"  {name}")
        return

    results = {}

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
            if result["concrete_equivalent"] is None:
                concrete_status = "INCONCLUSIVE"
            elif result["concrete_equivalent"]:
                concrete_status = "EQUIVALENT"
            else:
                concrete_status = "NOT EQUIVALENT"

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

    if args.results_json is not None:
        args.results_json.parent.mkdir(parents=True, exist_ok=True)

        evaluation_data = {
            "method": str(methodid),
            "strategy": args.strategy,
            "seed": args.seed,
            "budget": args.budget,
            "variant_count": generated_count,
            "results": results,
        }

        with args.results_json.open("w", encoding="utf-8") as file:
            json.dump(
                evaluation_data,
                file,
                indent=2,
                default=str,
            )

        print(f"\nResults exported to: {args.results_json}")

    for query in jpamb.QUERIES:
        if query != "assertion error":
            print(f"{query};skip")

    sys.exit(0)

if __name__ == "__main__":
    main()