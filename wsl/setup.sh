#!/bin/bash

cp $HOME/auto-setup/wsl/.wslconfig "$(wslpath 'C:\Users\YourUsername\.wslconfig')"
wsl --shutdown
