# Define username and password
$Username = "newuser"
$Password = "newpassword"

# Grant privileges and create user
mysql -u root -pYourPassword -e "CREATE USER '$Username'@'localhost' IDENTIFIED BY '$Password'; GRANT ALL PRIVILEGES ON *.* TO '$Username'@'localhost'; FLUSH PRIVILEGES;"
Write-Host "New user $Username created with privileges"