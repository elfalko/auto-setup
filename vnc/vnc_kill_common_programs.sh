#!/bin/bash

# Some programs don't open again easily

for program in firefox thunderbird mattermost-desktop
do
    killall $program
done
