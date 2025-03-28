# Import the Microsoft Teams module
Import-Module MicrosoftTeams

# Connect to Microsoft Teams
Connect-MicrosoftTeams

# Variables
$teamId = "your-team-id"

# Unarchive the team
Set-TeamArchivedState -GroupId $teamId -Archived $false

# Disconnect from Microsoft Teams
Disconnect-MicrosoftTeams
