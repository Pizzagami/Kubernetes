#!/bin/sh
rm -rf ~/.ssh/known_hosts

MINIKUBE_IP=$(minikube ip)
minikube addons enable metrics-server
minikube addons enable ingress
eval $(minikube docker-env)

#cp srcs/ftps/vsftpd.factoryconf srcs/ftps/vsftpd.conf
#sed -i '' "s/##KUB_IP##/$MINIKUBEKUB_IP/g" srcs/ftps/vsftpd.conf
#cp srcs/wordpress/wordpress_factoryconf.sql srcs/wordpress/wordpress.sql
#sed -i '' "s/##KUB_IP##/$MINIKUBEKUB_IP/g" srcs/wordpress/wordpress.sql

docker build -t nginx_ssh srcs/nginx
#docker build -t ftps_server srcs/ftps
#docker build -t wordpr srcs/wordpress
#docker build -t phpadm srcs/phpmyadmin
docker build -t maria srcs/mysql

kubectl apply -k srcs
minikube dashboard
