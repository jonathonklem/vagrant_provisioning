# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # set our base image
  config.vm.box = "trusty"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  # set our IP
  config.vm.network "private_network", ip: "10.10.10.10"
  
  # fix issues on some test systems with memory allocation
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus   = 2
  end

  # Tell Vagrant how we're going to provision our virtual machine
  # here we're copying a file over and using a simple shell script
  config.vm.provision "file", source: "Dockerfile", destination: "Dockerfile"
  config.vm.provision "file", source: "connectToDocker.sh", destination: "connectToDocker.sh"
  config.vm.provision "shell", path:   "provision.sh"
end
