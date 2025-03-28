# Generate an approval request for deployment
$request = @{
    RequestID   = "Req001"
    Description = "Approval needed for deployment to production"
    RequestTime = (Get-Date)
    Status      = "Pending"
}

# Save the request to a JSON file
$request | ConvertTo-Json | Set-Content -Path "C:\Temp\ApprovalRequest.json"

Write-Host "Approval request generated."