# Import the Active Directory module
Import-Module ActiveDirectory

# Define the group name
$groupName = "GroupToGetMembers"

# Get group members
Get-ADGroupMember -Identity $groupName
