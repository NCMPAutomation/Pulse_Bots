# Import the Active Directory module
Import-Module ActiveDirectory

# Define the user identity and new password
$username = "username"
$newPassword = ConvertTo-SecureString -AsPlainText "newpassword" -Force

# Update the user's password and ensure they need to reset it at next login
Set-ADAccountPassword -Identity $username -NewPassword $newPassword -Reset

# Optional: Force the user to change their password at next login
Set-ADUser -Identity $username -ChangePasswordAtLogon $true

# Confirm the update
Write-Output "User credentials for $username have been updated."
