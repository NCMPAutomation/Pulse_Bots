# Import the Microsoft Teams module
Import-Module MicrosoftTeams

# Connect to Microsoft Teams
Connect-MicrosoftTeams

# Variables
$teamName = "New Team"
$teamDescription = "Description of the new team"

# Create a new team
New-Team -DisplayName $teamName -Description $teamDescription

# Disconnect from Microsoft Teams
Disconnect-MicrosoftTeams
