# Import Google Workspace module
Import-Module GoogleWorkspace

# Authenticate with Google Workspace
Connect-GoogleWorkspace -ClientId "your-client-id" -ClientSecret "your-client-secret"

# List all groups
Get-GoogleWorkspaceGroup | ForEach-Object {
    Write-Output "Group: $_.Email"
}
