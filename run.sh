#!/bin/sh
# Ping网段所有IP
# 2012/02/05
ip=1 #修改初值
output=log
while [ $ip != "255" ]; do
#yes正常，no主机不存在或不正常
ping -c 2 192.168.0.$ip  | grep -q "ttl=" && (echo "192.168.0.$ip yes";echo "192.168.0.$ip yes" >> $output;./serverExpect.sh 192.168.0.$ip) || (echo "192.168.0.$ip no";echo "192.168.0.$ip no">>$output)
ip=`expr "$ip" "+" "1"`
done
