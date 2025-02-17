# Import the Active Directory module
Import-Module ActiveDirectory

# Define the username
$username = "username"

# Get the user's object and select the ObjectGUID property
$user = Get-ADUser -Identity $username -Properties ObjectGUID
$uuid = $user.ObjectGUID

# Print the UUID
Write-Host "The UUID of the user $username is $uuid"
