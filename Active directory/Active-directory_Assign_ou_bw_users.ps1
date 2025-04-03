# Import the Active Directory modules
Import-Module ActiveDirectory

# Define the target OU
$ouPath = "OU=TargetOU,DC=domain,DC=com"

# Path to the file containing the list of users
$userListPath = "C:\Path\To\UserList.txt"

# Read the list of users from the file
$userList = Get-Content $userListPath

# Iterate over each user in the list
foreach ($user in $userList) {
    # Move the user to the target OU
    $userDN = (Get-ADUser -Identity $user).DistinguishedName
    Move-ADObject -Identity $userDN -TargetPath $ouPath
    Write-Host "Moved user $user to OU $ouPath"
}

Write-Host "All specified users have been moved to the target OU."
