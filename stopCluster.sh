#!/usr/bin/expect

#call method:stopCluster.sh masterip masterpassword nodespath

set masterip [lindex $argv 0]
set masterpassword [lindex $argv 1]
set nodespath [lindex $argv 2]
set timeout 30

spawn ssh hadoop@$masterip
expect "password:"
send "$masterpassword\n"
expect "\r\n"
send "$nodespath/hadoop-1.2.0/bin/stop-all.sh\n"
expect eof
exit
