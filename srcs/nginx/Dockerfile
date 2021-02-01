FROM alpine:3.12.3

# define port

EXPOSE 80
EXPOSE 443
EXPOSE 22

## install nginx, openrc and openssh
RUN apk update && apk upgrade && apk add openrc openssl openssh
RUN rc-status
RUN touch /run/openrc/softlevel
RUN apk add nginx

## Setting up nginx

RUN adduser -D -g 'www' www
# -D: default
# -g: group
RUN mkdir /www
# chown permet de changer le propriétaire (utilisateur et groupe)
# chown [OPTION]…[OWNER][:[GROUP]] FILE…
# -R option Recursively change ownership of directories and their contents.
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

# ADD the community repo to the repositories file reference, where exist grafana and telegraf
RUN echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

# Install telegraf
RUN apk add telegraf

# Edit telegraf config file and link it with InfluxDB
RUN mkdir /etc/telegraf && \
	cp -f /etc/telegraf.conf /etc/telegraf/telegraf.conf && \
	sed -i 's|.*  hostname = "".*|  hostname = "nginx"|' /etc/telegraf/telegraf.conf && \
	sed -i 's|.*  # urls = \["http://127.0.0.1:8086"\].*|  urls = \["http://influxdb:8086"\]|' /etc/telegraf/telegraf.conf && \
	sed -i 's|^  # database = "telegraf"|  database = "influxdb"|' /etc/telegraf/telegraf.conf


## config nginx
# make backup of original nginx.conf file before writting your own
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig

##	install openssl and generate ssl certificate
# RUN apk add openssl
RUN printf "MA\nKH\nKH\n42\n1337\n_\nft_services@1337.com\n" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;

# Create a user
RUN /etc/init.d/sshd start
RUN adduser -D ichejra
RUN echo "ichejra:password" | chpasswd
RUN ssh-keygen -A
# ssh-keygen OpenSSH authentication key utility
# -A for which host keys do not exist, generate the host keys with the default key file path

# ADD files
ADD ./srcs/nginx.conf /etc/nginx/nginx.conf
ADD ./srcs/index.html /www/index.html
ADD ./srcs/setup.sh /usr/bin/setup.sh

# add the right of execution
RUN chmod +x /usr/bin/setup.sh

ENTRYPOINT [ "/usr/bin/setup.sh" ]