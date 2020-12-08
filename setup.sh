#!/bin/bash

# ensure up to date status
sudo apt update
supo apt upgrade
sudo apt install git neovim tmux curl

# actual setup
mkdir -p ~/.config/tmux
ln -s ./tmux.conf ~/.config/tmux/tmux.conf
mkdir -p ~/.config/nvim
ln -s ./init.vim ~/.config/nvim/init.vim


