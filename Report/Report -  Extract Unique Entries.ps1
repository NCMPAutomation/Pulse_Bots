# Extract unique rows based on a column
$Data = Import-Csv "C:\Data\ReportData.csv"
$UniqueEntries = $Data | Sort-Object -Property NameColumn -Unique
$UniqueEntries | Export-Csv "C:\Data\UniqueEntries.csv" -NoTypeInformation
Write-Output "Unique entries saved."