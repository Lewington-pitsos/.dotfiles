#!/bin/bash
# alias for git add and git commit with a commit message from the first argument

# Check if a commit message was provided
if [ -z "$1" ]; then
  echo "Error: No commit message provided."
  echo "Usage: $0 <commit-message>"
  exit 1
fi

git add -A
git commit -m "$1"

exit
