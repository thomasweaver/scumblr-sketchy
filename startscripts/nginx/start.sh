#!/bin/bash


docker ps -a -f name=nginx | grep nginx

if [ "$?" -eq 0 ]; then
	echo "Nginx container running; Stopping....."
	docker rm -f nginx
else
	echo "Nginx Not running Continuing"
fi

echo "Starting NGINX"
docker run -d --net-alias=nginx --net=scumblr --name nginx -p 0.0.0.0:443:443 -v /opt/nginx/certs:/etc/nginx/certs -v /opt/nginx/nginx.conf:/etc/nginx/nginx.conf:ro nginx
