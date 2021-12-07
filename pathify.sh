##!/bin/bash

# takes all .sh files in any directory in the current directory and
# => makes them all executable
# => copies all of them to /usr/local/bin/ without the .sh extension
# => changes the ownership of all files in
#    /usr/local/bin to tyhe louka user

chmod u+rx ./**/*.sh
for f in ./**/*.sh; do cp $f /usr/local/bin/`basename $f .sh`; done;

chown lewington:lewington /usr/local/bin/*

exit
