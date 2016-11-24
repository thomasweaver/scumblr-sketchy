#!/bin/bash


docker ps -f name=sketchy | grep sketchy

if [ "$?" -eq 0 ]; then
	echo "sketchy container running; Stopping....."
	docker rm -f sketchy
else
	echo "sketchy Not running Continuing"
fi

echo "Starting sketchy"
docker run -dt --net-alias=sketchy --net=scumblr --name sketchy -v /opt/sketchy/config-default.py:/app/config-default.py -v /opt/sketchy/logs:/app/logs sketchy
