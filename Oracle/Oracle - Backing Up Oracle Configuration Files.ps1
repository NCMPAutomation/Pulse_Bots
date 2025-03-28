# Define backup directory
$BackupDir = "C:\Backup\OracleConfig"

# Backup configuration files
Copy-Item -Path "C:\Oracle\Config\*" -Destination $BackupDir -Recurse -Verbose
Write-Host "Oracle configuration files backed up to $BackupDir"