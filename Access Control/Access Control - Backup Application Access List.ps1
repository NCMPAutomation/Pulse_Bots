# Define application access file path
$AppAccessFile = "C:\CustomApp\AccessList.txt"
$BackupPath = "C:\CustomApp\Backup\AccessListBackup_$(Get-Date -Format yyyyMMdd).txt"

# Create a backup of the access file
Copy-Item -Path $AppAccessFile -Destination $BackupPath
Write-Output "Backup created at $BackupPath"