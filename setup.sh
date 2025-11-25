#!/bin/bash

# actual setup
echo "General setup"

echo ".config"
mkdir -p "$HOME"/.config

. tmux/setup.sh

. nvim/setup.sh
echo "Install nodejs for coc"

. git/setup.sh

. inputrc/setup.sh

# here instead of bash/setup.sh since that allows auto sourcing all bash files
echo "BASH"
grep auto-setup "$HOME"/.bashrc ||
cat >> "$HOME"/.bashrc << EOF
# auto-added by auto-setup/setup.sh
[ -f $HOME/auto-setup/bash/bashrc ] && . $HOME/auto-setup/bash/bashrc
EOF

# $linkcmd .Xmodmap ~/.Xmodmap

echo ""

echo "You might want to restart to allow the full config to take effect"
