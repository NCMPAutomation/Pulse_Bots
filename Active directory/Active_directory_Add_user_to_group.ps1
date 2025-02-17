# Define the user and group
$userName = "UserName"
$groupName = "GroupName"

# Check if the user exists
$user = Get-ADUser -Filter { SamAccountName -eq $userName }

if ($user) {
    # If the user exists, add them to the group
    Add-ADGroupMember -Identity $groupName -Members $userName
    Write-Output "User $userName has been added to the group $groupName."
} else {
    Write-Output "User $userName does not exist in Active Directory."
}