echo "\033[33m\n------------------WELCOME TO FT_SERVICES-------------------------------\033[0m"

echo "\033[31m\n------------------STARTING MINIKUBE------------------------------------\033[0m"
minikube delete
sleep 2
minikube start --vm-driver=virtualbox --disk-size=20g --memory=3g --cpus=2

eval $(minikube docker-env)
# sleep 1
echo "\033[31m\n------------------BUILDING IMAGES--------------------------------------\033[0m"
# sleep 1
echo "\033[32m\n -Building FTPS Image...\033[0m"
docker build -t ftps ./srcs/ftps > /dev/null

echo "\033[32m\n -Building Grafana Image...\033[0m"
docker build -t	grafana ./srcs/grafana > /dev/null

echo "\033[32m\n -Building InfluxDB Image...\033[0m"
docker build -t influxdb ./srcs/influxdb > /dev/null

echo "\033[32m\n -Building MySQL Image...\033[0m"
docker build -t mysql ./srcs/mysql > /dev/null

echo "\033[32m\n -Building PhpMyAdmin Image...\033[0m"
docker build -t phpmyadmin ./srcs/phpmyadmin > /dev/null

echo "\033[32m\n -Building WordPress Image...\033[0m"
docker build -t wordpress ./srcs/wordpress > /dev/null

echo "\033[32m\n -Building Nginx Image...\033[0m"
docker build -t nginx ./srcs/nginx > /dev/null

echo "\033[31m\n------------------INSTALLING AND CONFIGURING METALLB------------------\033[0m"
# sleep 1
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml  > /dev/null
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml  > /dev/null
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"  > /dev/null
echo "\033[32m\n -MetalLB service installed !\033[0m"

# sleep 2
echo "\033[31m\n------------------CREATING DEPLOYMENTS AND SERVICES-------------------\033[0m"
# sleep 2

#METALLB
kubectl apply -f ./srcs/metallb/metallb-config.yaml > /dev/null
echo "\033[32m\n -MetalLB service created !\033[0m"
# sleep 1
#MYSQL
kubectl apply -f ./srcs/mysql/srcs/mysql-secret.yaml > /dev/null
kubectl apply -f ./srcs/mysql/srcs/mysql-config.yaml > /dev/null
echo "\033[32m\n -MySQL service created !\033[0m"
# sleep 1
#INFLUXDB
kubectl apply -f ./srcs/influxdb/srcs/influxdb-config.yaml > /dev/null
echo "\033[32m\n -InfluxDB service created !\033[0m"
# sleep 1
#FTPS
kubectl apply -f ./srcs/ftps/srcs/ftps-config.yaml > /dev/null
echo "\033[32m\n -FTPS service created !\033[0m"
# sleep 1
#GRAFANA
kubectl apply -f ./srcs/grafana/srcs/grafana-config.yaml > /dev/null
echo "\033[32m\n -Grafana service created !\033[0m"
# sleep 1
#NGINX
kubectl apply -f ./srcs/nginx/srcs/nginx-config.yaml > /dev/null
echo "\033[32m\n -Nginx service created !\033[0m"
# sleep 1
#PHPMYADMIN
kubectl apply -f ./srcs/phpmyadmin/srcs/phpmyadmin-config.yaml > /dev/null
echo "\033[32m\n -PhpMyAdmin service created !\033[0m"
# sleep 1
#WORDPRESS
kubectl apply -f ./srcs/wordpress/srcs/wordpress-config.yaml > /dev/null
echo "\033[32m\n -WordPress service created !\033[0m"
# sleep 1

echo "\033[33m\n LAUNCHING MINIKUBE DASHBOARD...\033[0m"
sleep 2
minikube dashboard
# sleep 1
echo "\033[33m\n BYE :/ \033[0m"
# sleep 1