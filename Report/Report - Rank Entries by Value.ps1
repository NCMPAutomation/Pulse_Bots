# Assign ranks based on numerical values
$Data = Import-Csv "C:\Data\ReportData.csv"
$RankedData = $Data | Sort-Object -Property ValueColumn -Descending | Select-Object -Property NameColumn, ValueColumn, @{Name="Rank";Expression={[Array]::IndexOf($Data.ValueColumn, $_.ValueColumn) + 1}}
$RankedData | Export-Csv "C:\Data\RankedReport.csv" -NoTypeInformation
Write-Output "Ranked report saved."