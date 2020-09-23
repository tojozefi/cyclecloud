#!/bin/bash

moosefsroot=$(jetpack config moosefs.rootdir)
masterip=$(jetpack config moosefs.masterip)

apt install moosefs-chunkserver
chown mfs:mfs $moosefsroot
chmod 770 $moosefsroot
echo MFSCHUNKSERVER_ENABLE=true > /etc/default/moosefs-chunkserver
echo MASTER_HOST=$masterip >> /etc/mfs/mfschunkserver.cfg
echo $moosefsroot >> /etc/mfs/mfshdd.cfg
mfschunkserver start
