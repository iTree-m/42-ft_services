FROM alpine:3.12.3

EXPOSE 3000

RUN apk update
RUN apk upgrade

# ADD the community repo to the repositories file reference, where exist grafana and telegraf
RUN echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN apk add grafana telegraf

# Edit telegraf config file and link it with InfluxDB
RUN mkdir /etc/telegraf && \
	cp -f /etc/telegraf.conf /etc/telegraf/telegraf.conf && \
	sed -i 's|.*  hostname = "".*|  hostname = "grafana"|' /etc/telegraf/telegraf.conf && \
	sed -i 's|.*  # urls = \["http://127.0.0.1:8086"\].*|  urls = \["http://influxdb:8086"\]|' /etc/telegraf/telegraf.conf && \
	sed -i 's|^  # database = "telegraf"|  database = "influxdb"|' /etc/telegraf/telegraf.conf

# ADD necessary files
ADD ./srcs/setup.sh /usr/bin/setup.sh
ADD ./srcs/sample.yaml /usr/share/grafana/conf/provisioning/datasources/sample.yaml
ADD ./srcs/dashboards/sample.yaml /usr/share/grafana/conf/provisioning/dashboards/sample.yaml
ADD ./srcs/dashboards/*.json /usr/share/grafana/conf/provisioning/dashboards/

# # ADD the right of execution
RUN chmod +x /usr/bin/setup.sh

ENTRYPOINT /usr/bin/setup.sh
#&& /bin/sh
