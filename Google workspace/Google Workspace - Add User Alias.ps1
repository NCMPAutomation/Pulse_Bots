# Import Google Workspace module
Import-Module GoogleWorkspace

# Authenticate with Google Workspace
Connect-GoogleWorkspace -ClientId "your-client-id" -ClientSecret "your-client-secret"

# Add an alias to a user
$UserEmail = "user@example.com"
$Alias = "alias@example.com"
Add-GoogleWorkspaceUserAlias -UserEmail $UserEmail -Alias $Alias
