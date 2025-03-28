# Define database and file paths
$TableName = "TargetTable"
$CSVFile = "C:\Input\ImportData.csv"

# Import CSV data
mysqlimport --ignore-lines=1 --fields-terminated-by=',' --local -u root -pYourPassword YourDatabase $CSVFile
Write-Host "Data imported into $TableName"