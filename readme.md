# Regolith auto setup
The aim here is to automatically setup a Regolith distro to usable state
My requirements:
* `CapsLock` as `super`
* neovim with config
* tmux with config
* `.bash_aliases`
* fancy git aliases
* some basics installed

## features
* `t` starts tmux with config in `~/.config/tmux/tmux.conf`
* `v` starts nvim with config in `~/.config/nvim/init.vim` (which auto downloads plugins if curl is installed)
* pre-commit hook gets the latest of these files before a commit

## todo
* git hook the following:
    * .inputrc
    * .bashrc
    * .git stuff
