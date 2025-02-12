# Define the output file

$outputFile = "C:\StorageHealthCheckReport.csv"
 
# Initialize the report

$report = @()
 
# Get disk information

$disks = Get-PhysicalDisk

foreach ($disk in $disks) {

    $report += [PSCustomObject]@{

        Type       = "Disk"

        Name       = $disk.DeviceID

        Status     = $disk.OperationalStatus

        Health     = $disk.HealthStatus

        SizeGB     = [math]::round($disk.Size / 1GB, 2)

        MediaType  = $disk.MediaType

    }

}
 
# Get volume information

$volumes = Get-Volume

foreach ($volume in $volumes) {

    $report += [PSCustomObject]@{

        Type       = "Volume"

        Name       = $volume.DriveLetter

        Status     = $volume.OperationalStatus

        Health     = $volume.HealthStatus

        SizeGB     = [math]::round($volume.Size / 1GB, 2)

        FileSystem = $volume.FileSystem

    }

}
 
# Get storage pool information

$storagePools = Get-StoragePool

foreach ($pool in $storagePools) {

    $report += [PSCustomObject]@{

        Type       = "Storage Pool"

        Name       = $pool.FriendlyName

        Status     = $pool.OperationalStatus

        Health     = $pool.HealthStatus

        SizeGB     = [math]::round($pool.Size / 1GB, 2)

    }

}
 
# Export the report to a CSV file

$report | Export-Csv -Path $outputFile -NoTypeInformation
 
Write-Output "Storage health check report generated at $outputFile"

 