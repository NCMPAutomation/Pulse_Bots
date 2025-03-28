# Delete a document from a library
$SiteUrl = "https://<tenant>.sharepoint.com/sites/<SiteName>"
$LibraryName = "Documents"
$FileName = "DocumentToDelete.docx"

# Connect to the site
Connect-PnPOnline -Url $SiteUrl -UseWebLogin

# Delete the file
Remove-PnPFile -Url "$LibraryName/$FileName" -Force