name             'concourse'
maintainer       'iJet Technologies'
maintainer_email 'dustin.vanbuskirk@ijettechnologies.com'
license          'All rights reserved'
description      'Installs concourse for Vagrant currently'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.1'

supports         'centos'

depends          'database'
depends          'iptables'