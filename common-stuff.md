# Common stuff

This just collects common procedures so I don't have to look them up every time

## Linux

### Add SSH key to agent

```
eval `ssh-agent`
# Agent pid 9000
ssh-add ~/.ssh/<key>.pub
cat ~/.ssh/id_rsa.pub | xclip -sel clip
ssh -T git@bitbucket.com
```

### bashscripting

TL;DR

```bash
set -euxo pipefail
IFS=$'\n\t'
```

[Why -x](https://gist.github.com/mohanpedala/1e2ff5661761d3abd0385e8223e16425)

[Original: Unofficial Bash Strict Mode](http://redsymbol.net/articles/unofficial-bash-strict-mode/)

## Windows

Win+r > `shell:startup` to drag in desktop symbols to run at startup

Access WSL2 file system from windows: File explorer > `\\wsl$` - [explanation](https://devblogs.microsoft.com/commandline/access-linux-filesystems-in-windows-and-wsl-2/)

Reset WSL2 user pw if you forgot it: boot into root using `wsl --user root` and `passwd <user>`
