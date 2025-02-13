# Connect to Microsoft Teams
Connect-MicrosoftTeams
 
# Define the team and member details
$teamName = "TestTeamName"
$memberEmail = ""
 
# Get the team ID
$team = Get-Team -DisplayName $teamName
 
# Add the member to the team
Remove-TeamUser -GroupId $team.GroupId -User $memberEmail
 
Write-Output "Member '$memberEmail' removed successfully from team '$teamName'."