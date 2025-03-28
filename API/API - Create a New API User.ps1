# Define API endpoint and user details
$ApiUrl = "https://api.example.com/users"
$AccessToken = "your-access-token"
$NewUser = @{
    username = "newuser"
    email = "newuser@example.com"
    role = "user"
}

# Create user
$Headers = @{ Authorization = "Bearer $AccessToken" }
Invoke-RestMethod -Uri $ApiUrl -Method Post -Headers $Headers -Body ($NewUser | ConvertTo-Json)
Write-Output "User created successfully."