#!/bin/bash

# ensure up to date status
echo "Getting system up to date"
# sudo apt update
# supo apt upgrade

echo "Getting dependencies"
# sudo apt install git neovim tmux curl

# actual setup
echo "Setting up files"

# links to a resource file 
# $1: link target in resources ./resource/$1
# $2: name of link
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

lnnew .inputrc ~/.inputrc

lnnew .gitconfig ~/.gitconfig

lnnew .Xmodmap ~/.Xmodmap
lnnew .Xresources ~/.config/regolith/Xresources

echo ""
echo "Adding user $(whoami) to vboxsf for shared folder access:"
# add user to group able to access shared folders
if groups $(whoami) | grep -q "\bvboxsf\b"; then
    echo "  $(whoami) is already in vboxsf"
else
    sudo usermod -aG vboxsf $(whoami) 
fi
echo ""

echo "You might want to restart to allow the full config to take effect"

