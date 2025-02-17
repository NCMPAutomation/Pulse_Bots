# Define server and database details
$serverInstance = "localhost"  # e.g., "localhost\SQLEXPRESS"
$databaseName = "AutomationDB"
$backupDirectory = "C:\MSSQLBackup"  # Ensure this directory exists or change to an existing one
$backupFileName = "$backupDirectory\$databaseName-$(Get-Date -Format 'yyyyMMddHHmmss').bak"

# Load the SQL Server module
Import-Module SqlServer

# Construct SQL query for backup
$sqlQuery = "BACKUP DATABASE [$databaseName] TO DISK = N'$backupFileName' WITH NOFORMAT, NOINIT, NAME = N'$databaseName-Full Database Backup', SKIP, NOREWIND, NOUNLOAD, STATS = 10"

# Execute the query
try {
    Invoke-Sqlcmd -ServerInstance $serverInstance -Query $sqlQuery -TrustServerCertificate
    Write-Host "Backup of database '$databaseName' has been successfully created at '$backupFileName'."
} catch {
    Write-Host "An error occurred: $_"
}
