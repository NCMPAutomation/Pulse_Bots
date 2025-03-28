# Define backup directory
$BackupDir = "C:\Backup\DocumentumConfig"

# Backup configuration files
Copy-Item -Path "C:\Documentum\Config\*" -Destination $BackupDir -Recurse -Verbose
Write-Host "Documentum configuration files backed up to $BackupDir"