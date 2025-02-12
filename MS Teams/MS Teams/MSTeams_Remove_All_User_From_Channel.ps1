# Install the MicrosoftTeams module if not already installed
Install-Module -Name MicrosoftTeams -AllowClobber -Force

# Connect to Microsoft Teams
Connect-MicrosoftTeams

# Define the team and channel details
$teamName = "Your Team Name"
$channelName = "Your Channel Name"

# Get the team ID
$team = Get-Team -DisplayName $teamName

# Get the channel ID
$channel = Get-TeamChannel -GroupId $team.GroupId -DisplayName $channelName

# Get all members of the channel
$channelMembers = Get-TeamChannelUser -GroupId $team.GroupId -ChannelId $channel.Id

# Remove each member from the channel
foreach ($member in $channelMembers) {
    Remove-TeamChannelUser -GroupId $team.GroupId -ChannelId $channel.Id -User $member.UserPrincipalName
}

Write-Output "All members removed successfully from channel '$channelName' in team '$teamName'."