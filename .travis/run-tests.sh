#!/bin/bash
set -e

for xspectest in $(find transforms -type f -name '*.xspec'); do \
docker-compose run xspec "/$xspectest" &> .travis/result.log;
    if grep -q ".*failed:\s[1-9]" .travis/result.log || grep -q -E "\*+\sError\s(running|compiling)\sthe\stest\ssuite" .travis/result.log;
        then
            echo "FAILED: $xspectest";
            echo "---------- result.log";
            cat .travis/result.log;
            echo "----------";
            exit 1;
        else echo "OK: $xspectest";
    fi
done

for xspectest in $(find validations -type f -name '*.xspec'); do \
docker-compose run xspec -s "/$xspectest" &> .travis/result.log;
    if grep -q ".*failed:\s[1-9]" .travis/result.log || grep -q -E "\*+\sError\s(running|compiling)\sthe\stest\ssuite" .travis/result.log;
        then
            echo "FAILED: $xspectest";
            echo "---------- result.log";
            cat .travis/result.log;
            echo "----------";
            exit 1;
        else echo "OK: $xspectest";
    fi
done