#!/bin/bash
# adds all changes and then makes a fixup commit for the
# passed in hash

HASH=$1
git add *
git add -A
git commit --fixup $HASH

exit


