# Define variables
$infobloxServer = "https://infoblox.example.com" # Replace with your Infoblox server URL
$username = "admin"                              # Infoblox username
$password = "password"                           # Infoblox password
$hostName = "host1.example.com"                  # Host name to delete

# Step 1: Authenticate with Infoblox
$authHeader = @{
    Authorization = "Basic " + [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$username:$password"))
}

# Step 2: Search for the Host Record
Write-Output "Searching for host record: $hostName"
$response = Invoke-RestMethod -Uri "$infobloxServer/wapi/v2.10/record:host?name=$hostName" -Method GET -Headers $authHeader
if ($response) {
    $hostRef = $response._ref
    Write-Output "Host record found: $hostRef"
} else {
    Write-Error "Host record not found. Exiting."
    exit
}

# Step 3: Delete the Host Record
Write-Output "Deleting host record: $hostRef"
$deleteResponse = Invoke-RestMethod -Uri "$infobloxServer/wapi/v2.10/$hostRef" -Method DELETE -Headers $authHeader
if ($deleteResponse) {
    Write-Output "Host record deleted successfully: $hostName"
} else {
    Write-Error "Failed to delete host record."
}
