#!/usr/bin/expect
#start a node alone
#call method:startNode.sh nodeip nodepassword nodespath

set nodeip [lindex $argv 0]
set nodepassword [lindex $argv 1]
set nodespath [lindex $argv 2]

spawn ssh hadoop@$nodeip
expect "password:"
send "$nodepassword\n"
expect "\r\n"
send "$nodespath/hadoop-1.2.0/bin/hadoop-daemon.sh start datanode\n"
set timeout 3
expect "*$"
send "$nodespath/hadoop-1.2.0/bin/hadoop-daemon.sh start tasktracker\n"
expect eof
exit