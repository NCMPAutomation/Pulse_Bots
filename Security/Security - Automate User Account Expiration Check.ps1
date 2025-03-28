# Import the Active Directory module
Import-Module ActiveDirectory

# Get user accounts that are about to expire
Get-ADUser -Filter {AccountExpirationDate -lt (Get-Date).AddDays(7)} -Properties AccountExpirationDate