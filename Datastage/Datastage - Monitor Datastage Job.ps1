# Import Datastage module
Import-Module Datastage

# Variables
$projectName = "YourProjectName"
$jobName = "YourJobName"

# Monitor Datastage job
$jobStatus = Get-DatastageJobStatus -ProjectName $projectName -JobName $jobName
Write-Output "Datastage job $jobName status: $jobStatus"
