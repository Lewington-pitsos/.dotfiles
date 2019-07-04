#!/bin/bash
# Finds the 25 largest directories inside the current directory

DIRNAME=$1

du $DIRNAME | sort -rn | head -25

exit
