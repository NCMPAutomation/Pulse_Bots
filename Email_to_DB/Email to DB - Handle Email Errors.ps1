# Catch errors during email processing
try {
    foreach ($Email in $Emails) {
        # Simulate processing
        Write-Output "Processing email: $($Email.Subject)"
    }
} catch {
    Write-Error "Error processing email: $_"
}