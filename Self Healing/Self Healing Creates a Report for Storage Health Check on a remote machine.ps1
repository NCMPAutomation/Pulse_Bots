# Define the remote server and credentials
$remoteServer = "4.240.50.82"
$credential = Get-Credential
 
# Create a script block to run on the remote server
$scriptBlock = {
    # Get storage information for all drives
    $drives = Get-PSDrive -PSProvider FileSystem
 
    # Create a custom object to store the results
    $storageInfo = @()
 
    foreach ($drive in $drives) {
        $driveInfo = [PSCustomObject]@{
            Name       = $drive.Name
            UsedSpace  = [math]::round(($drive.Used / 1GB), 2)
            FreeSpace  = [math]::round(($drive.Free / 1GB), 2)
            TotalSpace = [math]::round(($drive.Used + $drive.Free) / 1GB, 2)
        }
        $storageInfo += $driveInfo
    }
 
    # Return the storage information
    return $storageInfo
}
 
# Execute the script block on the remote server
$storageReport = Invoke-Command -ComputerName $remoteServer -Credential $credential -ScriptBlock $scriptBlock
 
# Display the results
$storageReport | Format-Table -AutoSize
 
# Save the report to a file
$reportPath = "C:\StorageHealthReport.txt"
$storageReport | Out-File -FilePath $reportPath
 
Write-Output "Storage health report saved to $reportPath"