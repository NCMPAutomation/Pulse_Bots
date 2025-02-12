#windows heartbeat 
$remoteHost = ""
# Get the current list of trusted hosts
$trusted_hosts = (Get-Item WSMan:\localhost\Client\TrustedHosts).Value
if($trusted_hosts -notmatch $remoteHost){
 
 
# Replace 'RemoteServerName' with the name or IP address of the remote server
 
 
# Add the remote host to the trusted hosts list
Set-Item WSMan:\localhost\Client\TrustedHosts -Value $remoteHost -Concatenate
Write-Output "Trusted host added"
}
# Define the remote server and credentials
$remoteServer = $remoteHost
$credential = Get-Credential
# Create a script block to run on the remote server
$scriptBlock = {
# Define variables for system performance metrics
$cpuMetric = Get-Counter '\Processor(_Total)\% Processor Time'
$memMetric = Get-Counter '\Memory\Available MBytes'
$diskMetric = Get-Counter '\LogicalDisk(_Total)\% Free Space'
 
# Store formatted data in a custom PSObject
$healthReport = [pscustomobject]@{
    TimeChecked     = Get-Date
    CPUUsage        = $cpuMetric.CounterSamples.CookedValue
    AvailableMemory = $memMetric.CounterSamples.CookedValue
    FreeDiskSpace   = $diskMetric.CounterSamples.CookedValue
}
 
# Output health report to the console
Write-Host "System Health Report"
Write-Host "===================="
Write-Host "Time Checked: $($healthReport.TimeChecked)"
Write-Host "CPU Usage: $([math]::Round($healthReport.CPUUsage, 2))%"
Write-Host "Available Memory: $([math]::Round($healthReport.AvailableMemory, 2)) MB"
Write-Host "Free Disk Space: $([math]::Round($healthReport.FreeDiskSpace, 2))%"
 
}
# Execute the script block on the remote server
$Report = Invoke-Command -ComputerName $remoteServer -Credential $credential -ScriptBlock $scriptBlock
# Display the results
$Report | Format-Table -AutoSize