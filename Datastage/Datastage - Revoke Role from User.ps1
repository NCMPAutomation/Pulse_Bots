# Import Datastage module
Import-Module Datastage

# Variables
$username = "existinguser"
$role = "Developer"

# Revoke role from user
Remove-DatastageUserRole -Username $username -Role $role

# Output status
Write-Output "Role $role revoked from user $username."
