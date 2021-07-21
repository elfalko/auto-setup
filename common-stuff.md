# Common stuff
This just collects common procedures so I don't have to look them up every time

# Add SSH key to agent
```
eval `ssh-agent`
# Agent pid 9000
ssh-add ~/.ssh/<key>.pub
cat ~/.ssh/id_rsa.pub | xclip -sel clip
ssh -T git@bitbucket.com
```
