# Calculate moving averages for a numerical column
$Data = Import-Csv "C:\Data\ReportData.csv"
$WindowSize = 5
for ($i = 0; $i -lt $Data.Count - $WindowSize; $i++) {
    $Window = $Data[$i..($i + $WindowSize - 1)]
    $MovingAverage = ($Window | Measure-Object -Property ValueColumn -Average).Average
    Write-Output "Moving Average: $MovingAverage"
}