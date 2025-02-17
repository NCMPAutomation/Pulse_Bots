# Define server and database details
$serverInstance = "localhost"  # e.g., "localhost\SQLEXPRESS"
$databaseName = "Test1"

# Load the SQL Server module
Import-Module SqlServer

    # Construct SQL query
    $sqlQuery = "DROP DATABASE [$databaseName]"
    # Execute the query
    try {
        Invoke-Sqlcmd -ServerInstance $serverInstance -Query $sqlQuery -TrustServerCertificate
        Write-Host "Database '$databaseName' has been successfully deleted."
    } catch {
        Write-Host "An error occurred: $_"
    }

