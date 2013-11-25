#
# Author:: Julian Dunn <jdunn@secondmarket.com>
# Cookbook Name:: hipchat_handler
# Recipe:: default
#
# Copyright 2012, SecondMarket Labs, LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

if Chef::Config[:solo]
  Chef::Log.warn("Recipe needs data bag access, will run in test-mode with Solo.")
end

include_recipe "chef_handler"

require "rubygems"

chef_gem 'httparty' do
  version node['hipchat_handler']['httparty_version']
  action :nothing
end.run_action(:install)

chef_gem "hipchat" do
  action :install
  version node[:hipchat_handler][:version]
end

chef_handler "HipChat::NotifyRoom" do
  source "#{Gem::default_dir}/gems/hipchat-#{node[:hipchat_handler][:version]}/lib/hipchat/chef.rb"
  arguments [data_bag_item('hipchat_apikeys', 'chef')["apikey"], node[:hipchat_handler][:room_name]]
  supports :exception => true
  action :enable
end.run_action(:enable)
