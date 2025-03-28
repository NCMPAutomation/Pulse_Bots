# Track the status of the approval process
$approvalLog = Import-Json -Path "C:\Temp\ApprovalStatus.json"

if ($approvalLog.Status -eq "Approved") {
    Write-Host "Deployment approved."
} elseif ($approvalLog.Status -eq "Rejected") {
    Write-Host "Deployment rejected."
} else {
    Write-Host "Approval status: Pending"
}