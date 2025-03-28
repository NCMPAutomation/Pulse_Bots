# Import Google Workspace module
Import-Module GoogleWorkspace

# Authenticate with Google Workspace
Connect-GoogleWorkspace -ClientId "your-client-id" -ClientSecret "your-client-secret"

# Remove an alias from a user
$UserEmail = "user@example.com"
$Alias = "alias@example.com"
Remove-GoogleWorkspaceUserAlias -UserEmail $UserEmail -Alias $Alias