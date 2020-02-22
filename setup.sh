rm -rf ~/.ssh/known_hosts
docker-compose -f ./srcs/mysql/docker-compose.yaml up -d
docker-compose -f ./srcs/nginx/docker-compose.yaml up -d
