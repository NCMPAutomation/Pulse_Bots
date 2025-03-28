# Move processed emails to a backup folder
$BackupFolder = $Namespace.Folders["ProcessedEmails"]
$Email.Move($BackupFolder)
Write-Output "Email moved to backup folder"