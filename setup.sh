#!/bin/bash

linkcmd="/bin/bash ./scripts/lnnew.sh"
# actual setup
echo "Setting up files"

. tmux/setup.sh

. nvim/setup.sh
echo "Install nodejs for coc"

# linkcmd .bash_aliases ~/.bash_aliases


. git/setup.sh

$linkcmd .inputrc ~/.inputrc
$linkcmd .Xmodmap ~/.Xmodmap

echo ""

echo "You might want to restart to allow the full config to take effect"

