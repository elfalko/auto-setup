#!/bin/bash

# assumption: this script is run from the folder where editing should happen

DEVUSER=dev

docker run \
  --user "$(id -u):${DEVUSER}" \
  --volume="$(pwd)":/home/${DEVUSER}/ws \
  --volume="$HOME/auto-setup/":/home/${DEVUSER}/auto-setup \
  --volume="$HOME/.bash_individual_aliases/":/home/${DEVUSER}/.bash_individual_aliases \
  --rm -it falk/fdev:latest \
  /bin/bash -l
