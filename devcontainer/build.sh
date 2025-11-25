#!/bin/bash

docker build -t falk/fdev:0.1.0 -t falk/fdev:latest .

docker images
