############################################################
# Dockerfile to build Scumblr container images
# Based on Ubuntu
############################################################
FROM ubuntu

WORKDIR "/root"
RUN apt-get update
RUN apt-get -y install git libxslt-dev libxml2-dev build-essential bison openssl zlib1g libxslt1.1 libssl-dev libxslt1-dev libxml2 libffi-dev libxslt-dev libpq-dev autoconf libc6-dev libreadline6-dev zlib1g-dev libtool libsqlite3-dev libcurl3 libmagickcore-dev ruby-build libmagickwand-dev imagemagick bundler

RUN git clone git://github.com/sstephenson/rbenv.git /root/.rbenv
RUN echo 'PATH="/root/.rbenv/bin:$PATH"' >> /root/.bashrc
ENV PATH="/root/.rbenv/bin:$PATH"
RUN echo 'eval "$(rbenv init -)"' >> /root/.bashrc
RUN eval "$(rbenv init -)"

RUN git clone git://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build
RUN echo 'PATH="/root/.rbenv/shims:/root/.rbenv/plugins/ruby-build/bin:$PATH"' >> /root/.bashrc
ENV PATH="/root/.rbenv/shims:/root/.rbenv/plugins/ruby-build/bin:$PATH"

RUN rbenv install 2.0.0-p481
RUN rbenv global 2.0.0-p481
RUN ruby -v

RUN gem install bundler --no-ri --no-rdoc
RUN rbenv rehash
RUN gem install rails -v 4.0.9 

RUN apt-get -y install redis-server
RUN gem install sidekiq
RUN rbenv rehash

RUN git clone https://github.com/Netflix/Scumblr.git /root/Scumblr
WORKDIR "/root/Scumblr"
RUN bundle install
RUN rake db:create
RUN rake db:schema:load
RUN echo 'user = User.new; user.email = "test@test.com"; user.password = "password1"; user.password_confirmation = "password1"; user.admin = true; user.save' | bundle exec rails c
ADD startup.sh /startupscript/startup.sh

EXPOSE 3000

# Set default container command
ENTRYPOINT bash /startupscript/startup.sh
