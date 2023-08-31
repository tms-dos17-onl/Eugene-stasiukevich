#!/bin/bash

sudo useradd testuser -d /home/user -m

sysinfo=/home/user/sysinfo.info;

#echo $userhomedir

echo ====CPU==== >> $sysinfo
lscpu >> $sysinfo

echo ====Drive==== >> $sysinfo
lsblk >> $sysinfo

echo ====Name==== >> $sysinfo
uname >> $sysinfo

echo ====Filesystem >> $sysinfo
df >> $sysinfo
