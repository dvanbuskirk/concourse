name             'concourse'
maintainer       'iJet Technologies'
maintainer_email 'dustin.vanbuskirk@ijettechnologies.com'
license          'All rights reserved'
description      'Installs concourse for Vagrant currently'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.3'

supports         'centos', '>= 7.0'

depends          'database', '~> 4.0'
depends          'iptables', '~> 2.2'
depends          'firewalld', '~> 1.1'
