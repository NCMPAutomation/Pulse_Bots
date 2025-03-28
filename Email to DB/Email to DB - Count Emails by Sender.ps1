# Count the number of emails from each sender
$SenderGroups = $Emails | Group-Object -Property SenderName
foreach ($Group in $SenderGroups) {
    Write-Output "$($Group.Name): $($Group.Count) emails"
}