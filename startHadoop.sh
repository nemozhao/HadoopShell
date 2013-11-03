#!/usr/bin/expect
#start the hadoop
#format firstly,then start!

#call method:startHadoop.sh masterip masterpassword hadooppath

set masterip [lindex $argv 0]
set masterpassword [lindex $argv 1]
set hadooppath [lindex $argv 2]

spawn ssh hadoop@$masterip
expect "password:"
send "$masterpassword\n"
expect "\r\n"
send "$hadooppath/hadoop-1.2.0/bin/hadoop namenode -format\n"
expect "\r\n"
send "$hadooppath/hadoop-1.2.0/bin/start-all.sh\n"
expect eof
exit
