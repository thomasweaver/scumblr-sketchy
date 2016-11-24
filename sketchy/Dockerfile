FROM ubuntu

WORKDIR /

EXPOSE 8000

RUN apt-get -y install git
RUN git clone https://github.com/Netflix/sketchy.git /app

WORKDIR /app
RUN ./ubuntu_install.sh

ADD startup.sh /app/startup.sh

ENTRYPOINT bash /app/startup.sh
