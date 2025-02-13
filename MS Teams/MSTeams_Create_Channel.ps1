# Install the MicrosoftTeams module if not already installed
Install-Module -Name MicrosoftTeams -AllowClobber -Force
# Connect to Microsoft Teams
Connect-MicrosoftTeams
# Define the team and channel details
$teamName = "Your Team Name"
$channelName = "Your Channel Name"
$channelDescription = "Description of your channel"
# Get the team ID
$team = Get-Team -DisplayName $teamName
# Create the channel
New-TeamChannel -GroupId $team.GroupId -DisplayName $channelName -Description $channelDescription
Write-Output "Channel '$channelName' created successfully in team '$teamName'."
 