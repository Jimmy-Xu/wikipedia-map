FROM codekoalas/nginx-node:8
MAINTAINER Jimmy Xu <xjimmyshcn@gmail.com>

## overwrite start.sh
COPY script/start.sh /root/start.sh

## clone repo
COPY api /var/www/site/api
COPY docroot /var/www/site/docroot

## prepare node
RUN cd /var/www/site/api; npm install

RUN pwd
ENV NODE_PREP="node api/index.js > api_access.log 2> api_error.log"

ENV FIP=
