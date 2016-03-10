#!/usr/bin/expect

if { [llength $argv] != 1 } {
	puts "Usage: $argv0 HOST"
	exit 7
}

set HOST [lindex $argv 0]
set USER "root"
set PWD "oucee"
set GROUP1 "2016SpringOUCEECPL1"
set GROUP2 "2016SpringOUCEECPL2"
set clientUserList1 "clientUserList1.txt"
set clientUserList2 "clientUserList2.txt"
set clientGroupUserSudoSH "clientGroupUserSudo.sh"
set DEST_DIR "/root"
set timeout -1

spawn scp ${clientGroupUserSudoSH} ${clientUserList1} ${clientUserList2} ${USER}@${HOST}:${DEST_DIR}
expect {
    "*yes/no*" { send "yes\r"; exp_continue }
    "*assword:" { send "${PWD}\r" }
}
expect "100%"

spawn ssh root@${HOST}
expect {  
    "*yes/no*" { send "yes\r"; exp_continue }
    "*assword:" { send "${PWD}\r" }
}
expect "#"
send "chmod a+x ${DEST_DIR}/*.sh\r"
expect "#"
send "${DEST_DIR}/${clientGroupUserSudoSH} ${GROUP1} ${clientUserList1}\r"
expect "#"
send "${DEST_DIR}/${clientGroupUserSudoSH} ${GROUP2} ${clientUserList2}\r"
expect "#"
send "exit\r"
expect eof
