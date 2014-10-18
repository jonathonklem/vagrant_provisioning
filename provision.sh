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
echo "RUN yum -y install apache php wget" >> Dockerfile
# this isn't necessary echo "RUN service httpd start" >> Dockerfile
# with cent OS 5 we can't just yum install git -- https://gist.github.com/eddarmitage/2001099
echo "RUN wget http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.2-2.el5.rf.i386.rpm" >> Dockerfile
echo "RUN rpm -i rpmforge-release-0.5.2-2.el5.rf.i386.rpm" >> Dockerfile
echo "RUN yum -y install git-gui" >> Dockerfile
echo "git clone https://github.com/jonathonklem/fake_website.git /var/www/html" >> Dockerfile

# intall ns enter to enter our docker container
docker run -v /usr/local/bin:/target jpetazzo/nsenter

# build our docker container
docker build -t apache .

# run it in daemon mode
docker run -d -p 80:80 -t apache /usr/sbin/httpd -D FOREGROUND

# Setup Docker
#sudo ln -sf /usr/bin/docker.io /usr/local/bin/docker
