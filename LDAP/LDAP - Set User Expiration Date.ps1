# Import the Active Directory module
Import-Module ActiveDirectory

# Define the user name and expiration date
$userName = "userToExpire"
$expirationDate = (Get-Date).AddDays(30)

# Set the user account expiration date
Set-ADUser -Identity $userName -AccountExpirationDate $expirationDate
