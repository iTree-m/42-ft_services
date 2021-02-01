# 42-ft_services
A System Administration and Networking project.
The purpose of this project is to use Kubernetes to virtualize a network and set a production environment.
## Components
- Alpine Linux
- Kubernetes
- Docker
- MetalLB
- Nginx
- FTPS
- WordPress
- PhpMyAdmin
- MariaDB (MySQL)
- Grafana
- InfluxDB
## Ports
- ```NGINX``` on port 80 (HTTP), 443 (SSL), 22 SSH)
- ```WordPress``` on port 5050
- ```PhpMyAdmin``` on port 5000
- ```Grafana``` on port 3000
- ```FTPS``` on port 21
- ```MySQL``` on port 3306
- ```InfluxDB``` on port 8086
## Usage
Before running the script, please check if : ```Docker```, ```VirtualBox```, ```minikube``` and ```kubectl``` are installed for the VM.
```C++
/* run the script */
. ./setup.sh
/* remove the pods, services and deplyments */
./rm.sh
```
## Resources
- [Docker & k8s resources](https://www.notion.so/Docker-k8s-resources-5d89599a520b479e8f18487aa3e537a3)
- [Install Nginx on Alpine Linux](https://wiki.alpinelinux.org/wiki/Nginx)
- [Create a Self-Signed SSL Certificate for Nginx](https://zhimin-wen.medium.com/https-client-certificate-authentication-with-sidecar-9b07d82a6389)
- [Install MariaDB on Alpine Linux](https://techviewleo.com/how-to-install-mariadb-on-alpine-linux/)
- [Install PHP on Alpine Linux](https://www.cyberciti.biz/faq/how-to-install-php-7-fpm-on-alpine-linux/)
- [Install WordPress on Alpine Linux](https://wiki.alpinelinux.org/wiki/WordPress)
- [Install and Configure an FTP server](https://www.howtoforge.com/tutorial/ubuntu-vsftpd/)
- [Install phpMyAdmin on Alpine Linux](https://wiki.alpinelinux.org/wiki/PhpMyAdmin)
- [vsftpd.conf(5) - Linux man page](https://linux.die.net/man/5/vsftpd.conf)
- [Set Up Telegraf On Linux Machine](https://www.learningmilestone.com/post/set-up-telegraf-on-linux-machine-for-monitoring)
- [Setup Grafana On Kubernetes](https://devopscube.com/setup-grafana-kubernetes/)
- [Deploying WordPress and MySQL with Persistent Volumes](https://kubernetes.io/docs/tutorials/stateful-application/mysql-wordpress-persistent-volume/)
- [METALLB](https://metallb.universe.tf/)
