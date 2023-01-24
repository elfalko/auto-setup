#!/bin/bash

cd $HOME/Downloads &&
wget https://raw.githubusercontent.com/cdown/sshrc/master/sshrc &&
chmod +x sshrc &&
sudo mv sshrc /usr/local/bin

ln -s $HOME/auto-setup/sshrc/sshrc $HOME/.sshrc
ln -s $HOME/auto-setup/sshrc/sshrc.d $HOME/.sshrc.d
