#!/bin/bash

moosefsmount=$(jetpack config moosefs.mountpoint)
masterip=$(jetpack config moosefs.masterip)

source /etc/os-release
if [[ "$ID" == "ubuntu" ]]; then
	apt install moosefs-client
elif [[ "$ID" == "centos" ]]; then
	yum install -y moosefs-client
else
	echo "unsupported OS" >&2
	exit 1	
fi

mkdir -p $moosefsmount
chmod 777 $moosefsmount
mfsmount $moosefsmount -H $masterip

