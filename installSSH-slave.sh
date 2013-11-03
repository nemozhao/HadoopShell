#!/usr/bin/expect
#install ssh to make the nodes can connect with each other via a password-less ssh login
#call method:installSSH-slave.sh masterip masterpasswrod tmpPath slaveip slavepassword

set masterip [lindex $argv 0]
set masterpassword [lindex $argv 1]
set tmpPath [lindex $argv 2]
set slaveip [lindex $argv 3]
set slavepassword [lindex $argv 4]

spawn scp hadoop@$masterip:~/.ssh/id_rsa.pub $tmpPath
expect {
	"password:" {
		send "$masterpassword\n"
		exp_continue
	}
	eof
}
spawn scp $tmpPath/id_rsa.pub hadoop@$slaveip:~
expect {
	"(yes/no)?"
	{		
		send "yes\n"
		exp_continue
	}
	"password:" {
		send "$slavepassword\n"
		exp_continue
	}
	eof
}
spawn ssh hadoop@$slaveip
expect "password:" 
send "$slavepassword\n" 
expect "\r\n"
send "chmod 700 ~/.ssh\n"
expect "\r\n"
send "cat ~/id_rsa.pub >> ~/.ssh/authorized_keys\n"
expect "\r\n"
send "chmod 600 ~/.ssh/authorized_keys\n"
expect "\r\n"
send "rm ~/id_rsa.pub\n"
expect eof
exit

#以上完成了master到slave的无密码登录，下面实现slave到master的无密码登录
#send "ssh-keygen -t rsa -P ''"
#expect "(/home/hadoop/.ssh/id_rsa):"
#send "\r"
#expect "(y/n)"
#send "y\r"
#expect "$"
#send "cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys"
#expect "$"
#send "scp ~/.ssh/id_rsa.pub hadoop@$masterip:~/"
#expect "(yes/no)?"
#send "yes\r"
#expect "password:"
#send "$masterpassword\r"
#expect "$"
#exit the slave
#exit

#now you are on the master
#send "cat ~/id_rsa.pub >> ~/.ssh/authorized_keys"
#expect "$"
#send "rm ~/id_rsa.pub"
#expect "$"
#exit

