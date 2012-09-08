#
# Cookbook Name:: loadbalancer
# Recipe:: default
#

require_recipe "nginx"

template '/etc/nginx/sites-available/default' do
  source 'loadbalancer.conf.erb'
  variables({
    :upstream_servers => node[:loadbalancer][:upstream_servers]
  })
  notifies :restart, resources(:service => "nginx")
end

  
