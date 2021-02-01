# 42-ft_services
- *A System Administration and Networking project.*
- *The purpose of this project is to use Kubernetes to virtualize a network and set a production environment.*
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
- [Kubernetes Documentation](https://kubernetes.io/docs/home/)
- [Kubernetes Tutorial for Beginners](https://www.youtube.com/watch?v=X48VuDVv0do)
- [Hello Minikube](https://kubernetes.io/docs/tutorials/hello-minikube/)
- [Install InfluxDB Server and Data Source](https://sbcode.net/grafana/install-influxdb-datasource/)
- [Grafana documentation](https://grafana.com/docs/grafana/latest/)
- [How to configure vsftpd to work with passive mode](https://serverfault.com/questions/421161/how-to-configure-vsftpd-to-work-with-passive-mode)
- [Grafana : Install Telegraf and Configure for InfluxDB](https://www.youtube.com/watch?v=FrqeG-IajWM)
- [Now to install the Telegraf agent](https://sbcode.net/grafana/install-telegraf-agent/)
- [Understanding the HTTP 307 Temporary Redirect Status Code in Depth](https://kinsta.com/knowledgebase/307-redirect/)
- [Configure InfluxDB](https://docs.influxdata.com/influxdb/v1.8/administration/config/#using-the-configuration-file)
- [Kubernetes NodePort vs LoadBalancer vs Ingress](https://medium.com/google-cloud/kubernetes-nodeport-vs-loadbalancer-vs-ingress-when-should-i-use-what-922f010849e0)
- [InfluxDB Configuration](https://www.perforce.com/manuals/gitswarm/monitoring/performance/influxdb_configuration.html)
