# Group data by a category column and calculate totals
$Data = Import-Csv "C:\Data\ReportData.csv"
$AggregatedData = $Data | Group-Object -Property CategoryColumn | ForEach-Object {
    [PSCustomObject]@{
        Category = $_.Name
        TotalCount = $_.Count
    }
}
$AggregatedData | Export-Csv "C:\Data\AggregatedReport.csv" -NoTypeInformation
Write-Output "Aggregated report saved."