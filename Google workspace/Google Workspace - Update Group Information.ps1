# Import Google Workspace module
Import-Module GoogleWorkspace

# Authenticate with Google Workspace
Connect-GoogleWorkspace -ClientId "your-client-id" -ClientSecret "your-client-secret"

# Update group information
$GroupEmail = "group@example.com"
$Group = Get-GoogleWorkspaceGroup -GroupEmail $GroupEmail
$Group.Name = "New Group Name"
Set-GoogleWorkspaceGroup -Group $Group
