#!/bin/bash

echo "NVIM"
NVIM_CONFIG=$HOME/.config/nvim
if [ ! -L $NVIM_CONFIG ]; then
  ln -s $HOME/auto-setup/nvim $NVIM_CONFIG
else
  echo "$NVIM_CONFIG is already linked"
fi

# ./jdhao_c_setup.sh
# ./setup_coc.sh

$EDITOR +:PlugInstall

# trizen -Sy basedpyright \
#   shellcheck shfmt bash-language-server \
#   vim-language-server lua-language-server
# npm i -g pyright
