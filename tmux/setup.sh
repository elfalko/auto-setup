#!/bin/bash
echo "TMUX"
TMUX_CONFIG=$HOME/.config/tmux
[ ! -L "$TMUX_CONFIG" ] && ln -s "$HOME"/auto-setup/tmux "$TMUX_CONFIG"
TPM_PATH="$HOME/.config/tmux/plugins/tpm"
if [ ! -d "$TPM_PATH" ]; then
  git clone https://github.com/tmux-plugins/tpm "$TPM_PATH"
else
  echo "$TPM_PATH already exists, so not cloning tmux-plugins again"
fi
