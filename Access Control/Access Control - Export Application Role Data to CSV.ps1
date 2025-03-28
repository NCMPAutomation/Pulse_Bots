# Define role file path
$RoleFile = "C:\CustomApp\Roles.txt"
$ExportPath = "C:\CustomApp\Roles.csv"

# Export role data to CSV
Get-Content $RoleFile | ForEach-Object {
    $Split = $_ -split ':'
    [PSCustomObject]@{
        UserName = $Split[0].Trim()
        Role     = $Split[1].Trim()
    }
} | Export-Csv -Path $ExportPath -NoTypeInformation
Write-Output "Roles exported to $ExportPath"