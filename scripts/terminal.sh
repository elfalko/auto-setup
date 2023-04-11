#!/bin/bash

DIR=$1

urxvt -cd $DIR || \
    terminator --working-directory=$DIR || \
    alacritty --working-directory $DIR || \
    x-terminal-emulator --working-directory=$DIR || \
    xterm --working-directory=$DIR || \
    notify-send 'No terminal'
