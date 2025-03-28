# Detect data exceeding predefined thresholds
$Data = Import-Csv "C:\Data\ThresholdData.csv"
foreach ($Entry in $Data) {
    if ($Entry.Value -gt 100) {
        Write-Output "Threshold exceeded for $($Entry.Name). Value: $($Entry.Value)"
    }
}