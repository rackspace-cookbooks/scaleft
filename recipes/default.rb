#
# Cookbook Name:: scaleft
# Recipe:: default
#
# Copyright 2016, Rackspace
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

case node['platform_family']
when 'debian'
  apt_repository 'scaleft' do
    uri 'https://pkg.scaleft.com/deb'
    distribution 'linux'
    components %w(main)
    keyserver 'keyserver.ubuntu.com'
    key 'https://dist.scaleft.com/pki/scaleft_deb_key.asc'
    action :add
  end
when'rhel'
  yum_repository 'scaleft' do
    description 'Official ScaleFT Yum repo'
    baseurl 'https://pkg.scaleft.com/rpm'
    gpgkey 'https://dist.scaleft.com/pki/scaleft_rpm_key.asc'
    action :create
    gpgcheck true
  end
else
  fail "Platform #{node['platform_family']} is not currently supported"
end

# Create the config file
include_recipe "scaleft::sftd_config"

package 'scaleft-server-tools' do
  action :install
end

# https://github.com/rackspace-cookbooks/scaleft/issues/2
execute 'chkconfig_add_sftd' do
  command 'chkconfig --add sftd'
  only_if { node['platform_family'] == 'rhel' && node['platform_version'].to_f < 7 }
  not_if 'chkconfig --list | grep -q sftd'
end

service 'sftd' do
  action [:enable, :start]
end
