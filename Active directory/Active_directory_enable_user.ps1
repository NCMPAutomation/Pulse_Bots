# Import the Active Directory module
Import-Module ActiveDirectory

# Path to the CSV file containing user details
$csvPath = "C:\Path\To\Users.csv"

# Import the user details from the CSV file
$users = Import-Csv -Path $csvPath

# Iterate over each user in the list
foreach ($user in $users) {
    # Enable the user account
    Enable-ADAccount -Identity $user.UserName
    Write-Host "User $($user.UserName) has been enabled in Active Directory"
}

Write-Host "All specified users have been enabled in Active Directory."
