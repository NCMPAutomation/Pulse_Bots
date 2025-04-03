# Archive the emails older than 30 days
$ArchiveFolder = $Namespace.Folders["Archive"]
foreach ($Email in $Emails) {
    if ((Get-Date) - $Email.ReceivedTime).Days -gt 30) {
        $Email.Move($ArchiveFolder)
    }
}
Write-Output "Old emails archived"
