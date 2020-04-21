#!/usr/bin/env bash

export HOSTNAME=$(hostname)
export PORT=44234

# start the jamulus server in the background
docker-compose up -d

# open up the firewall
sudo ufw allow ${PORT}/udp
#sudo ufw allow ${PORT}/tcp
