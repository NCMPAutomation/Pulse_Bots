# Import the Active Directory module
Import-Module ActiveDirectory

# Define the group name that grants portal access
$groupName = "PortalAccessGroup"

# Define the list of usernames to be added to the portal access group
$users = @("user1", "user2", "user3")

# Loop through each user and add them to the portal access group
foreach ($user in $users) {
    Add-ADGroupMember -Identity $groupName -Members $user
    Write-Host "User account '$user' has been added to group '$groupName'."
}
