#!/usr/bin/expect

#call method:makeDir.sh nodeip nodepassword path

set nodeip [lindex $argv 0]
set nodepassword [lindex $argv 1]
set path [lindex $argv 2]

spawn ssh hadoop@$nodeip
expect "password:"
send "$nodepassword\n"
expect "\r\n"
send "mkdir $path\n"
expect eof
exit
