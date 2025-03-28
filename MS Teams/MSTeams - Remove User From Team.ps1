# Import the Microsoft Teams module
Import-Module MicrosoftTeams

# Connect to Microsoft Teams
Connect-MicrosoftTeams

# Variables
$teamId = "your-team-id"
$userEmail = "user@example.com"

# Remove the user from the team
Remove-TeamUser -GroupId $teamId -User $userEmail

# Disconnect from Microsoft Teams
Disconnect-MicrosoftTeams
