# Import the Microsoft Teams module
Import-Module MicrosoftTeams

# Connect to Microsoft Teams
Connect-MicrosoftTeams

# List all teams
$teams = Get-Team
$teams | ForEach-Object {
    Write-Output "Team: $($_.DisplayName) - ID: $($_.GroupId)"
}

# Disconnect from Microsoft Teams
Disconnect-MicrosoftTeams
