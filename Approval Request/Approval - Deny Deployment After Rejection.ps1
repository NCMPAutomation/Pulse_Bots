# Deny deployment if the request is rejected
$approvalStatus = Import-Json -Path "C:\Temp\ApprovalStatus.json"

if ($approvalStatus.Status -eq "Rejected") {
    Write-Host "Deployment denied due to rejection."
    Exit
}

Write-Host "Deployment allowed."