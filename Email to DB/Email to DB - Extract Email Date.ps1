# Retrieve the date received for each email
foreach ($Email in $Emails) {
    Write-Output "Received Date: $($Email.ReceivedTime)"
}