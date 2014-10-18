#!/bin/bash
# Author: Jon Klem <jonathonklemp@gmail.com>
# Written for Ubuntu Trusty, should be adaptable to other distros.

## Variables
HOME=/root
cd $HOME

apt-get update -qq
apt-get install -yq git docker.io

# get CentOS 5 docker images
git clone -b CentOS-5 https://github.com/CentOS/sig-cloud-instance-images.git
cd sig-cloud-instance-images/docker

# modify docker script to provision the server
echo "RUN yum -y update" >> Dockerfile
echo "RUN yum -y install apache php git" >> Dockerfile
echo "RUN service httpd start" >> Dockerfile
echo "git clone https://github.com/jonathonklem/fake_website.git /var/www/html" >> Dockerfile

# build our docker container
docker build -t apache .

# run it in daemon mode
docker run -d -p 80:80 -t apache /usr/sbin/httpd -D FOREGROUND

# Setup Docker
#sudo ln -sf /usr/bin/docker.io /usr/local/bin/docker
