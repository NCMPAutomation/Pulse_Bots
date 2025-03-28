# Notify admins of errors during email processing
try {
    # Simulated email processing
    throw "Sample error"
} catch {
    $AlertEmail = $Outlook.CreateItem(0)
    $AlertEmail.To = "admin@example.com"
    $AlertEmail.Subject = "Email Processing Error"
    $AlertEmail.Body = "An error occurred: $_"
    $AlertEmail.Send()
    Write-Output "Error alert sent to admin"
}