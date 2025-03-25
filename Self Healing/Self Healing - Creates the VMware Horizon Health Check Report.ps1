# Parameters
param (
    [string]$horizonServer,
    [string]$reportPath = "C:\HorizonHealthCheckReport.html"
)

# Connect to Horizon
Connect-HVServer -Server $horizonServer

# Initialize HTML report
$report = @"
<html>
<head>
    <title>Horizon Health Check Report</title>
    <style>
        body { font-family: Arial, sans-serif; }
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid black; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <h1>Horizon Health Check Report</h1>
"@

# Check Resource Utilization
$report += "<h2>Resource Utilization</h2>"
$report += "<table><tr><th>Desktop Pool</th><th>CPU Usage (%)</th><th>Memory Usage (%)</th></tr>"
Get-HVPool | ForEach-Object {
    $cpuUsage = $_.CpuUsageMhz / $_.CpuTotalMhz * 100
    $memUsage = $_.MemoryUsageMB / $_.MemoryTotalMB * 100
    $report += "<tr><td>$($_.Name)</td><td>$([math]::Round($cpuUsage, 2))</td><td>$([math]::Round($memUsage, 2))</td></tr>"
}
$report += "</table>"

# Check Session Status
$report += "<h2>Session Status</h2>"
$report += "<table><tr><th>User</th><th>Session State</th><th>Desktop</th></tr>"
Get-HVSession | ForEach-Object {
    $report += "<tr><td>$($_.UserName)</td><td>$($_.SessionState)</td><td>$($_.DesktopName)</td></tr>"
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

# Disconnect from Horizon
Disconnect-HVServer -Server $horizonServer -Confirm:$false

Write-Host "Health check report generated at $reportPath"