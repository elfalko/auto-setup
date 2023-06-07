#!/bin/bash

PACLOG=/var/log/pacman.log
# separate oldest pacman log 
# update archlinux-keyring w noconfirm since that is always welcome
sudo mkdir -p /var/log/pacman.d/ &&
sudo mv $PACLOG /var/log/pacman.d/pacman.$(date +%y%m%d-%H%M%S).log &&
trizen -Sy --noconfirm archlinux-keyring && 
trizen -Syu "$@"; 
#some paclog highlighting
grep -i warn $PACLOG
grep -i pacnew $PACLOG
grep -i error $PACLOG
