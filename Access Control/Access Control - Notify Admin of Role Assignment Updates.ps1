# Define updated roles file and admin email
$UpdatedRolesFile = "C:\CustomApp\UpdatedRoles.txt"
$AdminEmail = "admin@domain.com"

# Notify admin via email
$Body = Get-Content $UpdatedRolesFile
Send-MailMessage -From "no-reply@customapp.com" -To $AdminEmail -Subject "Role Updates Notification" -Body $Body -SmtpServer "smtp.domain.com"