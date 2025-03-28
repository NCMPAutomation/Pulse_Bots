# Notify stakeholders when an approval decision is made
$decision = @{
    RequestID = "Req001"
    Status    = "Approved"
    Time      = (Get-Date)
}

Send-MailMessage -To "devops@domain.com" -Subject "Approval Decision: $($decision.Status)" `
    -Body "Request ID: $($decision.RequestID), Decision: $($decision.Status)" `
    -SmtpServer "smtp.domain.com"

Write-Host "Notification sent."