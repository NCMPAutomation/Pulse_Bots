# Filter emails based on a specific keyword in the subject
$Keyword = "Invoice"
foreach ($Email in $Emails) {
    if ($Email.Subject -like "*$Keyword*") {
        Write-Output "Matched Email Subject: $($Email.Subject)"
    }
}