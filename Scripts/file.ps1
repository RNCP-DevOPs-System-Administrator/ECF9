Install-WindowsFeature -Name FS-FileServer -IncludeAllSubFeature -IncludeManagementTools
New-Item -Path "E:\Share" -ItemType Directory
