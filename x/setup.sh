#!/bin/bash

set -e

sudo usermod -aG tty $USER
$PKG_MANAGER xorg-server xorg-apps xorg-init arandr
ln -s ~/auto-setup/x/.Xresources ~/.Xresources
xrdb ~/.Xresources
