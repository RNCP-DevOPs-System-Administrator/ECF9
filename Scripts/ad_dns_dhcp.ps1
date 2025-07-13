Install-WindowsFeature -Name AD-Domain-Services, DNS, DHCP -IncludeManagementTools

# Configuration basique d’un domaine
Install-ADDSForest `
    -DomainName "entreprise.local" `
    -DomainNetbiosName "ENTREPRISE" `
    -SafeModeAdministratorPassword (ConvertTo-SecureString "P@ssw0rd123" -AsPlainText -Force) `
    -InstallDNS `
    -Force
