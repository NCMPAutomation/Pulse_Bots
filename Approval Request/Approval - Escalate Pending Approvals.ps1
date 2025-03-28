# Escalate requests pending for more than 24 hours
$requests = Import-Json -Path "C:\Temp\ApprovalRequests.json"

foreach ($request in $requests) {
    if ($request.Status -eq "Pending" -and $request.RequestTime -lt (Get-Date).AddHours(-24)) {
        Write-Host "Escalating Request ID: $($request.RequestID)"
        # Send escalation email
        Send-MailMessage -To "manager@domain.com" -Subject "Escalation: $($request.RequestID)" `
            -Body "Approval request pending for over 24 hours." -SmtpServer "smtp.domain.com"
    }
}