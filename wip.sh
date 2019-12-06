#!/bin/bash

docker-compose run saxon -xsl:https://raw.githubusercontent.com/tulibraries/aggregator_mdx/master/transforms/dplah.xsl -s:fixtures/02c072f6ac751024c706247b90e7333a -o:test1.xml
sed -e "s|<?xml version=.*?>|<collection>|g" test1.xml > test2.xml
echo "</collection>" >> test2.xml

docker-compose run saxon -xsl:wip.xsl -s:test2.xml -o:test3.xml

# echo "<collection>" | tee tmpfile2
# docker-compose run saxon -xsl:https://raw.githubusercontent.com/tulibraries/aggregator_mdx/master/transforms/temple.xsl -s:tmpfile1 -o:tmpfile2
# echo "</collection>" | tee tmpfile2
#
# cat tmpfile2
