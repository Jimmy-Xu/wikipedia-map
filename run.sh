#!/usr/bin/env bash

FOUND=`docker ps -a | grep wikipedia-map | wc -l`
if [ $FOUND -eq 1 ];then
  docker rm -fv wikipedia-map
fi
docker run -d --name wikipedia-map -p 8000:80 -p 3000:3000 -e FIP=$1 \
 -e http_proxy=$http_proxy -e https_proxy=$https_proxy -e no_proxy=$no_proxy \
 xjimmyshcn/wikipedia-map
