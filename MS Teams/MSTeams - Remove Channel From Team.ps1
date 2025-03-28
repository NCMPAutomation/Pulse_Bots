# Import the Microsoft Teams module
Import-Module MicrosoftTeams

# Connect to Microsoft Teams
Connect-MicrosoftTeams

# Variables
$teamId = "your-team-id"
$channelId = "your-channel-id"

# Remove the channel from the team
Remove-TeamChannel -GroupId $teamId -ChannelId $channelId

# Disconnect from Microsoft Teams
Disconnect-MicrosoftTeams
