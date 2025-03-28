# Audit user permissions for a site
$SiteUrl = "https://<tenant>.sharepoint.com/sites/<SiteName>"
Connect-PnPOnline -Url $SiteUrl -UseWebLogin

# Get all users and their permissions
Get-PnPUser | ForEach-Object {
    $User = $_
    Write-Host "User: $($User.Email)"
    Get-PnPGroup -AssociatedGroups | ForEach-Object {
        Get-PnPGroupMember -Identity $_
    }
}