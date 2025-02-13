# Set variables
$MySQLDir = "C:\Program Files\MySQL\MySQL Server 8.0\bin"
$BackupDir = "C:\MySQLBackup"
$DbUser = "your_username"
$DbPassword = "your_password"
$DbName = "your_database"
$Timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$BackupFile = "$BackupDir\$DbName_$Timestamp.sql"

# Create backup directory if it doesn't exist
if (-Not (Test-Path $BackupDir)) {
    New-Item -ItemType Directory -Path $BackupDir
}

# Backup the MySQL database
$DumpCommand = "& `"$MySQLDir\mysqldump.exe`" -u $DbUser -p$DbPassword $DbName > `"$BackupFile`""
Invoke-Expression $DumpCommand

Write-Output "Database backup completed successfully. Backup file: $BackupFile"