FROM centos:centos5

# modify docker script to provision the server
RUN yum -y update
RUN yum -y install apache php wget

#with cent OS 5 we can't just yum install git -- https://gist.github.com/eddarm itage/2001099
RUN wget http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.2-2.el5.rf.i386.rpm
RUN rpm -i rpmforge-release-0.5.2-2.el5.rf.i386.rpm
RUN yum -y install git-gui
RUN git clone https://github.com/jonathonklem/fake_website.git /var/www/html
