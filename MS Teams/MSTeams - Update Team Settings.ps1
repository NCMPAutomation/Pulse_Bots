# Import the Microsoft Teams module
Import-Module MicrosoftTeams

# Connect to Microsoft Teams
Connect-MicrosoftTeams

# Variables
$teamId = "your-team-id"
$teamSettings = @{
    "AllowCreateUpdateChannels" = $true
    "AllowDeleteChannels" = $false
}

# Update team settings
Set-Team -GroupId $teamId -AllowCreateUpdateChannels $teamSettings["AllowCreateUpdateChannels"] -AllowDeleteChannels $teamSettings["AllowDeleteChannels"]

# Disconnect from Microsoft Teams
Disconnect-MicrosoftTeams
