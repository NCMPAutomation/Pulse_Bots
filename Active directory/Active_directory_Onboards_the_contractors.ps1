# Import the Active Directory module
Import-Module ActiveDirectory

# Define the list of contractors to be onboarded
$contractors = @(
    @{Name = "Contractor1"; SamAccountName = "c1"; Password = "P@ssw0rd1"; OU = "OU=Contractors,DC=example,DC=com"; Group = "ContractorGroup"},
    @{Name = "Contractor2"; SamAccountName = "c2"; Password = "P@ssw0rd2"; OU = "OU=Contractors,DC=example,DC=com"; Group = "ContractorGroup"},
    @{Name = "Contractor3"; SamAccountName = "c3"; Password = "P@ssw0rd3"; OU = "OU=Contractors,DC=example,DC=com"; Group = "ContractorGroup"}
)

foreach ($contractor in $contractors) {
    # Create the user account
    New-ADUser -Name $contractor.Name `
               -SamAccountName $contractor.SamAccountName `
               -UserPrincipalName "$($contractor.SamAccountName)@example.com" `
               -Path $contractor.OU `
               -AccountPassword (ConvertTo-SecureString $contractor.Password -AsPlainText -Force) `
               -Enabled $true

    # Set additional properties for the user
    Set-ADUser -Identity $contractor.SamAccountName `
               -GivenName $contractor.Name `
               -Surname "Contractor"

    # Add the user to the specified group
    Add-ADGroupMember -Identity $contractor.Group -Members $contractor.SamAccountName

    Write-Host "Contractor '$($contractor.Name)' has been onboarded and added to group '$($contractor.Group)'."
}
