#!/bin/bash

mvold(){
    if [ -f "$1" ]; then
	echo "$1 exists, moving to $1.old"
        mv $1 $1.old
    fi
    if [ -L "$1" ]; then
	echo "link $1 exists, removing"
        rm $1
    fi
}

mvold ~/.config/tmux/tmux.conf
mvold ~/.config/nvim/init.vim
mvold ./.git/hooks/pre-commit
mvold ~/.bash_aliases



