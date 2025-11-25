#!/bin/bash

ln -s $HOME/auto-setup/nvim $HOME/.config/nvim

# ./jdhao_c_setup.sh
# ./setup_coc.sh

$EDITOR +:PlugInstall

# trizen -Sy basedpyright \
#   shellcheck shfmt bash-language-server
# npm i -g pyright
