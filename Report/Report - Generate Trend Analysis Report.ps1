# Create a report showing trends over time
$Data = Import-Csv "C:\Data\ReportData.csv"
$GroupedData = $Data | Group-Object -Property DateColumn
foreach ($Group in $GroupedData) {
    Write-Output "$($Group.Name): $($Group.Count) entries"
}