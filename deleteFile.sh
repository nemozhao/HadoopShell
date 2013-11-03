#!/usr/bin/expect

#call method:deleteFile.sh nodeip nodepassword file

set nodeip [lindex $argv 0]
set nodepassword [lindex $argv 1]
set file [lindex $argv 2]

spawn ssh hadoop@$nodeip
expect "password:"
send "$nodepassword\n"
expect "\r\n"
send "rm -r $file\n"
expect eof
send "exit\n"