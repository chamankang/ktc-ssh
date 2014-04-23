#
# Cookbook Name:: ktc-ssh
# Recipe:: default
#
# Copyright (C) 2013 Jesse Nelson
#
# All rights reserved - Do Not Redistribute
#

# UCLOUDNG-1473 Block ssh from vm
if node['hostname'].include?('cnode')
  include_recipe 'ktc-utils'

  ip = KTC::Network.address 'management'
  node.set['openssh']['server']['listen_address'] = ip
end

include_recipe 'openssh'
