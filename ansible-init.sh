#!/bin/bash
#sudo rpm -iUvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm

yum install -y epel-release
yum -y update
yum -y install ansible
ansible --version
ssh-keygen -q -b 4048 -t rsa -C "ansible.private" -f /home/vagrant/.ssh/id_rsa -N ''
chown -R vagrant:vagrant /home/vagrant/.ssh/
cp /home/vagrant/.ssh/id_rsa.pub /keys

