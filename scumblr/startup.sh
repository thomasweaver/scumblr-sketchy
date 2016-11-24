#!/bin/bash

cd /root/Scumblr
redis-server &
bundle exec sidekiq -l log/sidekiq.log &
bundle exec rails s 
