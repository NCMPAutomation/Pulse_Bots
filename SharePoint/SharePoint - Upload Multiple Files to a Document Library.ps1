# Upload multiple files to a SharePoint library
$SiteUrl = "https://<tenant>.sharepoint.com/sites/<SiteName>"
$LibraryName = "Documents"
$SourceFolder = "C:\DocumentsToUpload"

# Connect to the site
Connect-PnPOnline -Url $SiteUrl -UseWebLogin

# Upload each file in the source folder
Get-ChildItem $SourceFolder | ForEach-Object {
    Add-PnPFile -Path $_.FullName -Folder $LibraryName
}