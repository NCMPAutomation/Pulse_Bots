# Import the Active Directory module
Import-Module ActiveDirectory

# Define the group name
$groupName = "GroupName"

# Path to the file containing the list of users
$userListPath = "C:\Path\To\UserList.txt"

# Read the list of users from the file
$userList = Get-Content $userListPath

# Iterate over each user in the list
foreach ($user in $userList) {
    # Remove the user from the group
    Remove-ADGroupMember -Identity $groupName -Members $user -Confirm:$false
    Write-Host "Removed user $user from group $groupName"
}

Write-Host "All specified users have been removed from the group."
