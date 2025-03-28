# Extract URLs from email body text
$UrlPattern = "http[s]?://\S+"
foreach ($Email in $Emails) {
    if ($Email.Body -match $UrlPattern) {
        Write-Output "URL Found: $($Matches[0])"
    }
}