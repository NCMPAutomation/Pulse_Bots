# Define the Okta domain and API token
$oktaDomain = "https://xyz.okta.com"
$apiToken = ""
 
 
$userId = ""
$newPassword = ""
 
$body = @{
    "credentials" = @{
        "password" = @{
            "value" = $newPassword
        }
    }
} | ConvertTo-Json
 
$headers = @{
    "Authorization" = "SSWS $apiToken"
    "Content-Type"  = "application/json"
}
 
$url = "$oktaDomain/api/v1/users/$userId"
 
Invoke-RestMethod -Method Post -Uri $url -Headers $headers -Body $body