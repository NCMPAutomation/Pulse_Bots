# Parameters
param (
    [string]$vCenterServer,
    [string]$reportPath = "C:\vCenterHealthCheckReport.html"
)

# Connect to vCenter
Connect-VIServer -Server $vCenterServer

# Initialize HTML report
$report = @"
<html>
<head>
    <title>vCenter Health Check Report</title>
    <style>
        body { font-family: Arial, sans-serif; }
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid black; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <h1>vCenter Health Check Report</h1>
"@

# Check Resource Utilization
$report += "<h2>Resource Utilization</h2>"
$report += "<table><tr><th>Host</th><th>CPU Usage (%)</th><th>Memory Usage (%)</th></tr>"
Get-VMHost | ForEach-Object {
    $cpuUsage = $_.CpuUsageMhz / $_.CpuTotalMhz * 100
    $memUsage = $_.MemoryUsageMB / $_.MemoryTotalMB * 100
    $report += "<tr><td>$($_.Name)</td><td>$([math]::Round($cpuUsage, 2))</td><td>$([math]::Round($memUsage, 2))</td></tr>"
}
$report += "</table>"

# Check Datastore Usage
$report += "<h2>Datastore Usage</h2>"
$report += "<table><tr><th>Datastore</th><th>Free Space (GB)</th><th>Total Space (GB)</th></tr>"
Get-Datastore | ForEach-Object {
    $freeSpace = $_.FreeSpaceGB
    $totalSpace = $_.CapacityGB
    $report += "<tr><td>$($_.Name)</td><td>$([math]::Round($freeSpace, 2))</td><td>$([math]::Round($totalSpace, 2))</td></tr>"
}
$report += "</table>"

# Check VM Tools Status
$report += "<h2>VM Tools Status</h2>"
$report += "<table><tr><th>VM</th><th>Tools Status</th></tr>"
Get-VM | ForEach-Object {
    $toolsStatus = $_.ExtensionData.Guest.ToolsStatus
    $report += "<tr><td>$($_.Name)</td><td>$toolsStatus</td></tr>"
}
$report += "</table>"

# Finalize HTML report
$report += "</body></html>"

# Save report to file
$report | Out-File -FilePath $reportPath

# Disconnect from vCenter
Disconnect-VIServer -Server $vCenterServer -Confirm:$false

Write-Host "Health check report generated at $reportPath"