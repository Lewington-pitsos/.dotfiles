#!/bin/bash
# causes a force push of the currently checked out branch to origin

git push -f origin `git rev-parse --abbrev-ref HEAD`

exit




