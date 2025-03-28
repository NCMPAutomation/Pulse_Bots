# Import the Active Directory module
Import-Module ActiveDirectory

# Define the user name and new OU
$userName = "userToMove"
$newOU = "OU=NewOU,DC=example,DC=com"

# Move the user to the new OU
Move-ADObject -Identity (Get-ADUser -Identity $userName).DistinguishedName -TargetPath $newOU
