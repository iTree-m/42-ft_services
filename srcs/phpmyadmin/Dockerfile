FROM alpine:3.12.3

EXPOSE 5000

RUN apk update
RUN apk upgrade

# Insalling nginx and openrc
RUN apk add nginx
RUN apk add openrc
RUN rc-status
RUN touch /run/openrc/softlevel

# ADD the community repo to the repositories file reference, where exist grafana and telegraf
RUN echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN apk add telegraf

# Edit telegraf config file and link it with InfluxDB
RUN mkdir /etc/telegraf && \
	cp -f /etc/telegraf.conf /etc/telegraf/telegraf.conf && \
	sed -i 's|.*  hostname = "".*|  hostname = "phpmyadmin"|' /etc/telegraf/telegraf.conf && \
	sed -i 's|.*  # urls = \["http://127.0.0.1:8086"\].*|  urls = \["http://influxdb:8086"\]|' /etc/telegraf/telegraf.conf && \
	sed -i 's|^  # database = "telegraf"|  database = "influxdb"|' /etc/telegraf/telegraf.conf


# Installing additional packages
RUN apk add php7 php7-fpm php7-common php7-iconv php7-json php7-gd php7-curl \ 
	php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap \
	php7-mbstring php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype \
	php7-dom php7-opcache php7-zlib php7-session php7-intl php7-zip

# Installing MySql
# RUN apk add mariadb mariadb-client
# RUN /etc/init.d/mariadb setup
## setup nginx
RUN adduser -D -g 'www' www
	# -D: default
	# -g: group
RUN mkdir /www
	# chown permet de changer le propriétaire (utilisateur et groupe)
	# chown [OPTION]…[OWNER][:[GROUP]] FILE…
	# -R option Recursively change ownership of directories and their contents.
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

# config nginx
	# make backup of original nginx.conf file before writting your own
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig


# Installing phpMyAdmin
RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
RUN tar -xzvf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN rm -rf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN mv /phpMyAdmin-5.0.2-all-languages /www/phpmyadmin


RUN mkdir /www/phpmyadmin/tmp
RUN chmod -R 777 /www/phpmyadmin/tmp


# ADD files
ADD ./srcs/nginx.conf /etc/nginx/nginx.conf
ADD ./srcs/config.inc.php /www/phpmyadmin/config.inc.php
ADD ./srcs/setup.sh /usr/bin/setup.sh

# Add the right of execution
RUN chmod +x /usr/bin/setup.sh

ENTRYPOINT [ "/usr/bin/setup.sh" ]
