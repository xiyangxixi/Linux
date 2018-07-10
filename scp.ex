#! /usr/bin/expect
set timeout 10
set host [lindex $argv 0]
set username [lindex $argv 1]
set password [lindex $argv 2]
set src_file [lindex $argv 3]
set dest_file [lindex $argv 4]
spawn scp $src_file $username@$host:$dest_file
expect {
"(yes/no)?"
    {
     send "yes\n"
     expect "*password:" { send "$password\n"}
  }
"*password:"
{
  send "$password\n"
}
}
expect "100%"
expect eof
