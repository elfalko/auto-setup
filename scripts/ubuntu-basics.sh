#!/bin/bash

echo "Getting system up to date"
sudo apt update
supo apt upgrade

echo "Getting dependencies"
sudo apt install git neovim tmux curl
