# Import Datastage module
Import-Module Datastage

# Variables
$username = "existinguser"
$role = "Developer"

# Assign role to user
Add-DatastageUserRole -Username $username -Role $role

# Output status
Write-Output "Role $role assigned to user $username."
