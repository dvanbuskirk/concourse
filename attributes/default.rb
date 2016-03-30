#
# Author:: iJet Technologies Engineering (<dustin.vanbuskirk@ijettechnologies.com>)
# Cookbook Name:: concourse
# Attribute:: default
#
# Copyright (c) 2016 iJet Technologies
#
# All rights reserved - Do Not Redistribute
#

default['concourse']['version'] = '1.0.0'
default['concourse']['download']['url'] =
  "https://github.com/concourse/concourse/releases/download/v#{concourse['version']}/concourse_linux_amd64"
default['concourse']['home']['directory'] = '/usr/local/bin'
default['concourse']['external']['url'] = 'http://127.0.0.1:8080'

# You have to download fly manually and store in some shared location
# Improvement: https://www.pivotaltracker.com/story/show/115872395
# Replace attribute below with a your fly location
default['concourse']['fly']['download']['url'] = 'https://github.com/concourse/fly/issues/65'

# postgresql cookbook attributes
default['postgresql']['version'] = '9.4'
override['postgresql']['config']['ssl'] = true