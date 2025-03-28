# Generate a report on system health post-patching
$systemHealth = @{
    DiskSpace = (Get-PSDrive C).Used
    CPUUsage = Get-Counter -Counter "\Processor(_Total)\% Processor Time"
    MemoryUsage = Get-Counter -Counter "\Memory\Available MBytes"
}

# Save the report to a file
$systemHealth | Export-Csv -Path "C:\Temp\SystemHealthReport.csv" -NoTypeInformation
Write-Host "System health report generated."