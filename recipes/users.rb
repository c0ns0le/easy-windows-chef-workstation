#
# Cookbook Name:: easy-windows-chef-workstation
# Recipe:: users
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

user node['ewcw']['admin']['username'] do
  action :create
  password node['ewcw']['admin']['password']
end

group "Administrators" do
  members ["#{node['name']}\\#{node['ewcw']['admin']['username']}"]
  append true
  action :modify
end
