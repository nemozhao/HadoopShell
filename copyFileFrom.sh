#!/usr/bin/expect
#this shell is to copy file from another node
#call method:copyFileFrom.sh nodeip nodepassword sourcefile destinationpath

set nodeip [lindex $argv 0]
set nodepassword [lindex $argv 1]
set sourcefile [lindex $argv 2]
set destinationpath [lindex $argv 3]

spawn scp hadoop@$nodeip:$sourcefile $destinationpath
expect "password:"
send "$nodepassword\n"
expect eof
exit
