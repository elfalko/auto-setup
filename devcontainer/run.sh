#!/bin/bash

# assumption: this script is run from the folder where editing should happen

echo "cd ../auto-setup/; export HOME=/home/dev; . setup.sh; cd -; bash"
docker run \
  --user "$(id -u):dev" \
  --volume="$(pwd)":/home/dev/ws \
  --volume="$HOME/auto-setup/":/home/dev/auto-setup \
  -it falk/fdev:latest \
  /bin/bash -l

