class NOUSSetup
  def NOUSSetup.configure(config, settings)
    # Configure The Box
    config.vm.box = "ubuntu/trusty64"
    config.vm.hostname = "localdev"

    # Configure A Private Network IP
    config.vm.network :private_network, ip: settings["ip"] ||= "192.168.10.10"

    # Configure A Few VirtualBox Settings
    config.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", settings["memory"] ||= "512"]
      vb.customize ["modifyvm", :id, "--cpus", settings["cpus"] ||= "1"]
      vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end

    # Configure Port Forwarding To The Box
    settings["ports"].each do |port|
      config.vm.network "forwarded_port", guest: port["map"], host: port["to"]
    end

    # Register All Of The Configured Shared Folders
    settings["folders"].each do |folder|
      config.vm.synced_folder folder["map"], folder["to"], type: folder["type"] ||= nil
    end

    config.vm.provision "shell" do |s|
      s.inline = "/bin/bash /vagrant/scripts/provision.sh"
    end

    config.vm.provision "shell", run: "always" do |s|
      s.inline = "/bin/bash /vagrant/scripts/startDockers.sh"
    end
  end
end
