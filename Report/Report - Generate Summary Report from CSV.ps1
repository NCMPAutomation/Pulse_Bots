# Load data from a CSV and create a summary report
$Data = Import-Csv "C:\Data\ReportData.csv"
$TotalRows = $Data.Count
$Columns = $Data[0].PSObject.Properties.Name
Write-Output "Summary Report:"
Write-Output "Total Rows: $TotalRows"
Write-Output "Columns: $($Columns -join ', ')"