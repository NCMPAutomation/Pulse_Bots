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
 
# Display the results
$storageInfo | Format-Table -AutoSize