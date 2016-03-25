require 'minitest-chef-handler/spec'
require 'minitest-chef-handler/resources'
require 'minitest-chef-handler/assertions'

describe_recipe 'concourse::default' do

  it 'installs fly' do
    results = `which fly`
    results.must_match /#{node['concourse']['home']['directory']}\/fly/
  end

end