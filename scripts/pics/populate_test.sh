#!/bin/bash

rm -rf test_raw test _raw
mkdir -p test/sub
touch test/sub/1.jpg test/sub/1.cr3 test/2.jpg test/2.cr3

tree test
