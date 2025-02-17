# Import the Active Directory module
Import-Module ActiveDirectory

# Define the group name to which users will be added (e.g., "Domain Admins")
$groupName = "GroupName"

# Define the list of usernames to be added to the group
$users = @("user1", "user2", "user3")

# Loop through each user and add them to the specified group
foreach ($user in $users) {
    Add-ADGroupMember -Identity $groupName -Members $user
    Write-Host "User account '$user' has been added to group '$groupName'."
}
