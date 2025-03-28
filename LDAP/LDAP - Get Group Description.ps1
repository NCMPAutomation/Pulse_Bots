# Import the Active Directory module
Import-Module ActiveDirectory

# Define the group name
$groupName = "groupToGetDescription"

# Get the group description
Get-ADGroup -Identity $groupName -Properties Description | Select-Object Name, Description
