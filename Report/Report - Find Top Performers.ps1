# Extract top 5 entries based on value
$Data = Import-Csv "C:\Data\ReportData.csv"
$TopPerformers = $Data | Sort-Object -Property ValueColumn -Descending | Select-Object -First 5
$TopPerformers | Export-Csv "C:\Data\TopPerformers.csv" -NoTypeInformation
Write-Output "Top performers report saved."