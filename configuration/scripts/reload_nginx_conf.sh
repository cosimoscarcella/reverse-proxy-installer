#!/usr/bin/sh

LOGS_DIR=$1
DOCKER_COMPOSE_DIR=$2

PATH=$DOCKER_COMPOSE_DIR:$PATH 

docker-compose exec endpoint nginx -s reload >> $LOGS_DIR/reload.log 2>&1 &