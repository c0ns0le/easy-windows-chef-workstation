# easy-windows-chef-workstation

The user_data.ps1 script in this repository can be used to automatically configure a Windows 7, 8, or 2012 Server machine as a Chef Workstation.  Here's what you get when you run it:

* Preconfigures your workstation for Chef bootstrap by enabling WinRM
* Installs the Chocolatey package manager
* Installs Sublime Text editor, ConEmu, and PSReadline
* Includes a powershell script for changing your desktop background
* Installs the ChefDK which includes Chef, Test Kitchen, Rubocop, Foodcritic, and ChefSpec

There are also some sample .kitchen.yml files in the support_files directory.  You can use these as a starting point for running your own test kitchen setup in Amazon EC2.
