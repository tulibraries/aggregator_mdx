#!/bin/bash
set -e

for xspectest in $(ls tests/xslt/*.xspec); do \
docker run xspec "$xspectest" &> .circleci/result.log;
    if grep -q ".*failed:\s[1-9]" .circleci/result.log || grep -q -E "\*+\sError\s(running|compiling)\sthe\stest\ssuite" .circleci/result.log;
        then
            echo "FAILED: $xspectest";
            echo "---------- result.log";
            cat .circleci/result.log;
            echo "----------";
            exit 1;
        else echo "OK: $xspectest";
    fi
done

for xspectest in $(ls tests/schematron/*.xspec); do \
docker run xspec -s "$xspectest" &> .circleci/result.log;
    if grep -q ".*failed:\s[1-9]" .circleci/result.log || grep -q -E "\*+\sError\s(running|compiling)\sthe\stest\ssuite" .circleci/result.log;
        then
            echo "FAILED: $xspectest";
            echo "---------- result.log";
            cat .circleci/result.log;
            echo "----------";
            exit 1;
        else echo "OK: $xspectest";
    fi
done
