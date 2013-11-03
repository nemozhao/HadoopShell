#!/usr/bin/expect

#call method:check.sh nodeip nodepassword

set nodeip [lindex $argv 0]
set nodepassword [lindex $argv 1]
set nodesPath [lindex $argv 2]

spawn ssh hadoop@$nodeip
expect "password:"
send "$nodepassword\n"
expect "\r\n"
send "$nodesPath/jdk1.7.0_02/bin/jps\n"
expect eof
exit