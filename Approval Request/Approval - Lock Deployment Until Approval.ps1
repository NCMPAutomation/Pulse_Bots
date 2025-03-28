# Lock deployment script until approval is granted
$approvalStatus = Import-Json -Path "C:\Temp\ApprovalStatus.json"

if ($approvalStatus.Status -ne "Approved") {
    Write-Host "Deployment locked until approval."
    Exit
}

Write-Host "Deployment unlocked."