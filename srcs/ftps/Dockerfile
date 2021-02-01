FROM alpine:3.12.3

EXPOSE 21

# Installing vsftpd and utils
RUN apk update
RUN apk upgrade
RUN apk add vsftpd
RUN apk add openssh
RUN apk add openssl
RUN apk add openrc
RUN rc-status
RUN touch /run/openrc/softlevel
# RUN rc-service vsftpd start


# ADD the community repo to the repositories file reference, where exist grafana and telegraf
RUN echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN apk add telegraf

# Edit telegraf config file and link it with InfluxDB
RUN mkdir /etc/telegraf && \
	cp -f /etc/telegraf.conf /etc/telegraf/telegraf.conf && \
	sed -i 's|.*  hostname = "".*|  hostname = "ftps"|' /etc/telegraf/telegraf.conf && \
	sed -i 's|.*  # urls = \["http://127.0.0.1:8086"\].*|  urls = \["http://influxdb:8086"\]|' /etc/telegraf/telegraf.conf && \
	sed -i 's|^  # database = "telegraf"|  database = "influxdb"|' /etc/telegraf/telegraf.conf

# Backup vsftpd.conf
RUN cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.orig

## Generate ssl certificate
RUN printf "MA\nKH\nKH\n42\n1337\n_\nft_services@1337.com\n" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem


# Add a new user
RUN adduser -D admin && echo "admin:admin1234" | chpasswd
RUN echo "admin" | tee -a /etc/vsftpd.userlist
RUN ssh-keygen -A
# ADD files
ADD ./srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
ADD ./srcs/setup.sh /usr/bin/setup.sh

# ADD the right of execution
RUN chmod +x /usr/bin/setup.sh

ENTRYPOINT [ "/usr/bin/setup.sh" ]
