#!/bin/bash

cat /keys/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
cat /keys/id_rsa.pub >> /root/.ssh/authorized_keys
