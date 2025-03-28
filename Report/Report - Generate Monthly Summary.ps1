# Create a report grouped by month
$Data = Import-Csv "C:\Data\ReportData.csv"
$MonthlyData = $Data | Group-Object { (Get-Date $_.DateColumn).Month }
foreach ($Group in $MonthlyData) {
    Write-Output "Month $($Group.Name): $($Group.Count) entries"
}