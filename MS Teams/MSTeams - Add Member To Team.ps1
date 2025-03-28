# Import the Microsoft Teams module
Import-Module MicrosoftTeams

# Connect to Microsoft Teams
Connect-MicrosoftTeams

# Variables
$teamId = "your-team-id"
$userEmail = "user@example.com"

# Add member to team
Add-TeamUser -GroupId $teamId -User $userEmail -Role Member

# Disconnect from Microsoft Teams
Disconnect-MicrosoftTeams
