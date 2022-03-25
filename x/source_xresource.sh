#!/bin/bash

set -e

ln -s ~/auto-setup/x/.Xresources ~/.Xresources
xrdb ~/.Xresources
