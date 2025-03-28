# Import the Active Directory module
Import-Module ActiveDirectory

# Define user details
$UserName = "jdoe"

# Lock the user account
Set-ADUser -Identity $UserName -LockedOut $true