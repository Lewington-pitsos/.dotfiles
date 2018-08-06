#!/bin/bash

yes | sudo apt-get purge nfs-kernel-server nfs-common
yes | sudo apt-get install nfs-kernel-server nfs-common

exit
