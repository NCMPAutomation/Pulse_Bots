# Validate email addresses of senders
foreach ($Email in $Emails) {
    if ($Email.SenderEmailAddress -match "^[\w\.-]+@[\w\.-]+\.\w+$") {
        Write-Output "Valid Email Address: $($Email.SenderEmailAddress)"
    } else {
        Write-Output "Invalid Email Address: $($Email.SenderEmailAddress)"
    }
}