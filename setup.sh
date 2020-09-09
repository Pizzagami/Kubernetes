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
	minikube start --cpus=2 --disk-size 7Gi --vm-driver docker
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

MINIKUBE_IP=$(minikube ip)
minikube addons enable dashboard
minikube addons enable metrics-server
minikube addons enable metallb

eval $(minikube docker-env)


IP=$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)

docker build -t nginx_ssh srcs/nginx
docker build -t ftps_server --build-arg IP=${IP} srcs/FTPS
docker build -t wordpr srcs/wordpress
docker build -t phpadm srcs/phpmyadmin
docker build -t maria srcs/mysql

kubectl apply -k srcs

minikube dashboard
