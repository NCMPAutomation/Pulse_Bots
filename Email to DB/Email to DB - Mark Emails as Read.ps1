# Mark all emails in the Inbox as read
foreach ($Email in $Emails) {
    $Email.UnRead = $false
    Write-Output "Email marked as read: $($Email.Subject)"
}