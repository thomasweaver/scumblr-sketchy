############################################################
# Dockerfile to build Scumblr container images
# Based on Ubuntu
############################################################
FROM ubuntu

WORKDIR "/root"
ADD install.sh install.sh
ADD startup.sh /startupscript/startup.sh
RUN ./install.sh

EXPOSE 3000

# Set default container command
ENTRYPOINT bash /startupscript/startup.sh
