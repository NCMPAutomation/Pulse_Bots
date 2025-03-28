# Import Datastage module
Import-Module Datastage

# List all Datastage projects
$projects = Get-DatastageProjects
$projects | ForEach-Object {
    Write-Output "Project: $($_.Name)"
}
