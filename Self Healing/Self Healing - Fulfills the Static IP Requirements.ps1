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

# Allocate Static IP
$fixedAddress = @{
    ipv4addr = $ipAddress
    mac = $macAddress
    name = $hostname
    network = $network
}

# Create Fixed Address
$result = New-IBFixedAddress -Network $network -MacAddress $macAddress -Name $hostname -IPAddress $ipAddress

if ($result) {
    Write-Host "Static IP $ipAddress allocated successfully to $hostname with MAC $macAddress."
} else {
    Write-Host "Failed to allocate static IP $ipAddress."
}

# Disconnect from Infoblox
Remove-IBSession