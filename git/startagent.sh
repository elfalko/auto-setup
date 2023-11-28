#!/bin/bash


SSHDIR=$HOME/.ssh
eval $(ssh-agent -s)
chmod 600 $SSHDIR/id_rsa
ssh-add $SSHDIR/id_rsa
