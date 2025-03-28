# Send approval request email to approvers
$approvers = @("approver1@domain.com", "approver2@domain.com")
$requestFile = "C:\Temp\ApprovalRequest.json"
$approvalLink = "https://example.com/approve?id=Req001"

foreach ($approver in $approvers) {
    Send-MailMessage -To $approver -From "devops@domain.com" -Subject "Approval Required" `
        -Body "Please review and approve the deployment. Details: $approvalLink" `
        -SmtpServer "smtp.domain.com"
}

Write-Host "Email notifications sent."