# Extract daily statistics
$Data = Import-Csv "C:\Data\ReportData.csv"
$DailyStats = $Data | Group-Object -Property DateColumn | ForEach-Object {
    [PSCustomObject]@{
        Date  = $_.Name
        Count = $_.Count
    }
}
$DailyStats | Export-Csv "C:\Data\DailyStats.csv" -NoTypeInformation
Write-Output "Daily stats saved."