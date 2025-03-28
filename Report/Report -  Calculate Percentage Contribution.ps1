# Calculate the percentage contribution of each category to the total value
$Data = Import-Csv "C:\Data\ReportData.csv"
$TotalValue = ($Data | Measure-Object -Property ValueColumn -Sum).Sum
foreach ($Entry in $Data) {
    $Percentage = ($Entry.ValueColumn / $TotalValue) * 100
    Write-Output "$($Entry.NameColumn): $Percentage%"
}