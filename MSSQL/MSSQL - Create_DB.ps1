# Import the SqlServer module
Import-Module SqlServer

# Define the SQL Server instance and database details
$serverInstance = "Localhost"
$databaseName = "NewDatabase"

# Define the SQL query to create the database
$sqlQuery = @"
CREATE DATABASE [Test1]
ON PRIMARY (
    NAME = N'Test1',
    FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Test1.mdf',
    SIZE = 10MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 10%
)
LOG ON (
    NAME = N'Test1_log',
    FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Test1_log.ldf',
    SIZE = 5MB,
    MAXSIZE = 50MB,
    FILEGROWTH = 10%
);

"@

# Execute the SQL query
Invoke-Sqlcmd -ServerInstance $serverInstance -Query $sqlQuery -TrustServerCertificate