# Delete emails from a specific sender
$TargetSender = "spam@example.com"
foreach ($Email in $Emails) {
    if ($Email.SenderEmailAddress -eq $TargetSender) {
        $Email.Delete()
        Write-Output "Deleted email: $($Email.Subject)"
    }
}