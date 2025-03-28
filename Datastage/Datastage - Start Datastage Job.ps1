# Import Datastage module
Import-Module Datastage

# Variables
$projectName = "YourProjectName"
$jobName = "YourJobName"

# Start Datastage job
Start-DatastageJob -ProjectName $projectName -JobName $jobName

# Output status
Write-Output "Datastage job $jobName in project $projectName started successfully."
