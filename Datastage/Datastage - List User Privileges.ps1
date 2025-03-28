# Import Datastage module
Import-Module Datastage

# Variables
$username = "existinguser"

# List user privileges
$privileges = Get-DatastageUserPrivileges -Username $username
