#!/bin/bash

# script to set up some basics so pacman stops complaining
sudo sed -i -e "s/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/" /etc/locale.gen
locale-gen
localectl set-locale LANG=en_US.UTF-8
