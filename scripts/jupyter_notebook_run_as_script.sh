#!/bin/bash

# converts a jupyter notebook to python and runs it
# advantages: 
# - avoids problems with non-deleted variables in reruns
# - forces python to reload all libraries without restarting jupyter kernel

echo "jupyter notebook run as python"
nb=$1

echo "converting notebook $nb to python"
source $HOME/jupyter/bin/activate
jupyter nbconvert --to script "$1"
nbaspy=${nb%.ipynb}.py

echo "Running $nbaspy with python"
python3 "$nbaspy"

echo "Removing $nbaspy"
rm "$nbaspy"
