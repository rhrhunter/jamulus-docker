#!/usr/bin/env bash

export HOSTNAME=$(hostname)
export PORT=22124

# build the jamulus server
docker-compose build "$@"
