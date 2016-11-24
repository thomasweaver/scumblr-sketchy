Scumblr with Sketchy and Docker
===============================

This repo contains custom Docker files for creating Sketchy and Scumblr docker images.
There are also startup scripts and config files for starting up the docker images.

Docker images can be built by running the Docker build command in the folder containing the Dockerfile:

```
docker build -t scumblr .
```

All startup scripts run the respective images in a Docker network called "scumblr" this allows each docker image to reference each other through network aliases.

Scumblr
-------
The start up scripts folder for Scumblr contains 2 configuration files for setting the sketchy and scumblr URL's.
The Startup script attempts to map 4 files, the 2 configuration files, a results folder (for attachments) and the database. These are stored outside of the Docker image so images can be destroyed and created without losing data.

Upon first creation of the image the database can be copied out of the image as well as the results folder structure.

```
/root/Scumblr/public/system/result_attachments
/root/Scumblr/config/environments/development.rb
/root/Scumblr/db/development.sqlite3
/root/Scumblr/config/initializers/scumblr.rb
``` 
The startup folder is expected to be installed in /opt/scumblr

Sketchy
-------
The skecthy startup script starts sketchy and maps 1 file and 1 folder.
The file is the configuration file to configure the URL host address.
The mapped folder is the folder used celery and manager log files

```
/app/config-default.py
/app/logs
``` 
The startup folder is expected to be installed in /opt/sketchy

NGinx
-----
An Nginx startup script and configuration is also provided, this sits in front of scumblr and handles the SSL offloading.
The startup script maps an nginx config (provided), it also maps a folder for SSL certificates which you will have to create yourself.

The startup folder is expected to installed in /opt/nginx

```
/etc/nginx/certs
/etc/nginx/nginx.conf
```

A restart-all.sh script is also provided which will start or restart all docker images in the correct order
This can be placed anywhere



