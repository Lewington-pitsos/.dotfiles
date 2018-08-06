#!/bin/bash
# pulls to master and then rebases the current branch onto master 


BRANCH=$(git rev-parse --abbrev-ref HEAD)

git checkout master
git pull
git checkout $BRANCH
git rebase master

exit
