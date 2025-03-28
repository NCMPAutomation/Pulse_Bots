# Import the Active Directory module
Import-Module ActiveDirectory

# Define user details
$UserName = "jdoe"

# Remove the user account
Remove-ADUser -Identity $UserName -Confirm:$false