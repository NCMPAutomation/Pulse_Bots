# Measure processing time for each email
$StartTime = Get-Date
foreach ($Email in $Emails) {
    Write-Output "Processing email: $($Email.Subject)"
}
$EndTime = Get-Date
Write-Output "Total Processing Time: $(($EndTime - $StartTime).TotalSeconds) seconds"