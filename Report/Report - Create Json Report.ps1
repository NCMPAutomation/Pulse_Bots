# Convert report data into JSON format
$Data = Import-Csv "C:\Data\ReportData.csv"
$JsonData = $Data | ConvertTo-Json
$JsonData | Out-File "C:\Data\ReportData.json"
Write-Output "JSON report saved."