# Archive approved requests for long-term storage
$requests = Import-Json -Path "C:\Temp\ApprovalLog.json"

$approvedRequests = $requests | Where-Object { $_.Status -eq "Approved" }
$approvedRequests | ConvertTo-Json | Set-Content -Path "C:\Temp\ArchivedRequests.json"

Write-Host "Approved requests archived."