# Define the output file
$outputFile = "C:\ServerDiskSpaceReport.csv"
 
# Initialize the report
$report = @()
 
# Get disk space information for each drive
$drives = Get-PSDrive -PSProvider FileSystem
foreach ($drive in $drives) {
    $report += [PSCustomObject]@{
        Drive       = $drive.Name
        UsedSpaceGB = [math]::round(($drive.Used / 1GB), 2)
        FreeSpaceGB = [math]::round(($drive.Free / 1GB), 2)
        TotalSizeGB = [math]::round(($drive.Used + $drive.Free) / 1GB, 2)
    }
}
 
# Export the report to a CSV file
$report | Export-Csv -Path $outputFile -NoTypeInformation
 
Write-Output "Server disk space report generated at $outputFile"