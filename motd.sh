#!/bin/bash
#
# Edit /etc/motd File Script
# config: /etc/motd
#
# Copyright (c) 2011 Kazuhisa Hara (https://github.com/kazuhisya)
#
# Released under an MIT-style license.
# 
# Usage: setting root`s .bashrc
#      if [ $TERM = "xterm" ];then
#        /path/to/motd.sh
#      fi


OrigMotd ()
{
if [ ! -f /etc/motd.orig ]; then
cp /etc/motd /etc/motd.orig
fi
}
echo "-------------------------------------------------------" > /etc/motd
LoginCopyright ()
{
if [ -f /etc/redhat-release ]; then
RELEASE=`cat /etc/redhat-release`
echo "$RELEASE" >> /etc/motd
echo "-------------------------------------------------------" >> /etc/motd
fi
echo "Copyright 2010 Kazuhisa Hara" >> /etc/motd
echo "All Rights Reserved." >> /etc/motd
}

ServerInfo ()
{
set -- `/bin/uname -a`
KERNEL=`/bin/uname -srmo`
HOSTNAME=`hostname`
DNSDOMAINNAME=`hostname -d`

echo "-------------------------------------------------------" >> /etc/motd
echo "Hostname: $HOSTNAME" >> /etc/motd
echo "DNS Domain: $DNSDOMAINNAME" >> /etc/motd
echo "Kernel: $KERNEL" >> /etc/motd
echo "-------------------------------------------------------" >> /etc/motd
}

IPInfo()
{
ifconfig|grep "inet addr" \
| sed -e /127.0.0.1/d \
| sed -e 's/[ ]*inet //' \
>> /etc/motd
}

OrigMotd
LoginCopyright
ServerInfo
IPInfo

exit 0

