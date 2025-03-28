# Sort data by two columns: Date and Value
$Data = Import-Csv "C:\Data\ReportData.csv"
$SortedData = $Data | Sort-Object -Property DateColumn, ValueColumn
$SortedData | Export-Csv "C:\Data\SortedReport.csv" -NoTypeInformation
Write-Output "Data sorted and saved."