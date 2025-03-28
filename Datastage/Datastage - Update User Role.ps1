# Import Datastage module
Import-Module Datastage

# Variables
$username = "existinguser"
$newRole = "Administrator"

# Update user role
Set-DatastageUserRole -Username $username -Role $newRole

# Output status
Write-Output "User $username role updated to $newRole."
