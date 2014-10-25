#!/bin/bash
# Author: Jon Klem <jonathonklemp@gmail.com>
# Written for Ubuntu Trusty, should be adaptable to other distros.

## Variables
HOME=/root
DOCKERSCRIPT=/root/connectToDocker.sh
cd $HOME

apt-get update -qq
apt-get install -yq git docker.io

# intall ns enter to enter our docker container
docker run -v /usr/local/bin:/target jpetazzo/nsenter

# build our docker container
docker build -t apache /home/vagrant

# run it in daemon mode
docker run -d -p 80:80 -t apache /usr/sbin/httpd -D FOREGROUND

# create our 'connectToDocker.sh' script
chmod +x $DOCKERSCRIPT

