# Import the Active Directory module
Import-Module ActiveDirectory

# Define the user name
$userName = "userToUnlock"

# Unlock the user account
Unlock-ADAccount -Identity $userName
