# Import the Active Directory module
Import-Module ActiveDirectory

# Define user details
$UserName = "jdoe"
$Password = "P@ssw0rd"
$OU = "OU=Users,DC=example,DC=com"

# Create the user account with security settings
New-ADUser -Name $UserName -AccountPassword (ConvertTo-SecureString $Password -AsPlainText -Force) -Path $OU -Enabled $true -UserPrincipalName "$UserName@example.com" -PasswordNeverExpires $false -CannotChangePassword $true