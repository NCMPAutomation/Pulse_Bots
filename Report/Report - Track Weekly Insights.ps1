# Extract insights grouped by week
$Data = Import-Csv "C:\Data\ReportData.csv"
$WeeklyData = $Data | Group-Object { (Get-Date $_.DateColumn).Week }
foreach ($Group in $WeeklyData) {
    Write-Output "Week $($Group.Name): $($Group.Count) entries"
}