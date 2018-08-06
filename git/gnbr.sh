#!/bin/bash
# checks out master, pulls, and then checkes out a new branch
# with the passed in value as a name

NAME=$1
git checkout master
git pull
git checkout -b $NAME

exit
