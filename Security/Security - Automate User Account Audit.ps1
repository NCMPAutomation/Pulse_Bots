# Import the Active Directory module
Import-Module ActiveDirectory

# Get all user accounts and their last logon time
Get-ADUser -Filter * -Properties LastLogonDate | Select-Object Name, LastLogonDate