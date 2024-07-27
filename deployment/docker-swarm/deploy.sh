#!/bin/bash

set -e

cd /usr/src

sudo $(cat .env | xargs) docker stack deploy -c docker-compose.prod.yml blog
#rm .env
