# Create a scheduled task for processing emails daily
$Action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File C:\Scripts\EmailProcessing.ps1"
$Trigger = New-ScheduledTaskTrigger -Daily -At 3AM
$Principal = New-ScheduledTaskPrincipal -UserId "Administrator" -LogonType Interactive
Register-ScheduledTask -Action $Action -Trigger $Trigger -Principal $Principal -TaskName "DailyEmailProcessing"
Write-Output "Scheduled Task Created"