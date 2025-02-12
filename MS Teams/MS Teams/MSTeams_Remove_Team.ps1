#Script to delete a Team
# Connect to Microsoft Teams
Connect-MicrosoftTeams
 
# Define the team and channel details
$teamName = "TestTeamName"
 
# Get the team ID
$team = Get-Team -DisplayName $teamName
 
# Remove the channel
Remove-Team -GroupId $groupId
Write-Host "Removed Team: $teamName"