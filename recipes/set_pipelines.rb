#
# Author:: iJet Technologies Engineering (<dustin.vanbuskirk@ijettechnologies.com>)
# Cookbook Name:: concourse
# Recipe:: set_pipelines
#
# Copyright (c) 2016 iJet Technologies
#
# All rights reserved - Do Not Redistribute
#

# Example of using the fly resource to create a pipeline in your wrapper cookbook

fly 'set default pipeline' do
  pipeline_name 'really-cool-pipeline'
  pipeline_yml 'somewhere.yml'
  action :set_pipeline
end