# Query to list tables
$Query = "SHOW TABLES"

# Execute the query
mysql -u root -pYourPassword -D YourDatabase -e "$Query"