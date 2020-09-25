#!/bin/bash

source /etc/os-release
if [[ "$ID" == "ubuntu" ]]; then
	wget -O - https://ppa.moosefs.com/moosefs.key | apt-key add -
	echo "deb http://ppa.moosefs.com/moosefs-3/apt/ubuntu/bionic bionic main" > /etc/apt/sources.list.d/moosefs.list
	apt update
elif [[ "$ID" == "centos" ]]; then
	curl "https://ppa.moosefs.com/RPM-GPG-KEY-MooseFS" > /etc/pki/rpm-gpg/RPM-GPG-KEY-MooseFS
	curl "http://ppa.moosefs.com/MooseFS-3-el${VERSION_ID}.repo" > /etc/yum.repos.d/MooseFS.repo
else
	echo "unsupported OS" >&2
	exit 1
fi
