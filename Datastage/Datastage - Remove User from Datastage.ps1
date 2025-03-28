# Import Datastage module
Import-Module Datastage

# Variables
$username = "userToRemove"

# Remove user from Datastage
Remove-DatastageUser -Username $username

# Output status
Write-Output "User $username removed successfully."
