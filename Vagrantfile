# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  # Define and configure application servers
  app_servers = { :app1 => '192.168.1.44',
                  :app2 => '192.168.1.45'
                }

  app_servers.each do |app_server_name, app_server_ip|
    config.vm.define app_server_name do |app_config|
      app_config.vm.box = "precise32"
      app_config.vm.host_name = app_server_name.to_s
      app_config.vm.network :hostonly, app_server_ip
      app_config.vm.provision :chef_solo do |chef|
        chef.cookbooks_path = "chef/cookbooks"
        chef.roles_path = "chef/roles"
        chef.data_bags_path = "chef/data_bags"
        chef.add_role "application_server"
      end
    end
  end

  # Configure load balancer
  config.vm.define :load_balancer do |load_balancer_config|
    load_balancer_config.vm.box = "precise32"
    load_balancer_config.vm.host_name = "loadbalancer"
    load_balancer_config.vm.network :hostonly, "192.168.1.43"
    load_balancer_config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "chef/cookbooks"
      chef.roles_path = "chef/roles"
      chef.data_bags_path = "chef/data_bags"
      chef.add_role "load_balancer"
      chef.json = {
        'loadbalancer' => {
          'upstream_servers' => ['192.168.1.44:1337','192.168.1.45:1337']
        }
      }
    end
  end
 
end
