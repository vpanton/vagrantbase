# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"

  # config.vm.box_check_update = false

  # config.vm.network "forwarded_port", guest: 22, host: 2223

  config.vm.network "private_network", ip: "192.168.56.101"

  # config.vm.network "public_network"

  # config.vm.synced_folder "D:/Docker", "/vagrant_data"

   config.vm.provider "virtualbox" do |vb|
  #   vb.gui = true
     vb.memory = "512"
   end

   config.vm.provision "shell", inline: <<-SHELL
     sudo apt-get update
  #   sudo apt-get install -y apache2
     sudo apt-get install -y mc
   SHELL

end
