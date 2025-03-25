# Define API Key and URL
$apiKey = "YOUR_API_KEY_HERE"
$networkId = "YOUR_NETWORK_ID_HERE"
$apiUrl = "https://api.meraki.com/api/v1/networks/$networkId/devices"

# Set headers
$headers = @{
    "X-Cisco-Meraki-API-Key" = $apiKey
    "Content-Type" = "application/json"
}

# Get link status
$response = Invoke-RestMethod -Uri $apiUrl -Headers $headers -Method Get

# Parse the response
foreach ($device in $response) {
    Write-Host "Device Name: $($device.name)"
    Write-Host "Status: $($device.status)"
    Write-Host "Uplink: $($device.uplink)"
    
    # Example: Check for downtime or packet loss
    if ($device.uplink.status -ne "online") {
        Write-Warning "ALERT: Device $($device.name) is offline!"
    }
}