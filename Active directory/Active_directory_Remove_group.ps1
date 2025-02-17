# Import the Active Directory module
Import-Module ActiveDirectory

# Define the group name
$groupName = "GroupName"

# Remove the group from Active Directory
Remove-ADGroup -Identity $groupName -Confirm:$false

Write-Host "The group $groupName has been removed from Active Directory."
