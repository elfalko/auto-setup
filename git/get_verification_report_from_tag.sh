#!/bin/bash

# This tool checks out the verification reports of the given versions and saves them as verification-report.<git-commit-tag>.pdf

VREP_NAME="VerificationReport.pdf"
VREP_PATH="safety_designer"
VREP_FULL="$VREP_PATH/$VREP_NAME"
TAG=$(echo $1 | tr '/' '_')
VREP_TAG="${VREP_FULL%.pdf}-$TAG.pdf"

# Check if there are uncommitted changes
if [[ $(git status | grep $VREP_NAME) && return ]]
then
    echo "Found uncommitted changes with $VREP_NAME, fix them first."
    return 1
fi

echo "Retrieving $VREP_FULL from $1 and moving it to $VREP_TAG"
git checkout $1 $VREP_FULL
mv $VREP_FULL $VREP_TAG
echo "Restoring original $VREP_FULL"
git checkout HEAD $VREP_FULL
