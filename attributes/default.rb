#
# Author:: iJet Technologies Engineering (<dustin.vanbuskirk@ijettechnologies.com>)
# Cookbook Name:: concourse
# Attribute:: default
#
# Copyright (c) 2016 iJet Technologies
#
# All rights reserved - Do Not Redistribute
#

default['concourse']['version'] = '0.75.0'
default['concourse']['download']['url'] =
  "https://github.com/concourse/concourse/releases/download/v#{concourse['version']}/concourse_linux_amd64"
default['concourse']['home']['directory'] = '/usr/local/bin'


default['postgresql']['version'] = '9.4'
override['postgresql']['config']['ssl'] = true