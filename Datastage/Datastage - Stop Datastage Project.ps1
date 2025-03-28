# Import Datastage module
Import-Module Datastage

# Variables
$projectName = "YourProjectName"

# Stop Datastage project
Stop-DatastageProject -Name $projectName

# Output status
Write-Output "Datastage project $projectName stopped successfully."
