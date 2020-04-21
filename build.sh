#!/usr/bin/env bash

export HOSTNAME=$(hostname)
export PORT=44234

# build the jamulus server
docker-compose build --no-cache "$@"
