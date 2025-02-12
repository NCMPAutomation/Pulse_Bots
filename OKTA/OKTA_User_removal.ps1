# Define the Okta domain and API token
$oktaDomain = ""
$apiToken = ""
 
$username = ""
 
$headers = @{
    "Authorization" = "SSWS $apiToken"
    "Content-Type"  = "application/json"
}
 
$url = "$oktaDomain/api/v1/users?q=$username"
 
$response = Invoke-RestMethod -Method Get -Uri $url -Headers $headers
 
$userId = $response[0].id
Write-Output "User ID: $userId"
 
 
$userId = $userId
 
 
$headers = @{
    "Authorization" = "SSWS $apiToken"
    "Content-Type"  = "application/json"
}
 
$deactivateUrl = "$oktaDomain/api/v1/users/$userId/lifecycle/deactivate"
Invoke-RestMethod -Method Post -Uri $deactivateUrl -Headers $headers
 
$deleteUrl = "$oktaDomain/api/v1/users/$userId"
Invoke-RestMethod -Method Delete -Uri $deleteUrl -Headers $headers