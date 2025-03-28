# Convert data into an HTML file for a web-based report
$Data = Import-Csv "C:\Data\ReportData.csv"
$HtmlReport = $Data | ConvertTo-Html -Property Name, Value -Title "Custom Report"
$HtmlReport | Out-File "C:\Data\CustomReport.html"
Write-Output "HTML report created at 'C:\Data\CustomReport.html'"