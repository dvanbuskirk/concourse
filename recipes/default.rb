#
# Author:: iJet Technologies Engineering (<dustin.vanbuskirk@ijettechnologies.com>)
# Cookbook Name:: concourse
# Recipe:: default
#
# Copyright (c) 2016 iJet Technologies
#
# All rights reserved - Do Not Redistribute
#

# Workaround for https://github.com/hw-cookbooks/postgresql/issues/340

node.force_override['postgresql']['dir'] = '/var/lib/pgsql/data'
node.force_override['postgresql']['config']['data_directory'] = '/var/lib/pgsql/data'

directory '/etc/ssl/private' do
  recursive true
end

# Have to run this 1st in order to get certs installed for correct user postgres

group 'postgres' do
  gid 26
end

user 'postgres' do
  shell '/bin/bash'
  comment 'PostgreSQL Server'
  home '/var/lib/pgsql'
  gid 'postgres'
  system true
  uid 26
  supports :manage_home => false
end

openssl_x509 '/etc/ssl/certs/server.pem' do
  common_name 'www.f00bar.com'
  org 'Foo Bar'
  org_unit 'Lab'
  country 'US'
  owner 'postgres'
  group 'postgres'
  mode '0600'
end

include_recipe 'postgresql::server'

include_recipe 'database::postgresql'

# create a postgresql database
postgresql_database 'atc' do
  connection(
      :host      => 'localhost',
      :port      => 5432,
      :username  => 'postgres',
      :password  => node['postgresql']['password']['postgres']
  )
  action :create
end

# Install concourse

app_dir = node['concourse']['home']['directory']

case node['platform_family']
  when 'debian'
    include_recipe 'iptables'

    iptables_rule 'http_8080' do
      action :enable
      not_if { ::File.exists?('/etc/iptables.d/http_8080') }
    end
  when 'rhel'
    include_recipe 'firewalld'

    firewalld_port '8080/tcp' do
      action :add
      zone   'public'
    end
end

file '/var/log/concourse'

template '/usr/lib/systemd/system/concourse.service' do
  source 'concourse.service.erb'
  mode '0440'
  owner 'root'
  group 'root'
  variables({
    :app_dir => app_dir
  })
end

remote_file "#{app_dir}/concourse" do
  source node['concourse']['download']['url']
  owner 'root'
  group 'root'
  mode '0755'
  action :create
  notifies :run, 'script[generate ssh keys]', :immediately
  notifies :restart, 'service[concourse]', :immediately
  notifies :enable, 'service[concourse]', :delayed
end

script 'generate ssh keys' do
  interpreter 'sh'
  cwd app_dir
  code <<-EOH
    ssh-keygen -t rsa -f host_key -N ''
    ssh-keygen -t rsa -f worker_key -N ''
    ssh-keygen -t rsa -f session_signing_key -N ''
    cp worker_key.pub authorized_worker_keys
   EOH
  action :nothing
end

service 'concourse' do
  action :start
end
