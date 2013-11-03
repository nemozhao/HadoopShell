#!/usr/bin/expect
#this shell is to copy file to another node
#call method:copyTo.sh nodeip nodepassword sourcefile path

set nodeip [lindex $argv 0]
set nodepassword [lindex $argv 1]
set sourcefile [lindex $argv 2]
set path [lindex $argv 3]

spawn scp $sourcefile hadoop@$nodeip:$path
expect "password:"
send "$nodepassword\n"
expect eof
exit
