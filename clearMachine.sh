#!/usr/bin/expect

#call method:clearMachine.sh nodeip nodepassword nodespath

set nodeip [lindex $argv 0]
set nodepassword [lindex $argv 1]
set nodespath [lindex $argv 2]

spawn ssh hadoop@$nodeip
expect "password:"
send "$nodepassword\n"
expect "\r\n"
send "sudo rm -r $nodespath/hadoop* $nodespath/jdk1.7.0_02\n"
expect "password for hadoop:"
send "$nodepassword\n"
expect eof
exit
