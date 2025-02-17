# Import the Active Directory module
Import-Module ActiveDirectory

# Define the username or user principal name (UPN) of the user to be disabled
$user = "username"

# Disable the user account
Disable-ADAccount -Identity $user

Write-Host "User account '$user' has been disabled."
