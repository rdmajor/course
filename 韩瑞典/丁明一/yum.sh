#!/bin/bash
expect << eof
spawn ssh -o StrictHostKeyChecking=no $1
expect "password" {send "123456\n"}
expect "#" {send "rm -rf /etc/yum.repos.d/*\n"}
expect "#" {send "yum-config-manager --add ftp://192.168.4.254/rhel7\n"}
expect "#" {send "echo gpgcheck=0 >> /etc/yum.repos.d/*\n"}
expect "#" {send "yum repolist | awk '/repolist/{print $2}'\n"}
eof
