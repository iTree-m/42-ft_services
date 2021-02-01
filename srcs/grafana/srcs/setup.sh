#!/bin/sh

echo "Starting telegraf..."
telegraf &

cd /usr/share/grafana
echo "Starting grafana..."
( if ! grafana-server 2>&1 ; then
	echo "Couldn't start grafana :/"
	exit 1
fi ) &

sleep 2

while true;
do
	if ! pgrep grafana-server 2>&1 ; then
		echo "grafana Service is down :/"
		echo "Quitting... -_-"
		exit 1
	else
		echo "grafana is up ^_^"
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
