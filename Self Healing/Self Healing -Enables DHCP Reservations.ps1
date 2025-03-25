# Parameters
param (
    [string]$infobloxServer,
    [string]$network,
    [string]$macAddress,
    [string]$hostname,
    [string]$ipAddress
)

# Connect to Infoblox
$credential = Get-Credential
New-IBSession -Server $infobloxServer -Credential $credential

# Create DHCP Reservation
$reservationDetails = @{
    ipv4addr = $ipAddress
    mac = $macAddress
    name = $hostname
    network = $network
}

# Add DHCP Reservation
$result = New-IBFixedAddress -Network $network -MacAddress $macAddress -Name $hostname -IPAddress $ipAddress

if ($result) {
    Write-Host "DHCP reservation for $hostname with IP $ipAddress created successfully."
} else {
    Write-Host "Failed to create DHCP reservation for $hostname."
}

# Disconnect from Infoblox
Remove-IBSession