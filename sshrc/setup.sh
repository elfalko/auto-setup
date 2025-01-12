#!/bin/bash

set -x


cd $HOME/Downloads &&
wget https://raw.githubusercontent.com/cdown/sshrc/master/sshrc &&
chmod +x sshrc &&
sudo mv sshrc /usr/local/bin

ln -s $HOME/auto-setup/sshrc/sshrc $HOME/.sshrc
ln -s $HOME/auto-setup/sshrc/sshrc.d $HOME/.sshrc.d

mkdir $HOME/sshrc/sshrc.d/ssh
echo "Don't forget to link/create your keys in sshrc.d/ssh/sshrc_id_*!"
echo "  ln -s <yourkey> sshrc.d/ssh/sshrc_id_*"

set +x
