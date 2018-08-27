#!/bin/bash
expect << EOF
spawn virsh console $1
expect "]"  {send "\n"};
expect "login" {send "root\n"};
expect "密码"  {send "123456\n"};
expect "#"   {send "nmcli connection modify eth0 autoconnect yes ipv4.method manual ipv4.address $2/24\n" };
expect "#"  {send "nmcli connection up eth0\n"};
expect "#" {send "hahhaha\n"};
EOF
