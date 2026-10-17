# auto setup

The aim here is to semi-automatically setup most distros to a usable state I like.

## goals

* bash aliases
  * generic bash aliases in this repo
  * auto loads all aliases in `~/.bash_individual_aliases` if they exist as well
    * allows separation of work, home, server aliases
* Custom x keyboard setup
  * `CapsLock` as `super`
  * German umlauts (ä/Ä,ö/Ö,ü/Ü,ß/ẞ) on a, o, u, s
  * alt gr layer
* configs for many programs
  * each program gets a folder
  * aliases mostly go in `<program>/aliases.sh` for easy sourcing
  * setup script in `<program>/setup.sh` for easy installation
  * docs where necessary in the folders
* never keep anything personal in there (keys, data, whatever) so it can live on github freely

## setup

``` bash
git clone https://github.com/elfalko/auto-setup
```

add the following to your bashrc
``` bash
if [ -f $HOME/auto-setup/bash/bashrc ]; then
    . $HOME/auto-setup/bash/bashrc
fi
```
