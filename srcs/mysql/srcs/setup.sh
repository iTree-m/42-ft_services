#!/bin/sh

echo "Starting telegraf!"
telegraf &

echo "Starting MySQL..."
if [ ! -f "/var/lib/mysql/ib_buffer_pool" ];
then
		echo "Setting up MySQL..."
		/etc/init.d/mariadb setup

		rc-service mariadb start

		echo "create user 'baga'@'%' identified by 'baga123';" | mysql -u root
		echo "create database dbwordpress;" | mysql -u root
		echo "grant all privileges on *.* to 'baga'@'%';" | mysql -u root
		echo "flush privileges;" | mysql -u root
		echo "quit" | mysql -u root
		mysql -u root < /dbwordpress.sql
		rc-service mariadb stop
fi

sed -i "s|.*skip-networking.*|#skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf

rc-service mariadb start
sleep 1

while true;
do
	if ! pgrep mysql 2>&1 ; then
		echo "MySQL is down :/"
		echo "Quitting... -_-"
		exit 1
	else
		echo "MySQL is up ^_^"
	fi
	if ! pgrep telegraf 2>&1 ; then
		echo "telegraf is down :/"
		echo "Quitting...-_-"
		exit 1
	else
		echo "telegraf is up ^_^"
	fi
	sleep 2
done
