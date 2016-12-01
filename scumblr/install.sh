#!/bin/bash

#Install PreRequisits
echo "#############################
#	INSTALLING Pre Req
################################"
apt-get update
apt-get install -y sudo wget git-core curl zlib1g-dev libpq-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev libmagickcore-dev libmagickwand-dev imagemagick imagemagick-common redis-server

#Install Bandit for Python code analysis
apt-get install -y python-dev python-pip
pip install bandit


echo "###################################
#	Installing Ruby Environment
#######################################"
git clone https://github.com/rbenv/rbenv.git /root/.rbenv
echo 'PATH="/root/.rbenv/bin:$PATH"' >> /root/.bashrc
PATH="/root/.rbenv/bin:$PATH"
echo 'eval "$(rbenv init -)"' >> /root/.bashrc
eval "$(rbenv init -)"


git clone https://github.com/rbenv/ruby-build.git /root/.rbenv/plugins/ruby-build
echo 'PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> /root/.bashrc
PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

rbenv install 2.3.1
rbenv global 2.3.1
ruby -v


echo "#################################
# GEM Installer of Bundler and sidekiq
#####################################"

gem install bundler --no-ri --no-rdoc
gem install sidekiq --no-ri --no-rdoc


echo "#####################################
#	Installing NodeJS
########################################"

curl -sL https://deb.nodesource.com/setup_4.x | bash -
apt-get install -y nodejs


echo "###############################
#	echo Gem install rails
################################"
gem install rails -v 4.2.6 --no-ri --no-rdoc

rbenv rehash

echo "################################
#	installing postgres
###################################"
sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | apt-key add -
sudo apt-get update
sudo apt-get install -y postgresql-common
sudo apt-get install -y postgresql-9.5 libpq-dev

sudo -u postgres createuser scumblr -s

RANDOM=$(head -c 20 /dev/urandom | md5sum | awk '{print $ 1}')

sudo -u postgres psql -c "ALTER USER scumblr WITH PASSWORD '${RANDOM}';"

echo "####################################
#	installing scumblr
###################################"
git clone https://github.com/Netflix/Scumblr.git /root/Scumblr
cd "/root/Scumblr"
bundle install

sed -i "s/password: scumblr/password: ${RANDOMSTRING}/" config/database.yml

rake db:create
rake db:schema:load
echo 'user = User.new; user.email = "test@test.com"; user.password = "password1"; user.password_confirmation = "password1"; user.admin = true; user.save' | bundle exec rails c

echo "#################################
#	Finished
####################################"
