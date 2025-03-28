# Connect to SharePoint Admin Center
Connect-SPOService -Url https://<tenant>-admin.sharepoint.com

# Set the storage quota
# Replace <SiteURL> with the site URL and <StorageQuota> with the value in MB
Set-SPOSite -Identity https://<tenant>.sharepoint.com/sites/<SiteName> -StorageQuota 2048