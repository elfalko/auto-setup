#!/bin/bash

VM=$(vboxmanage list vms | head -n 1 | cut -d'"' -f2)

vboxmanage startvm $VM
