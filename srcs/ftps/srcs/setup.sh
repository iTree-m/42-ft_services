#!/bin/sh

echo "Starting telegraf .."
telegraf &

echo "Starting vsftpd service.."
rc-service vsftpd start 2>&1
sleep 2

while true;
do
	if ! pgrep vsftpd 2>&1 ; then
		echo "FTPS is down :/"
		echo "Quitting... -_-"
		exit 1
	else
		echo "FTPS is up ^_^"
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
