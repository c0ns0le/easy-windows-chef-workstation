# Default attributes file for easy-windows-chef-workstation
default['ewcw']['admin']['username'] = 'Chef'
default['ewcw']['admin']['password'] = 'password'
default['ewcw']['choco_packages'] = { git: '1.9.5.20150320', sublime: '2.0.2', conemu: '15.5.13.0' }
default['ewcw']['chefdk']['url'] = 'https://opscode-omnibus-packages.s3.amazonaws.com/windows/2008r2/x86_64/chefdk-0.6.0-1.msi'
