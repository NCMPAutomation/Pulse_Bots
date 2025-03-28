# Import the Microsoft Teams module
Import-Module MicrosoftTeams

# Connect to Microsoft Teams
Connect-MicrosoftTeams

# Variables
$teamId = "your-team-id"

# Archive the team
Set-TeamArchivedState -GroupId $teamId -Archived $true

# Disconnect from Microsoft Teams
Disconnect-MicrosoftTeams
