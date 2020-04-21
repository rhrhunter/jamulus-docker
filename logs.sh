#!/usr/bin/env bash

export HOSTNAME=$(hostname)
export PORT=22124

# attach to the logs
docker-compose logs -f
