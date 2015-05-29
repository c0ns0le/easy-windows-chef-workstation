#
# Cookbook Name:: easy-windows-chef-workstation
# Recipe:: packages
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# Leverage the community Chocolatey cookbook
include_recipe "chocolatey"

# Install chocolatey packages
node['ewcw']['choco_packages'].each do |package_name, package_version|
  chocolatey package_name do
    action :install
    version package_version
  end
end

# Install the ChefDK
remote_file "#{Chef::Config['file_cache_path']}/ChefDK.msi" do
  action :create
  source node['ewcw']['chefdk']['url']
end

windows_package "ChefDK" do
  action :install
  source "#{Chef::Config['file_cache_path']}/ChefDK.msi"
end
