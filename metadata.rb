name             'concourse'
maintainer       'iJet Technologies'
maintainer_email 'team.development@ijettechnologies.com'
license          'All rights reserved'
description      'Installs concourse and fly-cli, adds resources for fly-cli'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.1'

supports         'ubuntu'
supports         'centos'

depends          'database'
depends          'iptables'