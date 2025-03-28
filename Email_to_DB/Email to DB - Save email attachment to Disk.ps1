# Save attachments from emails to a specific folder
$SavePath = "C:\EmailAttachments"
foreach ($Email in $Emails) {
    foreach ($Attachment in $Email.Attachments) {
        $Attachment.SaveAsFile("$SavePath\$($Attachment.FileName)")
    }
}