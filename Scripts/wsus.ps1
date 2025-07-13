Install-WindowsFeature -Name UpdateServices -IncludeManagementTools
Start-Process -FilePath "C:\Program Files\Update Services\Tools\wsusutil.exe" -ArgumentList "postinstall" -Wait
