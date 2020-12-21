#!/bin/bash

echo "Getting system up to date"
pacman -Syu

echo "Getting dependencies"
pacman -Sy git neovim tmux curl
