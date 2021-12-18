#!/bin/bash

echo "installing docker"

sudo apt install docker.io

# based on 
# https://stackoverflow.com/a/48957722/8069867

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

echo "testing docker hello world"

docker run hello-world
