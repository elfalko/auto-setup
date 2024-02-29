#!/bin/bash

if [ -z $SSH_AGENT_PID ]; then
    SSHDIR=$HOME/.ssh
    eval $(ssh-agent -s)
    chmod 600 $SSHDIR/id_rsa
    ssh-add $SSHDIR/id_rsa
else
    echo "SSH_AGENT_PID: $SSH_AGENT_PID - not doing anything"
fi
