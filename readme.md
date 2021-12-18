# auto setup

The aim here is to semi-automatically setup most distros to a usable state I like.

## goals

* `CapsLock` as `super`
* neovim with config
* tmux with config
* `.bash_aliases`
* fancy git aliases
* some basics installed
* if GUI: some tiling wm, currently sway/i3
* never keep anything personal in there (keys, data, whatever) so it can live on github freely

## setup

1. Clone to home
2. Run correct install script
3. Add the following to your `~/.bashrc`

    ``` bash
    if [ -f ~/bash/bashrc ]; then
        . ~/.bash/bashrc
    fi
    ```

4. run some install scripts for the programs you require

## todo

* dual screen sway: put somescript before dmenu to switch to output with less windows open
* export the lnnew command from somewhere for more modularity
* arch: setup trizen
* arch: x config stuff

