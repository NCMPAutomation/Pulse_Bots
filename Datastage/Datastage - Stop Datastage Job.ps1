# Import Datastage module
Import-Module Datastage

# Variables
$projectName = "YourProjectName"
$jobName = "YourJobName"

# Stop Datastage job
Stop-DatastageJob -ProjectName $projectName -JobName $jobName

# Output status
Write-Output "Datastage job $jobName in project $projectName stopped successfully."
