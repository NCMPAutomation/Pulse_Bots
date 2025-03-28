# Define the log name and event ID
$LogName = "Security"
$EventID = 4625

# Get the latest security event
$Event = Get-EventLog -LogName $LogName -InstanceId $EventID -Newest 1

# Send an email notification
Send-MailMessage -To "admin@example.com" -From "alert@example.com" -Subject "Security Alert" -Body $Event.Message -SmtpServer "smtp.example.com"