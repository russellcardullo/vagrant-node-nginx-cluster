#
# Cookbook Name:: nodeapp
# Recipe:: default
#
#
include_recipe 'node'

cookbook_file '/usr/local/bin/app.js' do
  action :create
  source 'app.js'
end

node_server 'nodeapp' do
  script '/usr/local/bin/app.js'
  action :start
end

