# Import the Microsoft Teams module
Import-Module MicrosoftTeams

# Connect to Microsoft Teams
Connect-MicrosoftTeams

# Variables
$teamId = "your-team-id"
$channelName = "New Channel"
$channelDescription = "Description of the new channel"

# Create a new channel
New-TeamChannel -GroupId $teamId -DisplayName $channelName -Description $channelDescription

# Disconnect from Microsoft Teams
Disconnect-MicrosoftTeams
