rm -rf ~/.ssh/known_hosts

MINIKUBE_IP=$(minikube ip)
minikube addons enable metrics-server
minikube addons enable ingress
eval $(minikube docker-env)

docker build -t nginx:1.11 srcs/nginx
docker-compose -f ./srcs/mysql/docker-compose.yaml up -d
#docker-compose -f ./srcs/nginx/docker-compose.yaml up -d
