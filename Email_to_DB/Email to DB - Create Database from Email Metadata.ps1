# Automate database creation for email metadata
$CreateDBQuery = @"
CREATE TABLE EmailMetadata (
    ID INT PRIMARY KEY IDENTITY,
    Subject NVARCHAR(255),
    Sender NVARCHAR(255),
    ReceivedDate DATETIME
);
"@
$Command.CommandText = $CreateDBQuery
$Command.ExecuteNonQuery()
Write-Output "Database table created"