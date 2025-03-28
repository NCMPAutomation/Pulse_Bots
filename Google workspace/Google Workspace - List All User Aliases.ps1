# Import Google Workspace module
Import-Module GoogleWorkspace

# Authenticate with Google Workspace
Connect-GoogleWorkspace -ClientId "your-client-id" -ClientSecret "your-client-secret"

# List all aliases for a user
$UserEmail = "user@example.com"
Get-GoogleWorkspaceUserAlias -UserEmail $UserEmail | ForEach-Object {
    Write-Output "Alias: $_.Alias"
}
