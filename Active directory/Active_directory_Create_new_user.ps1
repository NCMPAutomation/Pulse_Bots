
# Define the user properties
$userName = "NewUserName"
$firstName = "FirstName"
$lastName = "LastName"
$password = "UserPassword"
$ouPath = "OU=Users,DC=example,DC=com"

# Check if the user exists
$user = Get-ADUser -Filter { SamAccountName -eq $userName }

if ($user) {
    Write-Output "User $userName already exists in Active Directory."
} else {
    # Create the new user
    $userDetails = @{
        SamAccountName        = $userName
        UserPrincipalName     = "$userName@example.com"
        Name                  = "$firstName $lastName"
        GivenName             = $firstName
        Surname               = $lastName
        Path                  = $ouPath
        AccountPassword       = (ConvertTo-SecureString -AsPlainText $password -Force)
        Enabled               = $true
        ChangePasswordAtLogon = $true
    }

    New-ADUser @userDetails
    Write-Output "User $userName has been created in Active Directory."
}


<#In the above script
Replace `"NewUserName"`, `"FirstName"`, `"LastName"`, and `"UserPassword"` with the appropriate values for the new user
Replace `"OU=Users,DC=example,DC=com"` with the correct Organizational Unit (OU) path in your Active Directory#>
