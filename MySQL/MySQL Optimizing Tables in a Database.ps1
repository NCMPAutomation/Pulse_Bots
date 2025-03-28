# Define the table name
$TableName = "TableToOptimize"

# Optimize the table
mysql -u root -pYourPassword -D YourDatabase -e "OPTIMIZE TABLE $TableName"
Write-Host "Table $TableName has been optimized"