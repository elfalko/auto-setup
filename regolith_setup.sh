#!/bin/bash

# ./scripts/ubuntu-basics.sh

# actual setup
echo "Setting up files"

# links to a resource file 
# $1: link target in resources ./resource/$1
# $2: name of link
linkcmd="/bin/bash ./scripts/lnnew.sh"

$linkcmd Xresources ~/.config/regolith/Xresources

echo ""

# ./scripts/vbox.sh
