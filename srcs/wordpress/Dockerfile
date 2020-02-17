	FROM	alpine
	
	RUN apk update -qy \
	&& apk upgrade -qy \
	&& apk install -qy nginx
	
	COPY ./srcs/* srcs_docker/

	EXPOSE 8080 80 443 21 5050 5000 3000

	ENTRYPOINT ["srcs_docker/docker-entrypoint.sh"]
