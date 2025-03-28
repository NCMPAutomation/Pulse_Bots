# Enable versioning in a document library
$SiteUrl = "https://<tenant>.sharepoint.com/sites/<SiteName>"
$LibraryName = "Documents"

# Connect to the SharePoint site
Connect-PnPOnline -Url $SiteUrl -UseWebLogin

# Enable versioning
Set-PnPList -Identity $LibraryName -EnableVersioning $true