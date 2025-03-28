# Automated review of approval requests based on predefined conditions
$approvalRequest = Import-Json -Path "C:\Temp\ApprovalRequest.json"

if ($approvalRequest.Description -match "Critical" -and $approvalRequest.Status -eq "Pending") {
    Write-Host "Request requires immediate attention."
} else {
    Write-Host "Request does not meet criteria for urgent review."
}