# Define the table name to drop
$TableName = "OldTable"

# Drop the table
mysql -u root -pYourPassword -D YourDatabase -e "DROP TABLE $TableName"
Write-Host "Table $TableName has been dropped"