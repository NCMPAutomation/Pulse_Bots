# Connect to SharePoint Admin Center
Connect-SPOService -Url https://<tenant>-admin.sharepoint.com

# Export all site collection URLs to a CSV file
$SiteCollections = Get-SPOSite
$SiteCollections | Select-Object Url | Export-Csv -Path "C:\SiteCollections.csv" -NoTypeInformation