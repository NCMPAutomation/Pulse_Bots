# Import the Active Directory module
Import-Module ActiveDirectory

# Path to the CSV file containing user details
$csvPath = "C:\Path\To\Users.csv"

# Import the user details from the CSV file
$users = Import-Csv -Path $csvPath

# Iterate over each user in the list
foreach ($user in $users) {
    # Define the user properties
    $userProperties = @{
        SamAccountName = $user.UserName
        UserPrincipalName = "$($user.UserName)@domain.com"
        Name = "$($user.FirstName) $($user.LastName)"
        GivenName = $user.FirstName
        Surname = $user.LastName
        AccountPassword = (ConvertTo-SecureString $user.Password -AsPlainText -Force)
        Enabled = $true
        Path = $user.OU
        ChangePasswordAtLogon = $true
    }

    # Create the user account
    New-ADUser @userProperties

    Write-Host "User $($user.UserName) has been added to Active Directory"
}

Write-Host "All specified users have been added to Active Directory."
