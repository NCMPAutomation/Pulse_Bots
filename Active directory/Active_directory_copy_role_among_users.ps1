# Import the Active Directory module
Import-Module ActiveDirectory

# Define the source username
$sourceUsername = "SourceUsername"

# Path to the file containing the list of target users
$userListPath = "C:\Path\To\UserList.txt"

# Get the list of groups the source user is a member of
$sourceGroups = Get-ADUser -Identity $sourceUsername -Properties MemberOf | Select-Object -ExpandProperty MemberOf

# Read the list of target users from the file
$targetUsers = Get-Content $userListPath

# Iterate over each target user
foreach ($user in $targetUsers) {
    foreach ($group in $sourceGroups) {
        # Add the target user to each group
        Add-ADGroupMember -Identity $group -Members $user
        Write-Host "Added user $user to group $group"
    }
}

Write-Host "Roles have been successfully copied from $sourceUsername to all specified users."
