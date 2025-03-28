# Import Datastage module
Import-Module Datastage

# Variables
$projectName = "YourProjectName"

# List all jobs in the project
$jobs = Get-DatastageJobs -ProjectName $projectName
$jobs | ForEach-Object {
    Write-Output "Job: $($_.Name)"
}
