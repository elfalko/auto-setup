#!/bin/bash

# ensure up to date status
echo "Getting system up to date"
# sudo apt update
# supo apt upgrade

echo "Getting dependencies"
# sudo apt install git neovim tmux curl

# actual setup
echo "Setting up"
lnnew(){
    echo ""
    if [ -f "$2" ]; then
        echo "- $2 exists, either delete or run"
        echo "    mv $2 $2.old"
    else
	if [ -L "$2" ]; then
	    echo "- link $1 already exists, done"
	else
	    echo "- linking $1"
	    ln -s "$(pwd)/resources/$1" "$2" 
	fi
    fi
}

mkdir -p ~/.config/tmux
lnnew tmux.conf ~/.config/tmux/tmux.conf 

mkdir -p ~/.config/nvim
lnnew init.vim ~/.config/nvim/init.vim

lnnew pre-commit ./.git/hooks/pre-commit

lnnew .bash_aliases ~/.bash_aliases

echo "You might want to run the following to update"
echo "  bash"
