#!/bin/bash

# assumption: this script is run from the folder where editing should happen

docker run \
  --user "$(id -u)" \
  --volume="$(pwd)":/home/dev/ws \
  --volume="$HOME/auto-setup/":/home/dev/auto-setup \
  -it falk/fdev:latest \
  /bin/bash -l

