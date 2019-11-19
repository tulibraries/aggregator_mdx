#!/bin/bash
set -e

count_total=0
count_exists=0

for file in transforms/*.xsl ; do \
  count_total=$(($count_total + 1)) ;
  filename=$(basename $file) ;
  name=$(echo "$filename" | cut -f 1 -d '.') ;
  if test -f "tests/xslt/$name.xspec" ; then \
    count_exists=$(($count_exists + 1))
  fi
done

for file in validations/*.xsl ; do \
  count_total=$(($count_total + 1)) ;
  filename=$(basename $file) ;
  name=$(echo "$filename" | cut -f 1 -d '.') ;
  if test -f "tests/schematron/$name.xspec" ; then \
    count_exists=$(($count_exists + 1))
  fi
done

coverage=$(echo | awk -v count_exists=$count_exists -v count_total=$count_total '{print (count_exists / count_total)*100}')
if (( $(echo "$coverage" | awk '{print ($1 < 31)}') )); then
  echo "Test coverage is too low: "
  echo $coverage
  exit 1
fi
