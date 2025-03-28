# Import the Active Directory module
Import-Module ActiveDirectory

# Define the OU
$ou = "OU=Groups,DC=example,DC=com"

# Get all groups in the OU
Get-ADGroup -Filter * -SearchBase $ou
