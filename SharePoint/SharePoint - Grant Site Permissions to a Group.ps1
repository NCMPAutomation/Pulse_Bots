# Grant permissions to a group
$SiteUrl = "https://<tenant>.sharepoint.com/sites/<SiteName>"
$GroupName = "Team Members"
$PermissionLevel = "Contribute"

# Connect to the site
Connect-PnPOnline -Url $SiteUrl -UseWebLogin

# Assign permissions
Set-PnPGroupPermissions -Identity $GroupName -AddRole $PermissionLevel