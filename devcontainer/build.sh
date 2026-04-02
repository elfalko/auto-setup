#!/bin/bash

cd $FAUTOSETUP

docker build -t falk/fdev:0.1.0 -t falk/fdev:latest \
  --build-arg=DEV_USER_ID="$(id -u)" \
  -f $FAUTOSETUP/devcontainer/Dockerfile .

docker images | head -n 10

cd -
