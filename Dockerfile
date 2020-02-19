FROM alpine:3.7
RUN apk update \
&&  apk upgrade \
&&  apk add nginx

COPY ./srcs/nginx/* srcs_docker/

EXPOSE 80 443
