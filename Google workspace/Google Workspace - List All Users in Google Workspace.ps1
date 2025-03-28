# Import Google Workspace module
Import-Module GoogleWorkspace

# Authenticate with Google Workspace
Connect-GoogleWorkspace -ClientId "your-client-id" -ClientSecret "your-client-secret"

# List all users
Get-GoogleWorkspaceUser | ForEach-Object {
    Write-Output "User: $_.PrimaryEmail"
}
