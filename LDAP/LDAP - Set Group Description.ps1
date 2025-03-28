# Import the Active Directory module
Import-Module ActiveDirectory

# Define the group name and description
$groupName = "groupToDescribe"
$description = "This is a test group"

# Set the group description
Set-ADGroup -Identity $groupName -Description $description
