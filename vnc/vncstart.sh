#!/bin/bash

systemctl start vncserver@3
sleep 2
systemctl status vncserver@3
