# Define variables
$infobloxServer = "https://infoblox.example.com" # Replace with your Infoblox server URL
$username = "admin"                              # Infoblox username
$password = "password"                           # Infoblox password
$hostName = "host1.example.com"                  # Host name
$ipAddress = "192.168.1.10"                      # IP address
$customerOrg = "Customer_Org"                    # Customer organization attribute

# Step 1: Authenticate with Infoblox
$authHeader = @{
    Authorization = "Basic " + [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$username:$password"))
}

# Step 2: Create the Host Record
$hostData = @{
    name = $hostName
    ipv4addrs = @(@{ ipv4addr = $ipAddress })
    extensible_attributes = @{
        Customer_Org = $customerOrg
    }
} | ConvertTo-Json -Depth 10

$response = Invoke-RestMethod -Uri "$infobloxServer/wapi/v2.10/record:host" -Method POST -Headers $authHeader -Body $hostData -ContentType "application/json"

if ($response) {
    Write-Output "Host record created successfully: $hostName with IP $ipAddress"
} else {
    Write-Error "Failed to create host record."
}
