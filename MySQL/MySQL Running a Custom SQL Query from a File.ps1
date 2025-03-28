# Define the SQL file path
$SQLFile = "C:\Input\CustomQuery.sql"

# Execute the SQL file
mysql -u root -pYourPassword -D YourDatabase < $SQLFile
Write-Host "Custom SQL query executed from $SQLFile"