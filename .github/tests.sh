#!/bin/bash

for xspectest in $(ls tests/xslt/*.xspec); do \
docker run xspec "$xspectest" &> .github/result.log;
    if grep -q ".*failed:\s[1-9]" .github/result.log || grep -q -E "\*+\sError\s(running|compiling)\sthe\stest\ssuite" .github/result.log;
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
    if grep -q ".*failed:\s[1-9]" .github/result.log || grep -q -E "\*+\sError\s(running|compiling)\sthe\stest\ssuite" .github/result.log;
        then
            echo "FAILED: $xspectest";
            echo "---------- result.log";
            cat .github/result.log;
            echo "----------";
            exit 1;
        else echo "OK: $xspectest";
    fi
done
