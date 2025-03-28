# Define API endpoint
$ApiUrl = "https://api.example.com/users"
$AccessToken = "your-access-token"

# Retrieve users and deactivate inactive ones
$Headers = @{ Authorization = "Bearer $AccessToken" }
$Users = Invoke-RestMethod -Uri $ApiUrl -Method Get -Headers $Headers

foreach ($User in $Users) {
    if ($User.last_active -lt (Get-Date).AddDays(-90)) {
        Invoke-RestMethod -Uri "$ApiUrl/$($User.id)" -Method Delete -Headers $Headers
        Write-Output "Deactivated user: $($User.username)"
    }
}