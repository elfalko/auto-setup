#!/bin/bash

# check if WSL 2
if grep -qEi "(Microsoft|WSL)" /proc/version &> /dev/null ; then
    # echo "Windows 10 Bash"
    export DISPLAY=$(grep -m 1 nameserver /etc/resolv.conf | awk '{print $2}'):0

    # to make WSL VSCode integration work with windows terminal, from WSL terminal 
    # which code 
    alias code="/mnt/c/Program\ Files/Microsoft\ VS\ Code/bin/code"
fi

# https://sourceforge.net/projects/vcxsrv/files/latest/download
# "C:\Program Files\VcXsrv\vcxsrv.exe" :0 -ac -terminate -lesspointer -multiwindow -clipboard -wgl -dpi auto
# netstat -abno|findstr 6000 (admin Powershell)
# Windows Defender Firewall with Advanced Security > Inbound Rules > New Rule > Program > %ProgramFiles%\VcXsrv\vcxsrv.exe
# if that works
# win+r shell:startup
# copy shortcut in there
#
# https://medium.com/javarevisited/using-wsl-2-with-x-server-linux-on-windows-a372263533c3
# https://www.shogan.co.uk/how-tos/wsl2-gui-x-server-using-vcxsrv/
