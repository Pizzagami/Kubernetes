#!/bin/bash

Red="\e[31m"			#--------- Red color
Light_red="\e[91m"		#--------- Light red color
Green="\e[32m"			#--------- Green color
Yellow="\e[33m"			#--------- Yellow color
Blue="\e[34m"			#--------- Blue color
Default="\e[39m"		#--------- Default color
Mage="\e[35m"			#--------- Magenta
Cyan="\e[36m"			#--------- Cyan
Orange="\e[33m"			#--------- orange
Bold="\e[1m"			#--------- bold
Unbold="\e[0m"			#--------- unblod

start_minikube()
{
	printf "${Blue}Starting minikube...\n${Default}"
	minikube start --vm-driver docker > /dev/null
	if [ "$?" != 0 ];then
		printf "${Red}Could not start minikube"
		exit 1
	fi
	printf "${Blue}Minikube has successfully started\n${Default}"
}

enable_addon()
{
	printf "${Cyan}Enabling addons\n${Default}"
	minikube addons enable dashboard > /dev/null
	minikube addons enable metrics-server > /dev/null
	minikube addons enable metallb > /dev/null
	printf "${Cyan}Addons Enabled\n${Default}"
}

start_metallb()
{
	printf "${Bold}Starting Metallb load balancer\n${Unbold}"
	eval $(minikube docker-env)
	kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml > /dev/null
	kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml > /dev/null
	kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" > /dev/null
	printf "${Bold}Metallb started\n${Unbold}"
}

build_images()
{
	printf "${Green}Building nginx\n${Default}"
	docker build --quiet -t nginx_ssh srcs/nginx > /dev/null
	printf "${Green}Building ftps\n${Default}"
	docker build --quiet -t ftps_server srcs/FTPS > /dev/null
	printf "${Green}Building wordpress\n${Default}"
	docker build --quiet -t wordpr srcs/wordpress > /dev/null
	printf "${Green}Building phpmyadmin\n${Default}"
	docker build --quiet -t phpadm srcs/phpmyadmin > /dev/null
	printf "${Green}Building mysql\n${Default}"
	docker build --quiet -t maria srcs/mysql > /dev/null
	printf "${Green}Building influxdb\n${Default}"
	docker build --quiet -t influx srcs/influxDB/ > /dev/null
	printf "${Green}Building grafana\n${Default}"
	docker build --quiet -t grafana srcs/grafana > /dev/null
	printf "${Green}Building telegraf\n${Default}"
	docker build --quiet -t telegraf srcs/telegraf > /dev/null
}

deployment()
{
	printf "${Cyan}Creating deployments\n${Default}"
	kubectl apply -f srcs/nginx/nginx-deployment.yaml > /dev/null
	kubectl apply -f srcs/mysql/mysql-deployment.yaml > /dev/null
	kubectl apply -f srcs/wordpress/wordpress-deployment.yaml > /dev/null
	kubectl apply -f srcs/phpmyadmin/phpmyadmin-deployment.yaml > /dev/null
	kubectl apply -f srcs/FTPS/ftps-deployment.yaml > /dev/null
	kubectl apply -f srcs/influxDB/influxdb-deployment.yaml > /dev/null
	kubectl apply -f srcs/grafana/grafana-deployment.yaml > /dev/null
	kubectl apply -f srcs/telegraf/telegraf-deployment.yaml > /dev/null
	printf "${Cyan}All deployments have been created\n${Default}"
	printf "${Cyan}${Bold}Configuring Metallb\n${Default}${Unbold}"
	kubectl apply -f srcs/metallb.yaml > /dev/null
	printf "${Cyan}${Bold}Metallb configured\n${Default}${Unbold}"
}

services()
{
	printf "${Cyan}Creating services\n${Default}"
	kubectl apply -f srcs/nginx/nginx-service.yaml > /dev/null
	kubectl apply -f srcs/mysql/mysql-service.yaml > /dev/null
	kubectl apply -f srcs/wordpress/wordpress-service.yaml > /dev/null
	kubectl apply -f srcs/phpmyadmin/phpmyadmin-service.yaml > /dev/null
	kubectl apply -f srcs/FTPS/ftps-service.yaml > /dev/null
	kubectl apply -f srcs/influxDB/influxdb-service.yaml > /dev/null
	kubectl apply -f srcs/grafana/grafana-service.yaml > /dev/null
	kubectl apply -f srcs/telegraf/telegraf-service.yaml > /dev/null
	printf "${Cyan}All services have been created\n${Default}"
}

default_credential()
{
	printf "Default credentials are the following:\n"
	printf "nginx      | ${Bold}user${Unbold}:\n"
	printf "ftps       | ${Bold}user${Unbold}:${Red}${Bold}password${Unbold}${Default}\n"
	printf "phpmyadmin | ${Bold}admin${Unbold}:${Red}${Bold}admin${Unbold}${Default}\n"
	printf "grafana    | ${Bold}admin${Unbold}:${Red}${Bold}admin${Unbold}${Default}\n"
}

start_dashboard()
{
	printf "${Mage}Starting web dashboard${Default}\n"
	minikube dashboard
}

if [ "$1" == "-R" ];then
	ln -s /sgoinfre/goinfre/Perso/selgrabl sgoinfre
	sh init_docker.sh
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	cp zshrc ~/.zshrc
	cp vimrc  ~/.vimrc
else
	start_minikube
	enable_addon
	start_metallb
	build_images
	deployment
	services
	default_credential
	start_dashboard
	printf "${Red}${Bold}ft_services started${Unbold}${Default}\n"
fi
