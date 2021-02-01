#!/bin/sh

echo "Starting telegraf..."
telegraf &

echo "Starting Nginx..."
rc-service nginx start 2>&1

echo "Starting sshd Service..."
rc-service sshd restart 2>&1

sleep 1

while true;
do
	if ! pgrep nginx 2>&1 ; then
		echo "Nginx Server is down :/"
		echo "Quitting... -_-"
		exit 1
	else
		echo "Nginx is up ^_^"
	fi
	if ! pgrep sshd 2>&1 ; then
		echo "sshd Service is down :/"
		echo "Quitting... -_-"
		exit 1
	else
		echo "sshd is up ^_^"
	fi
	if ! pgrep telegraf 2>&1 ; then
		echo "telegraf is down :/"
		echo "Quitting... -_-"
		exit 1
	else
		echo "telegraf is up ^_^"
	fi
	sleep 2
done

exit 0
