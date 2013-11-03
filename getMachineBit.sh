#!/usr/bin/expect

#call method:getMachineBit.sh nodeip nodepassword

set nodeip [lindex $argv 0]
set nodepassword [lindex $argv 1]

spawn ssh hadoop@$nodeip
expect "password:"
send "$nodepassword\n"
expect "\r\n"
send "getconf LONG_BIT\n"
expect eof
send "exit\n"