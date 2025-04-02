# Define variables
$Username = "userToOffboard"

# Disable the user account
Disable-ADAccount -Identity $Username

# Remove user from all groups
Get-ADUser -Identity $Username -Property MemberOf | Select-Object -ExpandProperty MemberOf | ForEach-Object {Remove-ADGroupMember -Identity $_ -Members $Username -Confirm:$false}

# Delete the user account
Remove-ADUser -Identity $Username -Confirm:$false

Write-Host "User $Username has been offboarded successfully."
