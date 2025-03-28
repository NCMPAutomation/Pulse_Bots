# Import the Active Directory module
Import-Module ActiveDirectory

# Define the user name
$userName = "userToEnable"

# Enable the user account
Enable-ADAccount -Identity $userName
