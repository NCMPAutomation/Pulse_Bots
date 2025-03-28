# Import Datastage module
Import-Module Datastage

# Variables
$projectName = "YourProjectName"
$exportPath = "C:\Exports\ProjectExport.dsx"

# Export Datastage project
Export-DatastageProject -Name $projectName -Path $exportPath

# Output status
Write-Output "Datastage project $projectName exported to $exportPath."
