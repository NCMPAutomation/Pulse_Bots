# Identify rows where the value exceeds a specified threshold
$Threshold = 100
$Data = Import-Csv "C:\Data\ReportData.csv"
$Outliers = $Data | Where-Object { $_.ValueColumn -gt $Threshold }
Write-Output "Outliers Detected:"
$Outliers