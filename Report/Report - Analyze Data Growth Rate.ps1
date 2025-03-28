# Calculate growth rates over time
$Data = Import-Csv "C:\Data\ReportData.csv"
for ($i = 0; $i -lt $Data.Count - 1; $i++) {
    $GrowthRate = ($Data[$i+1].ValueColumn - $Data[$i].ValueColumn) / $Data[$i].ValueColumn * 100
    Write-Output "Growth Rate from $($Data[$i].DateColumn) to $($Data[$i+1].DateColumn): $GrowthRate%"
}