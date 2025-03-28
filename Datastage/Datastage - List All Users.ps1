# Import Datastage module
Import-Module Datastage

# List all users
$users = Get-DatastageUsers
$users | ForEach-Object {
    Write-Output "User: $($_.Username)"
}
