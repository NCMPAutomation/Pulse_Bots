# Filter emails received after a specific date
$DateFilter = (Get-Date).AddDays(-7)
foreach ($Email in $Emails) {
    if ($Email.ReceivedTime -gt $DateFilter) {
        Write-Output "Recent Email: $($Email.Subject)"
    }
}