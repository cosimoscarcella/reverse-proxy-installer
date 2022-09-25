#!/usr/bin/sh

LOGS_DIR=$1
DOCKER_COMPOSE_DIR=$2

PATH=$DOCKER_COMPOSE_DIR:$PATH 

docker-compose run --rm certbot renew >> $LOGS_DIR/renew.log 2>&1 &