# Identify emails that contain attachments
foreach ($Email in $Emails) {
    if ($Email.Attachments.Count -gt 0) {
        Write-Output "Email with Attachment: $($Email.Subject)"
    }
}