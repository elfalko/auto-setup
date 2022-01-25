#!/bin/bash

set -euxo pipefail

ln -s $FAUTOSETUP/vnc ~/.vnc

sudo cp $FAUTOSETUP/vnc/vncserver@.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable --now vncserver@3.service
