# Import Datastage module
Import-Module Datastage

# Variables
$projectName = "YourProjectName"

# Start Datastage project
Start-DatastageProject -Name $projectName

# Output status
Write-Output "Datastage project $projectName started successfully."
