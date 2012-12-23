#
# Cookbook Name:: gitolite
# Recipe:: default
#
# Copyright 2010, RailsAnt, Inc.
# Copyright 2012, Gerald L. Hevener Jr., M.S.
# Copyright 2012, Eric G. Wolfe
# Copyright 2012, Ryosuke IWANAGA
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
#
%w{ git perl }.each do |cb_include|
  include_recipe cb_include
end

# Install missing perl modules
case node['platform']
when "redhat","centos","scientific","amazon","oracle","fedora"
  package "perl-Time-HiRes"
end

# Add git user
# Password isn't set correctly in original recipe, and really no reason to set one.
user node['gitolite']['user'] do
  comment "Git User"
  home node['gitolite']['home']
  shell "/bin/bash"
  supports :manage_home => true
end

directory node['gitolite']['home'] do
  owner node['gitolite']['user']
  group node['gitolite']['group']
  mode 0750
end

%w{ bin repositories }.each do |subdir|
  directory "#{node['gitolite']['home']}/#{subdir}" do
    owner node['gitolite']['user']
    group node['gitolite']['group']
    mode 0775
  end
end

# Create a $HOME/.ssh folder
directory "#{node['gitolite']['home']}/.ssh" do
  owner node['gitolite']['user']
  group node['gitolite']['group']
  mode 0700
end

# Clone gitolite repo from github
git node['gitolite']['gitolite_home'] do
  repository node['gitolite']['gitolite_url']
  reference node['gitolite']['gitolite_reference']
  user node['gitolite']['user']
  group node['gitolite']['group']
  action :checkout
end

# Gitolite application install script
execute "gitolite-install" do
  user node['gitolite']['user']
  cwd node['gitolite']['home']
  command "#{node['gitolite']['gitolite_home']}/install -ln #{node['gitolite']['home']}/bin"
  creates "#{node['gitolite']['home']}/bin/gitolite"
end

# Gitolite.rc template
template "#{node['gitolite']['home']}/.gitolite.rc" do
  source "gitolite.rc.erb"
  owner node['gitolite']['user']
  group node['gitolite']['group']
  mode 0644
  variables(
    :gitolite_umask => node['gitolite']['umask']
  )
end
