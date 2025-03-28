# Define query and output file
$Query = "SELECT * FROM TableName"
$OutputFile = "C:\Output\ExportedData.csv"

# Execute query and export data
mysql -u root -pYourPassword -D YourDatabase -e "$Query" | Out-File -FilePath $OutputFile -Encoding UTF8
Write-Host "Data exported to $OutputFile"