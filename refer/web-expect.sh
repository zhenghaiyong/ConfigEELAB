#!/usr/bin/expect
set host [lindex $argv 0]
set timeout -1
spawn ssh shizhensheng@$host
#expect "shizhensheng@$host's password: "
expect {  
    "*yes/no*" { send "yes\r"; exp_continue}  
    "*password:" { send "20151030shice\r" }  
} 
sleep 5
#send "20151030shice\r"
#send "cd ./tmp/\r"
#send "mkdir test\r"
send "sh /home/shizhensheng/developer/eduevlt-build-deploy/eduevltsrvfront-build-deploy.sh\r"
send "sh /home/shizhensheng/developer/eduevlt-build-deploy/eduevltsrv-build-deploy.sh\r"
send "exit\r"
#interact
expect eof
exit
