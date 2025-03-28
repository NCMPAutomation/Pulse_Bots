# Convert email data into JSON format
$EmailData = foreach ($Email in $Emails) {
    [PSCustomObject]@{
        Subject = $Email.Subject
        Sender  = $Email.SenderName
    }
}
$EmailData | ConvertTo-Json | Out-File "C:\EmailData.json"
Write-Output "Email data saved in JSON format"