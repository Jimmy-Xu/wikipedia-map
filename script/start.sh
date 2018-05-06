#!/bin/bash

# Set up SSMTP Config Files
/usr/local/bin/confd -onetime -backend env

# Export all env vars containing "_" to a file for use with cron jobs
printenv | grep \_ | sed 's/^\(.*\)$/export \1/g' | sed 's/=/=\"/g' | sed 's/$/"/g' > /root/project_env.sh
chmod +x /root/project_env.sh

# replace api_endpoint
cd /var/www/site/docroot/js && sed -i "s/127.0.0.1/$FIP/g" api.js && grep api_endpoint api.js

# run node prep commands
cd /var/www/site/ && eval ${NODE_PREP}

# Add in .htpasswd if ENV VAR set
if [ $HTPASSWD ]; then echo $HTPASSWD > /var/www/site/.htpasswd ; fi