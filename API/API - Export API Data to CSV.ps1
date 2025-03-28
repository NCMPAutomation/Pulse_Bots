# Define API endpoint and access token
$ApiUrl = "https://api.example.com/data"
$AccessToken = "your-access-token"

# Retrieve and export data
$Headers = @{ Authorization = "Bearer $AccessToken" }
$ApiData = Invoke-RestMethod -Uri $ApiUrl -Method Get -Headers $Headers
$ApiData | Export-Csv -Path "ApiData.csv" -NoTypeInformation
Write-Output "Data exported to ApiData.csv"