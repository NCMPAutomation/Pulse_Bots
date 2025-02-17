# Import the Active Directory module
Import-Module ActiveDirectory

# Define the username
$username = "username"

# Unlock the user account
Unlock-ADAccount -Identity $username

Write-Host "The user account $username has been unlocked"
