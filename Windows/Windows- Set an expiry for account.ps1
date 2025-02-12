#Set an expiry date for account
 
# Replace 'username' with the actual username of the local account
$username = "TestUser"
 
# Set the password to expire
Set-LocalUser -Name $username -PasswordNeverExpires $false
 
# Optionally, you can set the maximum password age (in days)
$maxPasswordAge = 30
Set-LocalUser -Name $username -AccountExpires (Get-Date).AddDays($maxPasswordAge)