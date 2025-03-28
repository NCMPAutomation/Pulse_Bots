# Categorize emails into specific folders based on subject keywords
$Keyword = "Report"
$TargetFolder = $Namespace.Folders["Reports"]
foreach ($Email in $Emails) {
    if ($Email.Subject -like "*$Keyword*") {
        $Email.Move($TargetFolder)
    }
}