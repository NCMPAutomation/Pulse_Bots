# Import Datastage module
Import-Module Datastage

# Variables
$username = "newuser"
$password = "password123"
$role = "Developer"

# Add user to Datastage
Add-DatastageUser -Username $username -Password $password -Role $role

# Output status
Write-Output "User $username added successfully with role $role."
