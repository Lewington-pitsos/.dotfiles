#!/bin/bash
# adds all changes and then makes a fixup commit for the
# passed in hash

git add *
git add -A
git commit --fixup HEAD

exit


