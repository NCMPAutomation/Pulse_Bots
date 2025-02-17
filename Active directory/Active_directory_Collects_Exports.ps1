# Import the Active Directory module
Import-Module ActiveDirectory

# Define the number of days of inactivity
$inactiveDays = 90

# Calculate the date threshold
$dateThreshold = (Get-Date).AddDays(-$inactiveDays)

# Get the list of inactive users
$inactiveUsers = Get-ADUser -Filter {LastLogonDate -lt $dateThreshold} -Properties DisplayName, EmailAddress, Title, Department, Office, LastLogonDate

# Select relevant attributes and export to CSV
$inactiveUsers | Select-Object Name, DisplayName, EmailAddress, Title, Department, Office, LastLogonDate | Export-Csv -Path "C:\Path\To\InactiveUsers.csv" -NoTypeInformation

Write-Host "Details of inactive users have been collected and exported to C:\Path\To\InactiveUsers.csv"
