# Import Datastage module
Import-Module Datastage

# Variables
$projectName = "YourProjectName"

# Delete Datastage project
Remove-DatastageProject -Name $projectName

# Output status
Write-Output "Datastage project $projectName deleted successfully."
