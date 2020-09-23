#!/bin/bash

moosefsroot=$(jetpack config moosefs.rootdir)
masterip=$(jetpack config moosefs.masterip)

apt install moosefs-client
mkdir $moosefsroot
chmod 777 $moosefsroot
mfsmount $moosefsroot -H $masterip
