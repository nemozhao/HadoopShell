#!/usr/bin/expect
#make the master produce a public key
#install ssh to make the nodes can connect with each other via a password-less ssh login
#call method：install-master.sh masterip masterpassword
#install path:/home/hadoop/.ssh

set masterip [lindex $argv 0]
set masterpassword [lindex $argv 1]

spawn ssh hadoop@$masterip
expect {
	"(yes/no)?" {		
		send "yes\n"
		exp_continue
	}
	"password:" {		
		send "$masterpassword\n"
		expect "\r\n"
		send "ssh-keygen -t rsa -P ''\n"
		expect "(/home/hadoop/.ssh/id_rsa):"
		send "\r"
		expect "(y/n)"
		send "y\r"
		expect "\r\n"
		send "cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys\n"
		expect "\r\n"
		send "chmod 600 ~/.ssh/authorized_keys\n"
		expect "\r\n"
		send "ssh localhost\n"
		expect "(yes/no)?"
		send "yes\n"
		expect eof
	}
	eof
}
exit

