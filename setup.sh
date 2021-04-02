#!/bin/bash

linkcmd="/bin/bash ./scripts/lnnew.sh"
# actual setup
echo "Setting up files"

mkdir -p ~/.config/tmux
$linkcmd tmux.conf ~/.config/tmux/tmux.conf 

mkdir -p ~/.config/nvim
$linkcmd init.vim ~/.config/nvim/init.vim

$linkcmd pre-commit ./.git/hooks/pre-commit

$linkcmd .bash_aliases ~/.bash_aliases

$linkcmd .inputrc ~/.inputrc

$linkcmd .gitconfig ~/.gitconfig

$linkcmd .Xmodmap ~/.Xmodmap

$linkcmd .vimrc ~/.vimrc

sudo $linkcmd .vimrc /root/.vimrc

echo ""

echo "You might want to restart to allow the full config to take effect"

