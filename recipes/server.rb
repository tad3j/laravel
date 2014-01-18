#
# Cookbook Name:: laravel
# Recipe:: server
#
# Copyright 2014, Michael Beattie
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

execute "Prepare Apache and Virt Host" do
	action :run
	command "sudo a2enmod rewrite"
end

web_app "laravel" do
  template "laravel.conf.erb"
  docroot "#{node['laravel']['project_root']}/#{node['laravel']['project_name']}/public"
  server_name node['fqdn']
  server_aliases node['fqdn']
  enable true
end