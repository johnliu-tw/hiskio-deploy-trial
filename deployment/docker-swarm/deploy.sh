#!/bin/bash

set -e

cd /usr/src

export $(cat .env)
sudo docker stack deploy -c docker-compose.prod.yml blog
#rm .env
