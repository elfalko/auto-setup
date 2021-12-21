#!/bin/bash

echo "Getting system up to date"
sudo apt update
sudo apt upgrade

echo "Getting dependencies"
sudo apt install git neovim tmux curl terminator\
    grim slurp \  # simple grimshot 
    jq \      # sway fancy output script, generally practical
    feh

# nice to haves
# gimp
# sway swaylock
# i3 i3lock
#
