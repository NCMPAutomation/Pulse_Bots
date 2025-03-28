# Import the Active Directory module
Import-Module ActiveDirectory

# Define user details
$UserName = "jdoe"

# Disable the user account
Disable-ADAccount -Identity $UserName