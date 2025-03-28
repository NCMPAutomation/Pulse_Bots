# Import the Microsoft Teams module
Import-Module MicrosoftTeams

# Connect to Microsoft Teams
Connect-MicrosoftTeams

# Variables
$teamId = "your-team-id"

# Remove the team
Remove-Team -GroupId $teamId

# Disconnect from Microsoft Teams
Disconnect-MicrosoftTeams
