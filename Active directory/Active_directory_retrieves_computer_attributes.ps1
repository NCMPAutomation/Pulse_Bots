# Import the Active Directory module
Import-Module ActiveDirectory

# Define the computer name
$computerName = "ComputerName"

# Get the computer object and select desired properties
$computer = Get-ADComputer -Identity $computerName -Properties *
$computerAttributes = @{
    Name = $computer.Name
    OperatingSystem = $computer.OperatingSystem
    OperatingSystemVersion = $computer.OperatingSystemVersion
    DNSHostName = $computer.DNSHostName
    LastLogonDate = $computer.LastLogonDate
    DistinguishedName = $computer.DistinguishedName
    Description = $computer.Description
    Location = $computer.Location
}

# Print the computer attributes
$computerAttributes | Format-Table -AutoSize

Write-Host "Retrieved attributes for computer $computerName"
