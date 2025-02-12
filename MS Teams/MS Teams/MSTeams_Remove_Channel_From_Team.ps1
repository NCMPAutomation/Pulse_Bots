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
# Remove the channel
Remove-TeamChannel -GroupId $team.GroupId -ChannelId $channel.Id -Confirm:$false
Write-Output "Channel '$channelName' removed successfully from team '$teamName'."
 