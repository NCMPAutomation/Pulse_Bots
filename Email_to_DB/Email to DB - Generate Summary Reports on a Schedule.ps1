# Generate and email a summary report daily
$Report = "C:\DailyEmailSummary.txt"
foreach ($Email in $Emails) {
    Add-Content $Report "Subject: $($Email.Subject) | Sender: $($Email.SenderName)"
}
$ReportEmail = $Outlook.CreateItem(0)
$ReportEmail.To = "manager@example.com"
$ReportEmail.Subject = "Daily Email Report"
$ReportEmail.Body = "Please find the attached summary."
$ReportEmail.Attachments.Add($Report)
$ReportEmail.Send()
Write-Output "Daily Summary Report Sent"