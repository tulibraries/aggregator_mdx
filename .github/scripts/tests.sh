#!/bin/bash
set -euo pipefail

for xspectest in tests/xslt/*.xspec; do
    if ! docker run xspec "$xspectest" > .github/result.log 2>&1; then
        exit_code=$?
    else
        exit_code=0
    fi

    if [ $exit_code -ne 0 ] || grep -Eq 'failed:[[:space:]]*[1-9]' .github/result.log || grep -Eq '\*+ Error (running|compiling) the test suite' .github/result.log; then
        echo "FAILED: $xspectest"
        echo "---------- result.log"
        cat .github/result.log
        echo "----------"
        [ $exit_code -ne 0 ] && echo "docker exit code: $exit_code"
        exit 1
    else
        echo "OK: $xspectest"
    fi
done

for xspectest in tests/schematron/*.xspec; do
    if ! docker run xspec -s "$xspectest" > .github/result.log 2>&1; then
        exit_code=$?
    else
        exit_code=0
    fi

    if [ $exit_code -ne 0 ] || grep -Eq 'failed:[[:space:]]*[1-9]' .github/result.log || grep -Eq '\*+ Error (running|compiling) the test suite' .github/result.log; then
            echo "FAILED: $xspectest"
            echo "---------- result.log"
            cat .github/result.log
            echo "----------"
            [ $exit_code -ne 0 ] && echo "docker exit code: $exit_code"
            exit 1
        else
            echo "OK: $xspectest"
    fi
done
