FROM alpine:3.12.3

EXPOSE 8086

RUN apk update

# Install utils
RUN apk add openrc
RUN rc-status
RUN touch /run/openrc/softlevel

# Install influxDB
RUN apk add influxdb

# ADD the community repo to the repositories file reference, where exist grafana and telegraf
RUN echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN apk add telegraf

# Edit telegraf config file and link it with InfluxDB
RUN mkdir /etc/telegraf && \
	cp -f /etc/telegraf.conf /etc/telegraf/telegraf.conf && \
	sed -i 's|.*  hostname = "".*|  hostname = "influxdb"|' /etc/telegraf/telegraf.conf && \
	sed -i 's|.*  # urls = \["http://127.0.0.1:8086"\].*|  urls = \["http://127.0.0.1:8086"\]|' /etc/telegraf/telegraf.conf && \
	sed -i 's|^  # database = "telegraf"|  database = "influxdb"|' /etc/telegraf/telegraf.conf

# Backup
RUN cp /etc/influxdb.conf /etc/influxdb.conf.orig

# ADD necessary files
ADD ./srcs/influxdb.conf /etc/influxdb.conf
ADD ./srcs/setup.sh /usr/bin/setup.sh

# ADD the right of execution
RUN chmod +x /usr/bin/setup.sh

ENTRYPOINT /usr/bin/setup.sh && /bin/sh