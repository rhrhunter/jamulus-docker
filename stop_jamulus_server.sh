#!/usr/bin/env bash

export HOSTNAME=$(hostname)
export PORT=44234

# shutdown the container
docker-compose down
docker-compose kill

# close up the firewall
sudo ufw deny ${PORT}/udp
#sudo ufw deny ${PORT}/tcp
