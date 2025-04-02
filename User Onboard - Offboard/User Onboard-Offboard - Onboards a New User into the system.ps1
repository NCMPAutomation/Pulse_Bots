# Define variables
$Username = "newuser"
$Password = ConvertTo-SecureString "P@ssword123" -AsPlainText -Force
$FirstName = "First"
$LastName = "Last"
$Group = "Users"

# Create a new user
New-ADUser -Name "$FirstName $LastName" `
           -GivenName $FirstName `
           -Surname $LastName `
           -SamAccountName $Username `
           -UserPrincipalName "$Username@domain.com" `
           -Path "OU=Users,DC=domain,DC=com" `
           -AccountPassword $Password `
           -Enabled $true

# Set password
Set-ADAccountPassword -Identity $Username -NewPassword (ConvertTo-SecureString "P@ssword123" -AsPlainText -Force)

# Add user to group
Add-ADGroupMember -Identity $Group -Members $Username

# Enable the user account
Enable-ADAccount -Identity $Username

Write-Host "User $Username has been onboarded successfully."
