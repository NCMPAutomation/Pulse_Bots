# Define variables
$Username = "userToMove"
$CurrentGroup = "OldGroup"
$NewGroup = "NewGroup"

# Remove user from the current group
Remove-ADGroupMember -Identity $CurrentGroup -Members $Username -Confirm:$false

# Add user to the new group
Add-ADGroupMember -Identity $NewGroup -Members $Username

Write-Host "User $Username has been moved from $CurrentGroup to $NewGroup successfully."
