#
# Cookbook Name:: gitolite
# Attributes:: default
#
# Copyright 2010, RailsAnt, Inc.
# Copyright 2012, Gerald L. Hevener
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
# limitations under the License.

default['gitolite']['gitolite_url'] = "git://github.com/sitaramc/gitolite.git"
default['gitolite']['gitolite_reference'] = "master"
default['gitolite']['user'] = "git"
default['gitolite']['group'] = "git"

# Set git home directory
default['gitolite']['home'] = "/var/git"

# Set gitolite home directory
default['gitolite']['gitolite_home'] = "#{node['gitolite']['home']}/gitolite"

# Set gitolite umask
default['gitolite']['umask'] = "0007"
