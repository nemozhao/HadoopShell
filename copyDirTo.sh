#!/usr/bin/expect
#copy the dir to the node

#call method:copyDirTo.sh nodeip nodepassword sourcepath destinationpath
set timeout 60

set nodeip [lindex $argv 0]
set nodepassword [lindex $argv 1]
set sourcepath [lindex $argv 2]
set destinationpath [lindex $argv 3]

spawn scp -r $sourcepath hadoop@$nodeip:$destinationpath
expect "password:"
send "$nodepassword\n"
expect eof
exit