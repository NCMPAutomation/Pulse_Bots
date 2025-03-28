# Merge data from multiple CSV files into one report
$Files = Get-ChildItem "C:\Data\" -Filter "*.csv"
$CombinedData = @()
foreach ($File in $Files) {
    $CombinedData += Import-Csv $File.FullName
}
$CombinedData | Export-Csv "C:\Data\CombinedReport.csv" -NoTypeInformation
Write-Output "Data combined into a single report."