#!/usr/bin/expect
#refresh namenode
#call method:refreshnamenode.sh masterip masterpassword nodespath

set masterip [lindex $argv 0]
set masterpassword [lindex $argv 1]
set nodespath [lindex $argv 2]

spawn ssh hadoop@$masterip
expect {
	"password:" {
	}
	eof 
}
send "$masterpassword\n"
expect "\r\n"
send "$nodespath/hadoop-1.2.0/bin/hadoop dfsadmin -refreshNodes\n"
expect "\r\n"
send "$nodespath/hadoop-1.2.0/bin/hadoop mradmin -refreshNodes\n"
expect eof
exit
