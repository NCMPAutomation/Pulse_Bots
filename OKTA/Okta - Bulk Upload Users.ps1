# Path to the CSV file containing user details
$csvPath = "C:\Users\bulk_users.csv"

# Define the Okta API URL and token
$apiUrl = "https://your-okta-domain.okta.com/api/v1/users"
$apiToken = "your-okta-api-token"

# Set headers for API call
$headers = @{
    Authorization = "SSWS $apiToken"
}

# Read and process each user in the CSV file
Import-Csv $csvPath | ForEach-Object {
    $body = @{
        profile = @{
            firstName = $_.FirstName
            lastName  = $_.LastName
            email     = $_.Email
            login     = $_.Login
        }
    } | ConvertTo-Json -Depth 10

    # Create the user in Okta
    Invoke-RestMethod -Uri $apiUrl -Headers $headers -Method Post -Body $body
    Write-Host "User created: $($_.Email)"
}