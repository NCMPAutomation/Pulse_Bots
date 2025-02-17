Import-Module ActiveDirectory

# User details
$username = "username"  # Replace with the username
$newPassword = "NewPassword123!"  # Replace with the new password

# Convert password to secure string
$securePassword = ConvertTo-SecureString -String $newPassword -AsPlainText -Force

# Update user password
Set-ADAccountPassword -Identity $username -NewPassword $securePassword -Reset

# Enable or unlock the account if needed
Enable-ADAccount -Identity $username
Unlock-ADAccount -Identity $username

Write-Host "User credentials updated successfully."
