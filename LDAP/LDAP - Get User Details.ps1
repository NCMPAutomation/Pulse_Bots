# Import the Active Directory module
Import-Module ActiveDirectory

# Define the user name
$userName = "userToGetDetails"

# Get user details
Get-ADUser -Identity $userName -Properties *
