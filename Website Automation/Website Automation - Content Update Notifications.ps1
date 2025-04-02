$url = "https://example.com/news"
$response = Invoke-WebRequest -Uri $url
$currentContent = $response.Content

# Load the previous content from a file
$previousContent = Get-Content -Path "C:\Path\To\PreviousContent.txt"

# Compare the current content with the previous content
if ($currentContent -ne $previousContent) {
    # Send a notification if the content has changed
    $emailParams = @{
        To       = "your_email@example.com"
        From     = "monitor@example.com"
        Subject  = "Website Content Updated"
        Body     = "The content on $url has been updated."
        SmtpServer = "smtp.example.com"
    }
    Send-MailMessage @emailParams

    # Save the current content for future comparison
    $currentContent | Out-File -FilePath "C:\Path\To\PreviousContent.txt"
}
