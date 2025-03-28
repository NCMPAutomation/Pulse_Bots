# Export email subjects and senders to a CSV file
$OutputPath = "C:\EmailList.csv"
$EmailData = foreach ($Email in $Emails) {
    [PSCustomObject]@{
        Subject = $Email.Subject
        Sender  = $Email.SenderName
    }
}
$EmailData | Export-Csv -Path $OutputPath -NoTypeInformation
Write-Output "Email list exported to $OutputPath"