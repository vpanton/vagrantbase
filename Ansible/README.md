# oracledb-ansible
Ansible playbook to configure a CentOS/RHEL/Oracle Linux 7 server with Oracle 12c R1 Enterprise Edition Database

For run the playbook using the vagrant configuration for test it you need to:

Download from Oracle support the Oracle installation files: 
- linuxamd64_12102_database_1of2.zip
- linuxamd64_12102_database_1of2.zip
and put them to folder roles/oracle-install/files inside checkout folder

After go into checkout folder and execute :

vagrant up 

After a few minutes a virtual machine with Oracle Database will be ready for you without any further configuration. You can access the Enterprise Manager Express using sys/sysdba and “oracle” as password.

https://oradb3.private:5500/em

You can shutdown the virtual machine using:

vagrant halt

You can destroy it (delete from disk) using:

vagrant destroy

password for Oracle Operating system user is welcome1

more details at my article here: http://www.nodalpoint.com/devops-ansible-oracle-database-oraclelinux-7-vagrant/

# ansible-weblogic-fmw-infra-12c-R2
Ansible playbook for deploy and create a WebLogic 12c R2 Domain with Oracle Fusion Middleware Infrastructure automatically

Vagrant configuration included. You can download it and test it with vagrant running from folder:

$ vagrant up

You can connect to Enterprise Manager using http://192.168.56.14:7001/em using weblogic/welcome1.

Playbook includes the following roles:
- linux-wls
- linux-jdk
- fmw-software
- fmw-domain
- node-manager
- start-admin-server
- fmw-managed-server

linux-wls:
This role configures the Linux system with requirements to run the WebLogic domain.

linux-jdk:
This role configures the Linux system with JDK8

fmw-software:
This role installs the the Fusion Middleware Software 12c R2

fmw-domain:
This role creates and configures a Domain with Fusion Middleware software

node-namager:
This role configures and starts the Nodemanager. It also configures systemd to start automatically the nodemanager after restart

start-admin-server:
This starts the Admin server using nodemanager for the first time. Creates some initial configuration like boot.properties file

fmw-manager-server:
This role creates and starts a managed server with JRF template. (Ready to host ADF or other Fusion Middleware applications)

More information here:

http://unversioned.blogspot.gr/2015/11/using-ansible-to-install-weblogic-12c.html
