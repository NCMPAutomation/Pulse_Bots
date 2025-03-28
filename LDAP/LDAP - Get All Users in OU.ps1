# Import the Active Directory module
Import-Module ActiveDirectory

# Define the OU
$ou = "OU=Users,DC=example,DC=com"

# Get all users in the OU
Get-ADUser -Filter * -SearchBase $ou
