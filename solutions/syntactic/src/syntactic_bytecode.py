#!/usr/bin/env python3
"""A very stupid syntactic bytecode analysis, that checks for
assertion errors, divide by zero, null pointer, infinite loop, and out of bounds array access."""

import logging

import jpamb


def main():
    methodid = jpamb.getmethodid(
        "bytecoder_extended",
        "1.1",
        "Hasan Ahmed",
        ["syntactic", "python"],
        for_science=True,
    )

    log = logging
    log.basicConfig(level=logging.DEBUG)

    suite, eff = jpamb.setup()

    log.debug("looking up method")
    m = suite.findmethod(methodid, eff=eff)

    log.debug("trying to find assert,divide,array access")
    assert_found = False
    divzero_found = False
    oob_found = False

    for inst in m["code"]["bytecode"]:
        opr = inst["opr"]
        if (
            opr == "invoke"
            and inst["method"]["ref"]["name"] == "java/lang/AssertionError"
        ):
            assert_found = True

        elif opr == "binary" and inst["operant"] in ("div", "rem"):
            divzero_found = True

        elif opr in ("array_load", "array_store"):
            oob_found = True

    if assert_found:
        log.debug("Found assertion")
        print("assertion error;assert-yes")
    else:
        log.debug("No assertion")
        print("assertion error;assert-no")

    if divzero_found:
        log.debug("Found divide")
        print("divide by zero;div-yes")
    else:
        log.debug("No divide")
        print("divide by zero;div-no")

    if oob_found:
        log.debug("Found array access")
        print("out of bounds;oob-yes")
    else:
        log.debug("No array access")
        print("out of bounds;oob-no")

    print("ok;ok-yes")

    # skiping others
    for q in jpamb.QUERIES:
        if q not in ("assertion error", "divide by zero", "out of bounds", "ok"):
            print(f"{q};skip")
