# Create a weekly report for approval decisions
$reportData = Get-Content -Path "C:\Temp\ApprovalLog.json" | ConvertFrom-Json

# Filter data for the last 7 days
$weeklyData = $reportData | Where-Object { $_.ActionTime -gt (Get-Date).AddDays(-7) }

# Save to CSV
$weeklyData | Export-Csv -Path "C:\Temp\WeeklyApprovalReport.csv" -NoTypeInformation

Write-Host "Weekly approval report generated."