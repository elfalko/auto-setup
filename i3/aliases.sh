#!/bin/bash

if command -v i3 >/dev/null 2>&1; then
    alias i3c="$EDITOR ~/.config/i3/config"
    alias fi3="exec startx"
fi
