#
# Cookbook Name:: easy-windows-chef-workstation
# Recipe:: packages
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# Install chocolatey
#powershell_script "install_chocolatey" do
#  action :run
#  code "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))"
#end

include_recipe "chocolatey"

# Install packages from chocolatey
node['ewcw']['choco_packages'].each do |package_name, package_version|
  #log "package name" do
  #  message "#{package_name}, #{package_version}"
  #  level :warn
  #end

  chocolatey package_name do
    action :install
    version package_version
  end
end
