# Import the Microsoft Teams module
Import-Module MicrosoftTeams

# Connect to Microsoft Teams
Connect-MicrosoftTeams

# Variables
$teamId = "your-team-id"

# List all users in the team
$users = Get-TeamUser -GroupId $teamId
$users | ForEach-Object {
    Write-Output "User: $($_.UserPrincipalName) - Role: $($_.Role)"
}

# Disconnect from Microsoft Teams
Disconnect-MicrosoftTeams
