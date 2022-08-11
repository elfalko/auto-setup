#!/bin/bash

# Some programs don't open again easily


for program in firefox thunderbird mattermost
do
    killall $program
    $program
done

killall -n $(pgrep DesktopEditors)
