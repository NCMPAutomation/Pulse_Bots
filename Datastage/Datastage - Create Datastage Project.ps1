# Import Datastage module
Import-Module Datastage

# Variables
$projectName = "NewProjectName"

# Create a new Datastage project
New-DatastageProject -Name $projectName

# Output status
Write-Output "Datastage project $projectName created successfully."
