#!/bin/bash

if [ -z $SSH_AGENT_PID ]; then
    SSHDIR=$HOME/.ssh
    eval $(ssh-agent -s)
    chmod 600 $SSHDIR/id_rsa
    ssh-add $SSHDIR/id_rsa
    chmod 600 $SSHDIR/github_elfalko
    ssh-add $SSHDIR/github_elfalko
else
    echo "SSH_AGENT_PID: $SSH_AGENT_PID - not doing anything"
fi
