# Generate a report of groups in the site
$SiteUrl = "https://<tenant>.sharepoint.com/sites/<SiteName>"
Connect-PnPOnline -Url $SiteUrl -UseWebLogin

# Retrieve groups
$Groups = Get-PnPGroup
$Groups | ForEach-Object {
    Write-Host "Group: $($_.Title)"
}