# -*- mode: ruby -*-
# vi: set ft=ruby :

# read vm configurations from JSON files
nodes_config = (JSON.parse(File.read("config.json")))['nodes']


Vagrant.configure(2) do |config|
    # Отключить дефолтную шару
    config.vm.synced_folder ".", "/vagrant", disabled: true
    nodes_config.each do |node|
      node_name   = node[0] # name of node
      node_values = node[1] # content of node
      config.vm.define node_name do |config|
        # Поднять машину из образа "ubuntu/trusty64"
        config.vm.box = node_values['box_name']
        # Проброс портов между хостовой и гостевой машиной, если указаны в JSON конфигурации
        node_values['forwarded_ports'].each do |port|
          if (port['host'] != "")
            config.vm.network :forwarded_port, host: port['host'], guest: port['guest'], id: port['id']
          end
        end
        # Настройка SSH доступа
        config.vm.network :forwarded_port, guest: 22, host: node_values['host_ssh_port'], id: "ssh"
        # Отключить дефолтную шару
        config.vm.synced_folder ".", "/vagrant", disabled: true
        # Добавить шару между хостовой и гостевой машиной, если указаны в JSON конфигурации
        node_values['synced_folder'].each do |path|
          if (path['host_path'] != "")
            config.vm.synced_folder path['host_path'], path['guest_path']
          end
        end
        # Hostname который будет присвоен VM (самой ОС)
        config.vm.hostname = node_name + node_values['domain_name']
        # Добавлять или нет врорую серевую карту
        if (node_values['ip_host_only_adapter'] != "")
          config.vm.network :private_network, ip: node_values['ip_host_only_adapter']
        end
        config.vm.provider :virtualbox do |vb|
          # Размер RAM памяти
          vb.memory = node_values['memory']
          # set the number of cpus
          vb.cpus = node_values['cpu']
          # Можно перезаписать название VM в Vbox GUI
          vb.name = node_name + node_values['domain_name']
          # Добавление жесткого диска, если такой указан в конфигурации
          if (node_values['hdd2_size'] != "")
            hdd2_name = node_values['vbox_vms_path'] + "/" + vb.name + "/" + node_name + "_hdd2.vdi"
            # Не создавать диск, если он уже существует
            unless File.exist?(hdd2_name)
              vb.customize ["createhd", "--filename", hdd2_name, "--size", node_values['hdd2_size'] * 1024]
            end
            # Подключить созданный диск к поточной VM
            vb.customize ["storageattach", :id, "--storagectl", "SATAController", "--port", 1, "--device", 0, "--type", "hdd", "--medium", hdd2_name]
          end # if (!node_values['hdd2_size']
        end # config.vm.provider :virtualbox
        if (node_values['init_script'] != "")
          config.vm.provision "shell", path: node_values['init_script']
        end
      end # config.vm.define node_name
    end # nodes_config.each
end  # Vagrant.configure(2)
