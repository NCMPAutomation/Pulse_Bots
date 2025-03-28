# Import the Microsoft Teams module
Import-Module MicrosoftTeams

# Connect to Microsoft Teams
Connect-MicrosoftTeams

# Variables
$teamId = "your-team-id"

# List all channels in the team
$channels = Get-TeamChannel -GroupId $teamId
$channels | ForEach-Object {
    Write-Output "Channel: $($_.DisplayName) - ID: $($_.Id)"
}

# Disconnect from Microsoft Teams
Disconnect-MicrosoftTeams
