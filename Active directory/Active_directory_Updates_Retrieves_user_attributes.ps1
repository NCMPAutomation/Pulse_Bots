#FRetrives attributes

# Import the Active Directory module
Import-Module ActiveDirectory

# Define the username
$username = "username"

# Get the user object and select desired properties
$user = Get-ADUser -Identity $username -Properties *
$userAttributes = @{
    Name = $user.Name
    DisplayName = $user.DisplayName
    EmailAddress = $user.EmailAddress
    Title = $user.Title
    Department = $user.Department
    Office = $user.Office
    Phone = $user.TelephoneNumber
    LastLogonDate = $user.LastLogonDate
    DistinguishedName = $user.DistinguishedName
}

# Print the user attributes
$userAttributes | Format-Table -AutoSize

Write-Host "Retrieved attributes for user $username"

#Update attributes

# Import the Active Directory module
Import-Module ActiveDirectory

# Define the username and new attribute values
$username = "username"
$newDisplayName = "New Display Name"
$newEmailAddress = "new.email@example.com"
$newTitle = "New Title"
$newDepartment = "New Department"
$newOffice = "New Office"
$newPhone = "123-456-7890"

# Update the user attributes
Set-ADUser -Identity $username -DisplayName $newDisplayName -EmailAddress $newEmailAddress -Title $newTitle -Department $newDepartment -Office $newOffice -TelephoneNumber $newPhone

Write-Host "Updated attributes for user $username"
