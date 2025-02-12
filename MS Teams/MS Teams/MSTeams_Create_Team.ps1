# Install the MicrosoftTeams module if not already installed
Install-Module -Name MicrosoftTeams -AllowClobber -Force
# Connect to Microsoft Teams
Connect-MicrosoftTeams
# Define the team details
$teamName = "Your Team Name"
$teamDescription = "Description of your team"
$teamOwner = "owner@domain.com"
# Create the team
$team = New-Team -DisplayName $teamName -Description $teamDescription -Visibility Private
# Add an owner to the team
Add-TeamUser -GroupId $team.GroupId -User $teamOwner -Role Owner
Write-Output "Team '$teamName' created successfully with owner '$teamOwner'."
 