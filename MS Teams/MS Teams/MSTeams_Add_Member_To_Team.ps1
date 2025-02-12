# Install the MicrosoftTeams module if not already installed
Install-Module -Name MicrosoftTeams -AllowClobber -Force
# Connect to Microsoft Teams
Connect-MicrosoftTeams
# Define the team and member details
$teamName = "Your Team Name"
$memberEmail = "member@domain.com"
# Get the team ID
$team = Get-Team -DisplayName $teamName
# Add the member to the team
Add-TeamUser -GroupId $team.GroupId -User $memberEmail
Write-Output "Member '$memberEmail' added successfully to team '$teamName'."
 