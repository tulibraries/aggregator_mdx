#!/bin/bash
set -e

ssh -J $DEPLOY_USER@$TRAEFIK_IP -p $SSH_PORT $DEPLOY_USER@$COMBINE_PROD_IP -p $SSH_PORT

for xsl in $(find transforms -type f -name '*.xsl'); do \
/usr/local/bin/docker-compose exec -u combine combine-django python /opt/combine/manage.py validation 'test' 'sch' True 'https://raw.githubusercontent.com/tulibraries/aggregator_mdx/master/validations/padigital_reqd_fields.sch'
/usr/local/bin/docker-compose exec -u combine combine-django python /opt/combine/manage.py transformation 'test' 'xslt' 'https://raw.githubusercontent.com/tulibraries/aggregator_mdx/fix-dupes/transforms/temple_p16002coll25.xsl'
