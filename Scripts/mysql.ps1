
Invoke-WebRequest -Uri https://dev.mysql.com/get/Downloads/MySQLInstaller/mysql-installer-web-community-8.0.36.0.msi -OutFile "$env:TEMP\mysql-installer.msi"
Start-Process -FilePath "$env:TEMP\mysql-installer.msi" -Wait
