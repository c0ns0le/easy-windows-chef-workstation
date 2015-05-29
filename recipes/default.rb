#
# Cookbook Name:: easy-windows-chef-workstation
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe "easy-windows-chef-workstation::users"
include_recipe "easy-windows-chef-workstation::packages"
include_recipe "easy-windows-chef-workstation::configs"
