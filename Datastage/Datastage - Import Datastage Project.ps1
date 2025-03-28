# Import Datastage module
Import-Module Datastage

# Variables
$importPath = "C:\Exports\ProjectExport.dsx"
$projectName = "ImportedProjectName"

# Import Datastage project
Import-DatastageProject -Path $importPath -Name $projectName

# Output status
Write-Output "Datastage project imported from $importPath as $projectName."
