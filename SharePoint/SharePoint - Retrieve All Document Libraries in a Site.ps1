# Connect to the SharePoint site
$SiteUrl = "https://<tenant>.sharepoint.com/sites/<SiteName>"
Connect-PnPOnline -Url $SiteUrl -UseWebLogin

# Retrieve and display all document libraries
$Libraries = Get-PnPList | Where-Object { $_.BaseTemplate -eq 101 }
foreach ($Library in $Libraries) {
    Write-Host "Library: $($Library.Title)"
}