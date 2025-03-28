# Import Datastage module
Import-Module Datastage

# Variables
$projectName = "YourProjectName"
$backupPath = "C:\Backups\ProjectBackup.dsx"

# Backup Datastage project
Backup-DatastageProject -Name $projectName -Path $backupPath

# Output status
Write-Output "Datastage project $projectName backed up to $backupPath."
