#!/bin/sh
ps -ef > file
​
if [ $(grep "/usr/sbin/sshd" file | wc -l) -gt 0 ] && [ $(grep "nginx" file | wc -l) -gt 0 ];
then
        echo "All processes are working"
else
        echo "There is a problem" && exit 1
fi