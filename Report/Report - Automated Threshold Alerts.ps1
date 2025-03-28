# Generate alerts for data exceeding predefined thresholds
$Data = Import-Csv "C:\Data\ThresholdData.csv"
foreach ($Entry in $Data) {
    if ($Entry.Value -gt 100) {
        Write-Output "Alert: $($Entry.NameColumn) exceeds threshold with $($Entry.Value)"
    }
}