# Define an expiry time for approval requests
$approvalExpiry = (Get-Date).AddHours(48)

Write-Host "Approval deadline: $approvalExpiry"