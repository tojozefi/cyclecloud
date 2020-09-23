#!/bin/bash

apt install moosefs-master moosefs-cgi moosefs-cgiserv moosefs-cli

echo "MFSMASTER_ENABLE=true" > /etc/default/moosefs-master

mfsmaster start
mfscgiserv start
