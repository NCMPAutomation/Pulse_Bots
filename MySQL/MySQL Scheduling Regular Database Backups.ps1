# Define the scheduled backup task
$TaskAction = New-ScheduledTaskAction -Execute "cmd.exe" -Argument "/c mysqldump -u root -pYourPassword YourDatabase > C:\Backup\MySQLBackup.sql"
$TaskTrigger = New-ScheduledTaskTrigger -Daily -At "02:00AM"

# Register the scheduled task
Register-ScheduledTask -TaskName "MySQLBackupTask" -Action $TaskAction -Trigger $TaskTrigger
Write-Host "Scheduled task created for daily backups"