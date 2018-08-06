#!/bin/bash
# causes a force push of the currently checked out branch to origin

git push origin `git rev-parse --abbrev-ref HEAD`

exit

