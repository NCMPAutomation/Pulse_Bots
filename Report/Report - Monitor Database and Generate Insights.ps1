# Query the database and retrieve summary statistics
$Query = "SELECT COUNT(*) AS TotalRows, SUM(Sales) AS TotalSales FROM SalesTable"
$Connection.ConnectionString = "Server=YourServerName;Database=YourDatabaseName;User Id=YourUsername;Password=YourPassword;"
$Command.CommandText = $Query
$Reader = $Command.ExecuteReader()
while ($Reader.Read()) {
    Write-Output "Total Rows: $($Reader['TotalRows']), Total Sales: $($Reader['TotalSales'])"
}