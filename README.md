# vagrant
```
"nodes" - root 
    "node1" - node name
        "vbox_vms_path" - VirtualBox VM location
        "box_name" - box name
        "domain_name" - domain_name
        "memory" 
        "cpu"
        "ip_host_only_adapter" - ip address your host only adapter (ip or "")
        "host_ssh_port" - port forwarding for ssh (required)
        "synced_folder" - array
            "host_path" - (path or "")
            "guest_path"
        "forwarded_ports" - array
            "host" - (port or "")
            "guest"
            "id"
        "init_script" - init script, run after created VM (script name or "")
        "hdd2_size" - add second hdd (size in Gb or "")
```
