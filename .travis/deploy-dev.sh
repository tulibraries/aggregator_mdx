#!/bin/bash
set -e

/usr/local/bin/docker-compose exec combine-django python /opt/combine/manage.py validation 'test' 'sch' True 'https://raw.githubusercontent.com/tulibraries/aggregator_mdx/master/validations/padigital_reqd_fields.sch'
/usr/local/bin/docker-compose exec combine-django python /opt/combine/manage.py transformation 'test' 'xslt' 'https://raw.githubusercontent.com/tulibraries/aggregator_mdx/fix-dupes/transforms/temple_p16002coll25.xsl'
