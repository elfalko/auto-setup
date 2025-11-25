#!/bin/bash
#
cat > ~/.gitconfig << EOF
[user]
  name = Falk Schoenfeld
  email = falk.fairfield@gmail.com
[include]
  path = ~/auto-setup/git/gitconfig
EOF

# ln -s ~/auto-setup/git/gitconfig ~/.gitconfig
# cp ~/auto-setup/git/gitlocalenv.sh
$EDITOR -O ~/.gitconfig ~/auto-setup/git/gitlocalenv.sh
