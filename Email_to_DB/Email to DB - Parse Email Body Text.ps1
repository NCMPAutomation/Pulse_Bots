# Extract plain text from email body for processing
foreach ($Email in $Emails) {
    $BodyText = $Email.Body
    Write-Output "Body Text: $BodyText"
}