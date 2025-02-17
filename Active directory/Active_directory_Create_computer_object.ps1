# Import the Active Directory module
Import-Module ActiveDirectory

# Define the name of the new computer
$computerName = NewComputerName

# Define the organizational unit (OU) where the computer object will be created
$ou = OU=Computers,DC=example,DC=com

# Create the new computer object in the specified OU
New-ADComputer -Name $computerName -Path $ou -Enabled $true

Write-Host Computer object '$computerName' has been created in '$ou'.
