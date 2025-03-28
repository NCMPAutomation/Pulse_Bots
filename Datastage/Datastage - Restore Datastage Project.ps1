# Import Datastage module
Import-Module Datastage

# Variables
$backupPath = "C:\Backups\ProjectBackup.dsx"
$projectName = "RestoredProjectName"

# Restore Datastage project
Restore-DatastageProject -Path $backupPath -Name $projectName

# Output status
Write-Output "Datastage project restored from $backupPath as $projectName."
