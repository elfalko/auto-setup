# auto setup

The aim here is to semi-automatically setup most distros to a usable state I like.

## goals

* so many bash shortcuts
* Custom x keyboard setup
    * `CapsLock` as `super`
    * German umlauts on a, o, u, s
    * alt gr layer
* configs for many programs
  * nvim
  * vim
  * ranger
  * git
  * gitui
  * many more, basically just look at the folder names
* i3 config
  * multi monitor switching scripts
* sway config

* never keep anything personal in there (keys, data, whatever) so it can live on github freely

## setup

``` bash
git clone https://github.com/elfalko/auto-setup
```

add the following to your bashrc
``` bash
if [ -f ~/auto-setup/bash/bashrc ]; then
    . ~/auto-setup/bash/bashrc
fi
```

By default, most folders contain setup scripts to source the config and get stuff running.
