# Define server and database details
$serverInstance = "localhost"  # e.g., "localhost\SQLEXPRESS"
$databaseName = "AutomationDB"
$backupFilePath = "C:\MSSQLBackup\AutomationDB-20250120131629.bak"  # Path to your backup file

# Load the SQL Server module
Import-Module SqlServer

# Construct SQL query for restoration
$sqlQuery = "RESTORE DATABASE [$databaseName] FROM DISK = N'$backupFilePath' WITH FILE = 1, NOUNLOAD, STATS = 10"

# Execute the query
try {
    Invoke-Sqlcmd -ServerInstance $serverInstance -Query $sqlQuery -TrustServerCertificate
    Write-Host "Database '$databaseName' has been successfully restored from '$backupFilePath'."
} catch {
    Write-Host "An error occurred: $_"
}
