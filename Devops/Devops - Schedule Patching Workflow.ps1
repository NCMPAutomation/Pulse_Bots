# Schedule a patching task using Task Scheduler
$taskName = "Automated Patching"
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File 'C:\Scripts\PatchWorkflow.ps1'"
$trigger = New-ScheduledTaskTrigger -At 3AM -Daily
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $taskName -Description "Run patching workflow script"

Write-Host "Scheduled task '$taskName' created successfully."