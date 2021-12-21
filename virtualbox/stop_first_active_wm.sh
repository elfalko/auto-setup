#!/bin/bash

VM=$(vboxmanage list runningvms | head -n 1 | cut -d'"' -f2)

vboxmanage controlvm $VM poweroff
