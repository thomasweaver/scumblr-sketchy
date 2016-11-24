#!/bin/bash


docker ps -f name=scumblr | grep scumblr

if [ "$?" -eq 0 ]; then
        echo "Scumblr container running; Stopping....."
        docker rm -f scumblr
else
        echo "Scumblr Not running Continuing"
fi

echo "Starting Scumblr"

docker run -d --net-alias=scumblr --net=scumblr -v /opt/scumblr/result_attachments:/root/Scumblr/public/system/result_attachments -v /opt/scumblr/development.rb:/root/Scumblr/config/environments/development.rb -v /opt/scumblr/development.sqlite3:/root/Scumblr/db/development.sqlite3 -v /opt/scumblr/scumblr.rb:/root/Scumblr/config/initializers/scumblr.rb --name scumblr -t scumblr
