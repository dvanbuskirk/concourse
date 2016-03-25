#
# Author:: iJet Technologies Engineering (<dustin.vanbuskirk@ijettechnologies.com>)
# Cookbook Name:: concourse
# Recipe:: fly_install
#
# Copyright (c) 2016 iJet Technologies
#
# All rights reserved - Do Not Redistribute
#

remote_file "#{node['concourse']['home']['directory']}/fly" do
  source node['concourse']['fly']['download']['url']
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
