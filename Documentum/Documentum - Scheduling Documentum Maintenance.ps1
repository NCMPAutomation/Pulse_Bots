# Define the scheduled maintenance task
$TaskAction = New-ScheduledTaskAction -Execute "cmd.exe" -Argument "/c Start-Service DocumentumService"
$TaskTrigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Sunday -At "02:00AM"

# Register the scheduled task
Register-ScheduledTask -TaskName "DocumentumMaintenanceTask" -Action $TaskAction -Trigger $TaskTrigger
Write-Host "Scheduled task created for Documentum application maintenance"