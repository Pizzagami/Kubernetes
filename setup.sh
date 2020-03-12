#!/bin/sh
rm -rf ~/.ssh/known_hosts

if [ $# = 1 ]
then

if [ $1 = "-r" ]
then
	minikube deletsss
	minikube start --cpus=2 --disk-size 7Gi --vm-driver virtualbox --extra-config=apiserver.service-node-port-range=1-35000
fi

if [ $1 = "-s" ]
then
	minikube start --cpus=2 --disk-size 7Gi --vm-driver virtualbox --extra-config=apiserver.service-node-port-range=1-35000
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
	#curl -fsSL https://rawgit.com/kube/42homebrew/master/install.sh | zsh
	cp zshrc ~/.zshrc
	cp vimrc  ~/.vimrc
fi

fi
MINIKUBE_IP=$(minikube ip)
minikube addons enable dashboard
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
docker build -t phpadm srcs/phpmyadmin
docker build -t maria srcs/mysql

kubectl apply -k srcs
minikube dashboard
