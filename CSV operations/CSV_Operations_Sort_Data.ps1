Import-Csv "data.csv" | Sort-Object Age | Export-Csv "sorted.csv" -NoTypeInformation
