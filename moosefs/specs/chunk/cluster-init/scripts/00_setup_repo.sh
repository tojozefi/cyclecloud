#!/bin/bash

wget -O - https://ppa.moosefs.com/moosefs.key | apt-key add -
echo "deb http://ppa.moosefs.com/moosefs-3/apt/ubuntu/bionic bionic main" > /etc/apt/sources.list.d/moosefs.list
apt update
