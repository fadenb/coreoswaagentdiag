#!/bin/bash

/opt/omi/bin/omiserver --configfile=/etc/opt/omi/conf/omiserver.conf -d
/usr/sbin/waagent -daemon

