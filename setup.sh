#!/bin/sh
rm -rf ~/.ssh/known_hosts

if [ $# = 1 ]
then

if [ $1 = "-r" ]
then
	minikube delete
	minikube start --cpus=2 --disk-size 7Gi --vm-driver docker
fi

if [ $1 = "-s" ]
then
	minikube start --vm-driver docker
fi

if [ $1 = "-d" ]
then
	minikube delete
	exit
fi

if [ $1 = "-R" ]
then	
	ln -s /sgoinfre/goinfre/Perso/selgrabl sgoinfre
	sh init_docker.sh
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	cp zshrc ~/.zshrc
	cp vimrc  ~/.vimrc
fi

fi

minikube addons enable dashboard
minikube addons enable metrics-server
minikube addons enable metallb

eval $(minikube docker-env)

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml > /dev/null
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml > /dev/null
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" > /dev/null

docker build -t nginx_ssh srcs/nginx
docker build -t ftps_server srcs/FTPS
docker build -t wordpr srcs/wordpress
docker build -t phpadm srcs/phpmyadmin
docker build -t maria srcs/mysql
docker build -t influx srcs/influxDB/
docker build -t grafana srcs/grafana
docker build -t telegraf srcs/telegraf

kubectl apply -f srcs/nginx/nginx-deployment.yaml
kubectl apply -f srcs/mysql/mysql-deployment.yaml
kubectl apply -f srcs/wordpress/wordpress-deployment.yaml
kubectl apply -f srcs/phpmyadmin/phpmyadmin-deployment.yaml
kubectl apply -f srcs/FTPS/ftps-deployment.yaml
kubectl apply -f srcs/influxDB/influxdb-deployment.yaml
kubectl apply -f srcs/grafana/grafana-deployment.yaml
kubectl apply -f srcs/telegraf/telegraf-deployment.yaml

kubectl apply -f srcs/metallb.yaml

kubectl apply -f srcs/nginx/nginx-service.yaml
kubectl apply -f srcs/mysql/mysql-service.yaml
kubectl apply -f srcs/wordpress/wordpress-service.yaml
kubectl apply -f srcs/phpmyadmin/phpmyadmin-service.yaml
kubectl apply -f srcs/FTPS/ftps-service.yaml
kubectl apply -f srcs/influxDB/influxdb-service.yaml
kubectl apply -f srcs/grafana/grafana-service.yaml
kubectl apply -f srcs/telegraf/telegraf-service.yaml

#minikube dashboard
