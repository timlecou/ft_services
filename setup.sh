#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
L_GREEN='\033[1;32m'
L_BLUE='\033[1;34m'
L_GRAY='\033[0;37m'
L_PURPLE='\033[1;35m'
BOLD='\033[1m'
NC='\033[0m'

echo -e "$L_PURPLE     ▄████████     ███             ▄████████    ▄████████    ▄████████  ▄█    █▄   ▄█   ▄████████    ▄████████    ▄████████"
echo -e "$L_PURPLE    ███    ███ ▀█████████▄        ███    ███   ███    ███   ███    ███ ███    ███ ███  ███    ███   ███    ███   ███    ███"
echo -e "$L_BLUE    ███    █▀     ▀███▀▀██        ███    █▀    ███    █▀    ███    ███ ███    ███ ███▌ ███    █▀    ███    █▀    ███    █▀ "
echo -e "$L_BLUE   ▄███▄▄▄         ███   ▀        ███         ▄███▄▄▄      ▄███▄▄▄▄██▀ ███    ███ ███▌ ███         ▄███▄▄▄       ███       "
echo -e "$L_PURPLE  ▀▀███▀▀▀         ███          ▀███████████ ▀▀███▀▀▀     ▀▀███▀▀▀▀▀   ███    ███ ███▌ ███        ▀▀███▀▀▀     ▀███████████"
echo -e "$L_PURPLE    ███            ███                   ███   ███    █▄  ▀███████████ ███    ███ ███  ███    █▄    ███    █▄           ███"
echo -e "$L_GREEN    ███            ███             ▄█    ███   ███    ███   ███    ███ ███    ███ ███  ███    ███   ███    ███    ▄█    ███"
echo -e "$L_GREEN    ███           ▄████▀         ▄████████▀    ██████████   ███    ███  ▀██████▀  █▀   ████████▀    ██████████  ▄████████▀ "
echo -e "$NC"
echo -e " timlecou@student.42.fr"

minikube start --vm-driver=virtualbox
echo -e "$L_GREEN ✓ $NC"

SERVER_IP=$(minikube ip)

#enable docker images on minikube

eval $(minikube docker-env)

#building docker images
echo -e "\n$BOLD Building containers:$NC"
docker build -t nginx_alpine:local containers/nginx > /dev/null
echo -e "$L_GRAY - nginx container built ✅ $NC"

docker build -t ftps_alpine:local containers/ftps >> /dev/null
echo -e "$L_GRAY - ftps container built ✅ $NC"

docker build -t wordpress_alpine:local containers/wordpress > /dev/null
echo -e "$L_GRAY - wordpress container built ✅ $NC"

sed 's/__MINIKUBE_IP__/'$SERVER_IP'/g' containers/mysql/db-fill-template.sql > containers/mysql/db-fill.sql
docker build -t mysql_alpine:local containers/mysql > /dev/null
echo -e "$L_GRAY - mysql container built ✅ $NC"

docker build -t phpmyadmin_alpine:local containers/phpmyadmin > /dev/null
echo -e "$L_GRAY - phpmyadmin container built ✅ $NC"

docker build -t grafana_alpine:local containers/grafana > /dev/null
echo -e "$L_GRAY - grafana container built ✅ $NC"

docker build -t influxdb_alpine:local containers/influxdb > /dev/null
echo -e "$L_GRAY - InfluxDB container built ✅ $NC"

echo -e "$L_GREEN ✓ all containers are built 😇$NC"

#deploy apps

echo -e "\n$BOLD Deploying objects:$NC"

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.8.1/manifests/metallb.yaml >> /dev/null
kubectl apply -f manifests/config-metallb.yaml >> /dev/null
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" >> /dev/null
echo -e "$L_GRAY - metallb load balancer deployed ✅ $NC"

kubectl apply -f manifests/nginx.yaml >> /dev/null
echo -e "$L_GRAY - nginx service deployed ✅ $NC"

kubectl apply -f manifests/ftps.yaml >> /dev/null
echo -e "$L_GRAY - ftps service deployed ✅ $NC"

kubectl apply -f manifests/mysql.yaml >> /dev/null
echo -e "$L_GRAY - mysql service deployed ✅ $NC"

kubectl apply -f manifests/wordpress.yaml >> /dev/null
echo -e "$L_GRAY - wordpress service deployed ✅ $NC"

kubectl apply -f manifests/phpmyadmin.yaml >> /dev/null
echo -e "$L_GRAY - phpmyadmin service deployed ✅ $NC"

kubectl apply -f manifests/grafana.yaml >> /dev/null
echo -e "$L_GRAY - grafana service deployed ✅ $NC"

kubectl apply -f manifests/influxdb.yaml >> /dev/null
echo -e "$L_GRAY - InfluxDB service deployed ✅ $NC"

echo -e "$L_GREEN ✓ all objects are deployed 😇$NC\n"
echo -e "\n$BOLD => ft_services is running at $SERVER_IP 📶"

echo -e "$L_GRAY - phpmyadmin user = db_user $NC"
echo -e "$L_GRAY - phpmyadmin password = db_password $NC"
echo -e "$L_GRAY - grafana user = admin $NC"
echo -e "$L_GRAY - grafana password = admin $NC"

minikube dashboard