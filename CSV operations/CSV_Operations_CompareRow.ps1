# Import the CSV file
$csv1 = Import-Csv -Path $csvPath1
$csv2 = Import-Csv -Path $csvPath2

$differences = Compare-Object -ReferenceObject $csv1 -DifferenceObject $csv2 -Property Name

$differences | ForEach-Object {
    if ($_.SideIndicator -eq "<=") {
        Write-Output "NAME: $_.Name in first file"
    } elseif ($_.SideIndicator -eq "=>") {
        Write-Output "NAME: $_.Name in Second file"
    }
}
