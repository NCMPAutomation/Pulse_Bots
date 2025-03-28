# Extract yearly data insights
$Data = Import-Csv "C:\Data\ReportData.csv"
$YearlyInsights = $Data | Where-Object { (Get-Date $_.DateColumn).Year -eq 2023 }
$YearlyInsights | Export-Csv "C:\Data\YearlyInsights.csv" -NoTypeInformation
Write-Output "Yearly insights saved."