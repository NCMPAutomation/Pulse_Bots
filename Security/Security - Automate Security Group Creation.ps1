# Import the Active Directory module
Import-Module ActiveDirectory

# Define group details
$GroupName = "NewSecurityGroup"
$OU = "OU=Groups,DC=example,DC=com"

# Create the security group
New-ADGroup -Name $GroupName -GroupScope Global -GroupCategory Security -Path $OU