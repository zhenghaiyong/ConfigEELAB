#!/bin/sh
# Ping网段所有IP
# 2012/02/05
ip=101 #修改初值
output=log
while [ $ip != "120" ]; do
#yes正常，no主机不存在或不正常
ping -c 2 192.168.1.$ip | grep -q "ttl=" && (echo "192.168.1.$ip yes";echo "192.168.1.$ip yes" >> $output;./serverExpect.sh 192.168.1.$ip) || (echo "192.168.1.$ip no";echo "192.168.1.$ip no">>$output)
ip=`expr "$ip" "+" "1"`
done
