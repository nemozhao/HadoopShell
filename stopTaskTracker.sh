#!/usr/bin/expect
#stop the tashktracker on the node
#call method:stopTaskTracker.sh nodeip nodepassword

spawn ssh hadoop@$1
expect "password:"
send "$2\r"
expect "$"
send "/home/hadoop/bin/