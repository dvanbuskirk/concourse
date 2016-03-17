require 'minitest-chef-handler/spec'
require 'minitest-chef-handler/resources'
require 'minitest-chef-handler/assertions'

describe_recipe 'concourse::default' do

  it 'runs concourse' do
    results = `systemctl status concourse`
    results.must_match /running/
  end

end
