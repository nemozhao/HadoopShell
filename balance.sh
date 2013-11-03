#!/usr/bin/expect
#balance
#call method:balance.sh nodeip nodepassword

set nodeip [lindex $argv 0]
set nodepassword [lindex $argv 1]
set nodespath [lindex $argv 2]

spawn ssh hadoop@$nodeip
expect "password:"
send "$nodepassword\n"
set timeout 10
expect "*$"
send "$nodespath/hadoop-1.2.0/bin/start-balancer.sh\n"
set timeout 10
expect "*$"
exit
