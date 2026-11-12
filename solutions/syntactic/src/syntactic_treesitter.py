#!/usr/bin/env python3
"""A very stupid syntactic analysis, that only checks for assertion errors."""

import logging
import sys
from pathlib import Path
from rewriting import (
    find_rewrite_sites,
    find_integer_variables_for_site,
    is_safe_comparison,
    invert_if_comparison,
)
import tree_sitter
import tree_sitter_java
import tempfile
from validation import (
    synthesize_method_inputs,
    validate_rewrite_variants,
)
import jpamb

def main():
    methodid = jpamb.getmethodid(
        "syntaxer",
        "1.0",
        "The Rice Theorem Cookers",
        ["syntactic", "python"],
        for_science=True,
    )

    JAVA_LANGUAGE = tree_sitter.Language(tree_sitter_java.language())
    parser = tree_sitter.Parser(JAVA_LANGUAGE)

    log = logging
    log.basicConfig(level=logging.DEBUG)

    suite, eff = jpamb.setup()

    srcfile = suite.sourcefile(methodid.classname).relative_to(Path.cwd())

    with open(srcfile, "rb") as f:
        log.debug("parse sourcefile %s", srcfile)
        source = f.read()
        tree = parser.parse(source)

    simple_classname = str(methodid.classname.name)

    log.debug(f"{simple_classname}")

    # To figure out how to write these you can consult the
    # https://tree-sitter.github.io/tree-sitter/playground
    class_q = tree_sitter.Query(
        JAVA_LANGUAGE,
        f"""
        (class_declaration 
            name: ((identifier) @class-name 
                   (#eq? @class-name "{simple_classname}"))) @class
    """,
    )

    for node in tree_sitter.QueryCursor(class_q).captures(tree.root_node)["class"]:
        break
    else:
        log.error(f"could not find a class of name {simple_classname} in {srcfile}")

        sys.exit(-1)

    # log.debug("Found class %s", node.range)

    method_name = methodid.extension.name

    method_q = tree_sitter.Query(
        JAVA_LANGUAGE,
        f"""
        (method_declaration name: 
          ((identifier) @method-name (#eq? @method-name "{method_name}"))
        ) @method
    """,
    )

    for snode in tree_sitter.QueryCursor(method_q).captures(node)["method"]:
        if not (p := snode.child_by_field_name("parameters")):
            log.debug(f"Could not find parameteres of {method_name}")
            continue

        params = [c for c in p.children if c.type == "formal_parameter"]

        if len(params) != len(methodid.extension.params):
            continue

        # log.debug(methodid.extension.params)
        # log.debug(params)

        for tn, t in zip(methodid.extension.params, params):
            if (tp := t.child_by_field_name("type")) is None:
                break

            if tp.text is None:
                break

        # todo check for type.
        else:
            method_node = snode
            break
    else:
        log.warning(
            f"could not find a method of name {method_name} in {simple_classname}"
        )
        sys.exit(-1)

    # log.debug("Found method %s %s", method_name, node.range)

    body = method_node.child_by_field_name("body")
    assert body and body.text
    for t in body.text.splitlines():
        log.debug("line: %s", t.decode())

    assert_q = tree_sitter.Query(JAVA_LANGUAGE, """(assert_statement) @assert""")

    assert_found = any(
        capture_name == "assert"
        for capture_name, _ in tree_sitter.QueryCursor(assert_q).captures(body).items()
    )

    if assert_found:
        log.debug("Found assertion")
        print("assertion error;found")
    else:
        log.debug("No assertion")
        print("assertion error;not-found")

    rewrite_sites = find_rewrite_sites(source)

    # Only consider rewrite sites belonging to the target method.
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

    generated_count = 0

    variants = {}
    for site in method_rewrite_sites:
        log.debug(
            "Rewrite site: kind=%s, condition=%s, operator=%s",
            site.kind,
            site.condition,
            site.operator,
        )

        # Only if statements are currently supported for comparison inversion.
        if site.kind != "if_statement":
            continue

        integer_variables = find_integer_variables_for_site(source, site)

        # Skip comparisons whose operands cannot be safely identified as integers.
        if not is_safe_comparison(site, integer_variables):
            log.debug("Skipping unsafe rewrite: %s", site.condition)
            continue

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
            "Generated rewrite: %s -> %s",
            site.condition,
            output_file,
        )

    log.info("Generated %d rewrite variants", generated_count)

    if variants:
        method_bytecode = jpamb.Bytecode(suite, eff, {})

        # Generate concrete inputs from the interval analysis of the target method.
        inputs = synthesize_method_inputs(
            method_bytecode,
            methodid,
        )

        print(f"\nSynthesized inputs: {len(inputs)}")

        # Use a temporary directory for compilation and validation artifacts.
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

        for name, equivalent in results.items():
            status = "EQUIVALENT" if equivalent else "NOT EQUIVALENT"
            print(f"{name}: {status}")

    for q in jpamb.QUERIES:
        if q != "assertion error":
            print(f"{q};skip")

    sys.exit(0)
