#!/bin/bash

useradd -m  -d /var/www $FTP_USER && echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

mkdir -p /var/run/vsftpd/empty

chown -R $FTP_USER:$FTP_USER /var/www/

exec /usr/sbin/vsftpd /etc/vsftpd.conf