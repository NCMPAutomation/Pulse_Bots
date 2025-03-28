# Re-approval logic for requests that have been modified
$request = Import-Json -Path "C:\Temp\ApprovalRequest.json"

if ($request.LastModified -gt $request.ApprovalTime) {
    $request.Status = "Pending"
    Write-Host "Re-approval required for modified request."
    $request | ConvertTo-Json | Set-Content -Path "C:\Temp\ApprovalRequest.json"
}