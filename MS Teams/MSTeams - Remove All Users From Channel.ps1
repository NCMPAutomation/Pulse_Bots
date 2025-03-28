# Import the Microsoft Teams module
Import-Module MicrosoftTeams

# Connect to Microsoft Teams
Connect-MicrosoftTeams

# Variables
$teamId = "your-team-id"
$channelId = "your-channel-id"

# Get all users in the channel
$users = Get-TeamChannelUser -GroupId $teamId -ChannelId $channelId

# Remove each user from the channel
foreach ($user in $users) {
    Remove-TeamChannelUser -GroupId $teamId -ChannelId $channelId -User $user.User
}

# Disconnect from Microsoft Teams
Disconnect-MicrosoftTeams
