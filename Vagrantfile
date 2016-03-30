required_plugins = %w( vagrant-omnibus vagrant-berkshelf )
required_plugins.each do |plugin|
  system "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
end

Vagrant.configure("2") do |config|
  config.vm.box               = 'centos7.box'
  config.vm.box_url           =
    'https://f0fff3908f081cb6461b407be80daf97f07ac418.googledrive.com/host/0BwtuV7VyVTSkUG1PM3pCeDJ4dVE/centos7.box'
  config.vm.network 'private_network', ip: '192.168.50.205'
  config.berkshelf.enabled = true
  config.omnibus.chef_version = "12.5.1"
  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "minitest-handler"
    chef.add_recipe "concourse::default"
    #chef.add_recipe "concourse::fly_install"
    #chef.add_recipe "concourse::set_pipelines"
    chef.log_level = 'debug'
    chef.json = {
      'concourse' =>{
        'external' => {
          'url' => 'http://192.168.50.205:8080'
        }
      },
      'postgresql' => {
        'config' => {
          'ssl_cert_file' => '/etc/ssl/certs/server.pem',
          'ssl_key_file' => '/etc/ssl/certs/server.key'
        },
        'password' => {
          'postgres' => 'iloverandompasswordsbutthiswilldo'
        }
      }
    }
  end
end
