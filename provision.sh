#!/bin/bash
# Author: Jon Klem <jonathonklemp@gmail.com>
# Written for Ubuntu Trusty, should be adaptable to other distros.

## Variables
HOME=/root
cd $HOME

apt-get update -qq
apt-get install -yq git docker.io

# Setup Docker
#sudo ln -sf /usr/bin/docker.io /usr/local/bin/docker
