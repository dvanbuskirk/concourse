#
# Cookbook Name:: ijet__cookbook_
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'concourse::default' do

  context 'When all attributes are default, on a centos platform' do

    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.0')
      runner.converge(described_recipe)
    end

  end

end
