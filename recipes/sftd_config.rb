#
# Cookbook Name:: scaleft
# Recipe:: sftd_config
#
# Copyright 2017, Omnyway and Rackspace
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

directory '/etc/sft' do
  action :create
end

if (node['scaleft']['initial_url_required'] &&
   node['scaleft']['initial_url'].nil?)
  fail "The attribute node['scaleft']['initial_url'] must be set"
end

# Gets all its config from node attributes
template '/etc/sft/sftd.yaml' do
  source 'sftd.yaml.erb'
  owner 'root'
  group 'root'
  mode '0755'
  notifies :restart, 'service[sftd]', :delayed
end
