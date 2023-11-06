#!/bin/bash

SSHDIR=$USER/.ssh
eval $(ssh-agent -s)
ssh-add $SSHDIR/id*