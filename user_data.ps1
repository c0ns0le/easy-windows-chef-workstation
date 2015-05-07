<powershell>
# Prep the machine for Chef bootstrap
winrm quickconfig -q
winrm set winrm/config/winrs '@{MaxMemoryPerShellMB="300"}'
winrm set winrm/config '@{MaxTimeoutms="1800000"}'
winrm set winrm/config/service '@{AllowUnencrypted="true"}'
winrm set winrm/config/service/auth '@{Basic="true"}'
netsh advfirewall firewall add rule name="WinRM 5985" protocol=TCP dir=in localport=5985 action=allow
netsh advfirewall firewall add rule name="WinRM 5986" protocol=TCP dir=in localport=5986 action=allow
net stop winrm
sc config winrm start=auto
net start winrm

# Change admin password
$admin = [adsi]("WinNT://./administrator, user")
#$admin.psbase.invoke("SetPassword", "#{PASSWORD}")
$admin.psbase.invoke("SetPassword", "CHANGEMETOSOMETHINGELSEPLEASE")

# Install chocolatey and packages
iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
choco install -y git
choco install -y sublime
choco install -y conemu

# For some reason Git's bin directory is not added to the PATH
$AddedLocation = "C:\Program Files (x86)\Git\bin"
$Reg = "Registry::HKLM\System\CurrentControlSet\Control\Session Manager\Environment"
$OldPath = (Get-ItemProperty -Path "$Reg" -Name PATH).Path
$NewPath = $OldPath + ';' + $AddedLocation
Set-ItemProperty -Path "$Reg" -Name PATH -Value $NewPath

# Install Sublime Desktop Shortcut
$ws = New-Object -com WScript.Shell
$Dt = $ws.SpecialFolders.Item("Desktop")
$Scp = Join-Path -Path $Dt -ChildPath "Sublime Text.lnk"
$Sc = $ws.CreateShortcut($Scp)
$Sc.TargetPath = "C:\\Program Files\\Sublime Text 2\\sublime_text.exe"
$Sc.Save()

# Grab the wallpaper changing powershell script
Set-ExecutionPolicy unrestricted
cd C:\Users\Administrator\Pictures
wget http://i.imgur.com/TwOnX6j.jpg -OutFile win_xp_chef.jpg
cd C:\Users\Administrator\
wget https://gist.githubusercontent.com/scarolan/2e565bff0a6702a3a9cb/raw/fbf5e1662d00184d5ab9e41c6842dcc076989e05/set-wallpaper.ps1 -OutFile set-wallpaper.ps1
# This doesn't work for some reason
$command = "C:\Users\Administrator\set-wallpaper.ps1 MyPics win_xp_chef.jpg"
Invoke-Expression $command

# Install PsGet and PSReadLine
iex ((new-object net.webclient).DownloadString('https://psget.net/GetPsGet.ps1'))
Install-Module PSReadline

# Install the ChefDK
choco install -y chefdk -version 0.4.0.1 --force

</powershell>
