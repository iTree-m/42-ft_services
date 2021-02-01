#!/bin/sh

echo "Starting telegraf..."
telegraf &


echo "Starting InfluxDB..."
rc-service influxdb start
sleep 2

while true;
do
	if ! pgrep influx 2>&1 ; then
		echo "InfluxDB is down :/"
		echo "Quitting... -_-"
		exit 1
	else
		echo "InfluxDB is up ^_^"
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
