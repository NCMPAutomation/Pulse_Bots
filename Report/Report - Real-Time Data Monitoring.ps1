# Monitor data changes in real-time
while ($true) {
    $Data = Import-Csv "C:\Data\RealTimeData.csv"
    Write-Output "Data updated. Total rows: $($Data.Count)"
    Start-Sleep -Seconds 10
}