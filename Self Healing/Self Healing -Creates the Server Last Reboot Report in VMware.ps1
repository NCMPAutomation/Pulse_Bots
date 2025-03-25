# Parameters
param (
    [string]$vCenterServer,
    [string]$reportPath = "C:\ServerLastRebootReport.csv"
)

# Connect to vCenter
Connect-VIServer -Server $vCenterServer

# Initialize CSV report
$report = @()
$header = "Name,Type,LastRebootTime"
$report += $header

# Get last reboot time for VMs
Get-VM | ForEach-Object {
    $vm = $_
    $lastBootTime = (Get-VMGuest -VM $vm).LastBootTime
    $report += "$($vm.Name),VM,$lastBootTime"
}

# Get last reboot time for Hosts
Get-VMHost | ForEach-Object {
    $host = $_
    $lastBootTime = $host.ExtensionData.Summary.Runtime.BootTime
    $report += "$($host.Name),Host,$lastBootTime"
}

# Save report to CSV
$report | Out-File -FilePath $reportPath -Encoding UTF8

Write-Host "Server Last Reboot Report generated at $reportPath"

# Disconnect from vCenter
Disconnect-VIServer -Server $vCenterServer -Confirm:$false