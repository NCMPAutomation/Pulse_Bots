# Import Datastage module
Import-Module Datastage

# Variables
$projectName = "YourProjectName"
$jobName = "YourJobName"

# Clear job logs
Clear-DatastageJobLogs -ProjectName $projectName -JobName $jobName

# Output status
Write-Output "Logs for Datastage job $jobName in project $projectName cleared successfully."
