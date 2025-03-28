$EventDate = "2025-03-27 14:00"
Send-MailMessage -From "[email@example.com]" -To "[recipient@example.com]" -Subject "Reminder" -Body "Your scheduled event starts at $EventDate."