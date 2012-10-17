maintainer       "SecondMarket Holdings, Inc."
maintainer_email "systems@secondmarket.com"
license          "Apache 2.0"
description      "Install HipChat handler for Chef runs"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.0.1"

depends          "chef_handler"

recipe "hipchat_handler", "Installs HipChat handler using the chef_handler LWRP"

%w{ debian ubuntu centos redhat fedora freebsd scientific amazon }.each do |os|
  supports os
end
