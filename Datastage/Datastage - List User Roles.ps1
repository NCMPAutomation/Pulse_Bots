# Import Datastage module
Import-Module Datastage

# List all user roles
$roles = Get-DatastageUserRoles
$roles | ForEach-Object {
    Write-Output "Role: $($_.Name)"
}
