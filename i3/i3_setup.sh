#!/bin/bash

# linkcmd="/bin/bash ./scripts/lnnew.sh"

echo "Setting up files"

# packages to install
# i3 i3blocks i3lock-color

# mkdir -p ~/.config/i3
# $linkcmd i3/i3config ~/.config/i3/config

ln -s ~/auto-setup/i3 ~/.config/i3
ln -s ~/auto-setup/i3blocks ~/.config/i3blocks
. ~/auto-setup/i3/check-deps.sh
/bin/bash ~/auto-setup/i3/build_i3_config.sh
