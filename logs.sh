#!/usr/bin/env bash

export HOSTNAME=$(hostname)
export PORT=44234

# attach to the logs
docker-compose logs -f
