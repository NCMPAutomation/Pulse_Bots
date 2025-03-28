# Filter rows in a CSV file within a specific date range
$StartDate = Get-Date "2023-01-01"
$EndDate = Get-Date "2023-12-31"
$Data = Import-Csv "C:\Data\ReportData.csv"
$FilteredData = $Data | Where-Object { (Get-Date $_.DateColumn) -ge $StartDate -and (Get-Date $_.DateColumn) -le $EndDate }
$FilteredData | Export-Csv "C:\Data\FilteredReport.csv" -NoTypeInformation
Write-Output "Filtered report saved."