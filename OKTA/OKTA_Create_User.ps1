# Define the Okta domain and the API token
$oktaDomain = "https://trial-8519316.okta.com"
$apiToken = ""
 
# Define the user details
$userDetails = @{
    profile = @{
        firstName = "Sagar"
        lastName = "Aigal"
        email = "sagargajanan.a123@netcon.in"
        login = "sagargajanan.a123@netcon.in"
    }
    credentials = @{
        password = @{
            value = "Password123!"
        }
    }
}
 
# Convert the user details to JSON
$userDetailsJson = $userDetails | ConvertTo-Json -Depth 10
 
# Create the user
$response = Invoke-RestMethod -Method Post -Uri "$oktaDomain/api/v1/users?activate=true" -Headers @{
    "Authorization" = "SSWS $apiToken"
    "Content-Type" = "application/json"
} -Body $userDetailsJson
 
# Output the response
$response
