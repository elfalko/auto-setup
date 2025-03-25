#!/bin/bash
#
cat >> ~/.gitconfig << EOF
[include]
  path = ~/auto-setup/git/gitconfig
EOF

# ln -s ~/auto-setup/git/gitconfig ~/.gitconfig
# cp ~/auto-setup/git/gitlocalenv.sh
$EDITOR ~/.gitconfig ~/auto-setup/git/gitlocalenv.sh 
