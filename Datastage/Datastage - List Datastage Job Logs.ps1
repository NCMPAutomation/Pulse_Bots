# Import Datastage module
Import-Module Datastage

# Variables
$projectName = "YourProjectName"
$jobName = "YourJobName"

# List job logs
$logs = Get-DatastageJobLogs -ProjectName $projectName -JobName $jobName
$logs | ForEach-Object {
    Write-Output "Log: $($_.Message)"
}
