# Import Google Workspace module
Import-Module GoogleWorkspace

# Authenticate with Google Workspace
Connect-GoogleWorkspace -ClientId "your-client-id" -ClientSecret "your-client-secret"

# List all members of a group
$GroupEmail = "group@example.com"
Get-GoogleWorkspaceGroupMember -GroupEmail $GroupEmail | ForEach-Object {
    Write-Output "Member: $_.Email"
}
