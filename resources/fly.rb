#
# Cookbook Name:: concourse
# Resource:: fly
#
# Copyright 2016, iJet Technologies
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#
# actions :builds, :set_pipeline
# default_action :builds
#
# attribute :concourse_url, :kind_of => String, :required => true
# attribute :username, :kind_of => String, :required => true
# attribute :password, :kind_of => String, :required => true
# attribute :insecure, :kind_of => [ TrueClass, FalseClass ], :default => true

include Fly::Helper

resource_name :fly
actions :builds
default_action :builds

property :concourse_url, String, default: node['concourse']['external']['url']
property :fly_executable, String, default: "#{node['concourse']['home']['directory']}/fly"
property :username, String, default: 'myuser'
property :password, String, default: 'mypass'
property :insecure, [ TrueClass, FalseClass ], default: true
property :pipeline_name, String
property :pipeline_yml, String

action :builds do
  login(concourse_url, fly_executable, username, password, insecure)
  execute "#{fly_executable} -t l builds"
end

action :set_pipeline do
  login(concourse_url, fly_executable, username, password, insecure)
  cookbook_file pipeline_yml do
    source pipeline_yml
    action :create
  end
  execute "#{fly_executable} -t l set-pipeline -p #{pipeline_name} -c #{pipeline_yml} -n"
end