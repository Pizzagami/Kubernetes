docker build -t nginx ./srcs/nginx/.
docker run --rm -d -p 80:80 -p 443:443 -p 2222:22 --name nginx nginx
