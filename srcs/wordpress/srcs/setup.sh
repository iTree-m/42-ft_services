#!/bin/sh

echo "Starting telegraf .."
telegraf &

echo "Starting PHP..."
rc-service php-fpm7 start

echo "Starting Nginx Server..."
rc-service nginx start

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
	if ! pgrep php-fpm7 2>&1 ; then
		echo "PHP is down :/"
		echo "Quitting... -_-"
		exit 1
	else
		echo "PHP is up ^_^"
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
