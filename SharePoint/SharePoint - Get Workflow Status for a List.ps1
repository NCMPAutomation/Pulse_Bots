# Fetch workflow status for a SharePoint list
$SiteUrl = "https://<tenant>.sharepoint.com/sites/<SiteName>"
$ListName = "TaskList"

# Connect to the site
Connect-PnPOnline -Url $SiteUrl -UseWebLogin

# Get workflow status
$Workflows = Get-PnPListItem -List $ListName | ForEach-Object {
    $_.WorkflowInstance
}
$Workflows