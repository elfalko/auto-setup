#!/bin/bash

# linkcmd="/bin/bash ./scripts/lnnew.sh"

echo "Setting up files"

# mkdir -p ~/.config/i3
# $linkcmd i3/i3config ~/.config/i3/config

ln -s ~/auto-setup/i3 ~/.config/i3
ln -s ~/auto-setup/i3blocks ~/.config/i3blocks
/bin/bash ~/auto-setup/i3/build_i3_config.sh
