# Import the Active Directory module
Import-Module ActiveDirectory

# Define user details
$UserName = "jdoe"

# Unlock the user account
Unlock-ADAccount -Identity $UserName