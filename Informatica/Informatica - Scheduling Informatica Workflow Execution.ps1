# Schedule a workflow to run every day at a specific time
$TaskAction = New-ScheduledTaskAction -Execute "pmcmd" -Argument "startworkflow -sv Integration_Service -d Domain -wf WorkflowName"
$Trigger = New-ScheduledTaskTrigger -Daily -At "02:00AM"
$TaskSettings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries
Register-ScheduledTask -TaskName "RunWorkflow" -Action $TaskAction -Trigger $Trigger -Settings $TaskSettings