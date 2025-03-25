# Parameters
param (
    [string]$infobloxServer,
    [string]$zone,
    [string]$hostname,
    [string]$ipAddress
)

# Connect to Infoblox
$credential = Get-Credential
New-IBSession -Server $infobloxServer -Credential $credential

# Create A Record
$aRecord = @{
    name = $hostname
    ipv4addr = $ipAddress
    view = "default"
    zone = $zone
}

# Add A Record
$result = Add-IBResourceRecordA -Name $hostname -IPv4Address $ipAddress -Zone $zone

if ($result) {
    Write-Host "A record for $hostname with IP $ipAddress created successfully in zone $zone."
} else {
    Write-Host "Failed to create A record for $hostname."
}

# Disconnect from Infoblox
Remove-IBSession