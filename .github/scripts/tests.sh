#!/bin/bash
set -euo pipefail

for xspectest in $(ls tests/xslt/*.xspec); do \
docker run xspec "$xspectest" &> .github/result.log;
    if grep -Eq 'failed:[[:space:]]*[1-9]' .github/result.log || grep -Eq '\*+ Error (running|compiling) the test suite' .github/result.log;
      then
          echo "FAILED: $xspectest";
          echo "---------- result.log";
          cat .github/result.log;
          echo "----------";
          exit 1;
      else echo "OK: $xspectest";
    fi
done

for xspectest in $(ls tests/schematron/*.xspec); do \
docker run xspec -s "$xspectest" &> .github/result.log;
    if grep -Eq 'failed:[[:space:]]*[1-9]' .github/result.log || grep -Eq '\*+ Error (running|compiling) the test suite' .github/result.log;
        then
            echo "FAILED: $xspectest";
            echo "---------- result.log";
            cat .github/result.log;
            echo "----------";
            exit 1;
        else echo "OK: $xspectest";
    fi
done
