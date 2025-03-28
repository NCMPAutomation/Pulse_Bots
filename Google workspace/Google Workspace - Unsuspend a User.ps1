# Import Google Workspace module
Import-Module GoogleWorkspace

# Authenticate with Google Workspace
Connect-GoogleWorkspace -ClientId "your-client-id" -ClientSecret "your-client-secret"

# Unsuspend a user
$UserEmail = "user@example.com"
$User = Get-GoogleWorkspaceUser -UserEmail $UserEmail
$User.Suspended = $false
Set-GoogleWorkspaceUser -User $User
