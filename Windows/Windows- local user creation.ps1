# Prompt for the password securely
$password = Read-Host -AsSecureString "Enter the password for the new user"
# Define the parameters for the new user
$params = @{
    Name        = "NewUser"
    Password    = $password
    FullName    = "New User Full Name"
    Description = "Description of this account"
}
# Create the new local user
New-LocalUser @params
# Optionally, add the new user to a local group (e.g., Administrators)
Add-LocalGroupMember -Group "Administrators" -Member "NewUser"