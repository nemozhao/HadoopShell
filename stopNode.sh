#!/usr/bin/expect

#call method:stopNode.sh nodeip nodepassword nodespath

set nodeip [lindex $argv 0]
set nodepassword [lindex $argv 1]
set nodespath [lindex $argv 2]

spawn ssh hadoop@$nodeip
expect "password:"
send "$nodepassword\n"
expect "\r\n"
send "$nodespath/hadoop-1.2.0/bin/hadoop-daemon.sh stop tasktracker\n"
expect "\r\n"
send "$nodespath/hadoop-1.2.0/bin/hadoop-daemon.sh stop datanode\n"
expect eof
exit