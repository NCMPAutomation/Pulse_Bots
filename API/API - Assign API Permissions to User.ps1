# Define API endpoint, user ID, and permissions
$ApiUrl = "https://api.example.com/users/{userId}/permissions"
$AccessToken = "your-access-token"
$Permissions = @{
    read = $true
    write = $true
    delete = $false
}

# Assign permissions
$Headers = @{ Authorization = "Bearer $AccessToken" }
Invoke-RestMethod -Uri $ApiUrl -Method Post -Headers $Headers -Body ($Permissions | ConvertTo-Json)
Write-Output "Permissions assigned."