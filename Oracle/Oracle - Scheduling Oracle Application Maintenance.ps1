# Define the scheduled maintenance task
$TaskAction = New-ScheduledTaskAction -Execute "cmd.exe" -Argument "/c Start-Service OracleServiceYourInstance"
$TaskTrigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Sunday -At "02:00AM"

# Register the scheduled task
Register-ScheduledTask -TaskName "OracleMaintenanceTask" -Action $TaskAction -Trigger $TaskTrigger
Write-Host "Scheduled task created for Oracle application maintenance"