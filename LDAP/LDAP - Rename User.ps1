# Import the Active Directory module
Import-Module ActiveDirectory

# Define the user name and new name
$userName = "userToRename"
$newName = "newUserName"

# Rename the user
Rename-ADObject -Identity (Get-ADUser -Identity $userName).DistinguishedName -NewName $newName
