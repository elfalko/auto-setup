#!/bin/bash

#checks out if an xampp server is running

status=`/opt/lampp/lampp status`
if [[ $status = *"Apache is running."* ]]; then
  echo 'LAMP';
  echo 'LAMP';
fi
