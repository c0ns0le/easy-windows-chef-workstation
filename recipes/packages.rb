#
# Cookbook Name:: easy-windows-chef-workstation
# Recipe:: packages
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# Install chocolatey
powershell_script "install_chocolatey" do
  action :run
  code "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))"
end

# Install packages from chocolatey
node['ewcw']['choco_packages'].each do |package_name, package_version|
  #log "package name" do
  #  message "#{package_name}, #{package_version}"
  #  level :warn
  #end

  powershell_script "install_chocolatey_package" do
    cwd Chef::Config[:file_cache_path]
    action :run
    code "choco install #{package_name} -version #{package_version}"
  end
end
