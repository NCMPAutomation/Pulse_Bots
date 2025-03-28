# Check CPU usage to identify abnormal post-patching behavior
$cpuUsage = Get-Counter -Counter "\Processor(_Total)\% Processor Time"

Write-Host "CPU Usage Post-Patching: $($cpuUsage.CounterSamples[0].CookedValue)%"