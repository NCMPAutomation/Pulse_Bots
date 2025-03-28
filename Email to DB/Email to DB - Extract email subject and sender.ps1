# Connect to the email server and retrieve the subject and sender
Add-Type -AssemblyName "Microsoft.Office.Interop.Outlook"
$Outlook = New-Object -ComObject Outlook.Application
$Namespace = $Outlook.GetNamespace("MAPI")
$Folder = $Namespace.GetDefaultFolder(6) # Inbox folder
$Emails = $Folder.Items

foreach ($Email in $Emails) {
    # Extract subject and sender information
    Write-Output "Subject: $($Email.Subject)"
    Write-Output "Sender: $($Email.SenderName)"
}