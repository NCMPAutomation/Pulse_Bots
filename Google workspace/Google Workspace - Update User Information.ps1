# Import Google Workspace module
Import-Module GoogleWorkspace

# Authenticate with Google Workspace
Connect-GoogleWorkspace -ClientId "your-client-id" -ClientSecret "your-client-secret"

# Update user information
$UserEmail = "user@example.com"
$User = Get-GoogleWorkspaceUser -UserEmail $UserEmail
$User.Name.FullName = "New Full Name"
Set-GoogleWorkspaceUser -User $User
