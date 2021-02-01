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
