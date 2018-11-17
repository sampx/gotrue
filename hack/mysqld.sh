#!/usr/bin/env bash

docker rm -f gotrue_mysql >/dev/null 2>/dev/null || true

docker run -d --name gotrue_mysql \
	-p 3306:3306 \
	-e MYSQL_ALLOW_EMPTY_PASSWORD=yes \
	-v /Users/Sam/Documents/docker-data/gotruedb:/var/lib/mysql \
	-d mysql:5.7 mysqld --bind-address=0.0.0.0
