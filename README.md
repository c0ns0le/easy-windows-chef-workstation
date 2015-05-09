# easy-windows-chef-workstation

The user\_data.ps1 script in this repository can be used to automatically configure a Windows 7, 8, or 2012 Server machine as a Chef Workstation.  Here's what you get when you run it:

* Preconfigures your workstation for Chef bootstrap by enabling WinRM
* Installs the Chocolatey package manager
* Installs Sublime Text editor, ConEmu, and PSReadline
* Includes a powershell script for changing your desktop background
* Installs the ChefDK which includes Chef, Test Kitchen, Rubocop, Foodcritic, and ChefSpec

There are also some sample .kitchen.yml files in the support\_files directory.  You can use these as a starting point for running your own test kitchen setup in Amazon EC2.

Manual steps to finish workstation configuration:

* Delete amazon shortcuts from desktop
* Add license file to Sublime
* Run ConEmu once to choose Powershell/Admin as the terminal
* Put gramsay's ssh key in C:\Users\Administrator\\.ssh\gramsay.pem
* Update windows background with: set-wallpaper.ps1 MyPics win\_xp\_chef.jpg
* git clone https://github.com/chefosaurus/easy-windows-chef-workstation
* Copy .rubocop.yml from support\_files to ~/.rubocop.yml
* Move support\_files to the Desktop, rename it Test\_Kitchen
* Put AWS API keys into kitchen.yml.centos, etc. files
