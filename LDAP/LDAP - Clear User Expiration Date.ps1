# Import the Active Directory module
Import-Module ActiveDirectory

# Define the user name
$userName = "userToClearExpiration"

# Clear the user account expiration date
Set-ADUser -Identity $userName -AccountExpirationDate $null
