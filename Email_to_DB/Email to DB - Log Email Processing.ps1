# Log the processing of each email for auditing
$LogFile = "C:\EmailProcessingLog.txt"
Add-Content $LogFile "Processing email: $($Email.Subject) from $($Email.SenderName)"