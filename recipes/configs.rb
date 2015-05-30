#
# Cookbook Name:: easy-windows-chef-workstation
# Recipe:: configs
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# Configure various things
powershell_script "Install PSGet" do
  code "(new-object Net.WebClient).DownloadString('http://psget.net/GetPsGet.ps1') | iex"
end

powershell_script "Install PSReadLine" do
  code "install-module PSReadLine"
end
