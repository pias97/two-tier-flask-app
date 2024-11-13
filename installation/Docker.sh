#!/bin/bash

sudo apt update -y
sudo apt upgrade -y

sudo apt install docker.io -y

sudo apt install docker-compose -y
sudo chown $USER /var/run/docker.sock
sudo usermod -aG docker $USER && newgrp docker
echo "Docker installation complete. You may now run Docker commands."

