# Import the Active Directory module
Import-Module ActiveDirectory

# Define the user name
$userName = "userToDisable"

# Disable the user account
Disable-ADAccount -Identity $userName
