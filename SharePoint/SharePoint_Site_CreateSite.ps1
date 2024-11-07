# Load SharePoint CSOM Assemblies
Add-Type -Path "C:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"
Add-Type -Path "C:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"

# Define variables
$siteUrl = ""
$username = ""
$password = ""
$securePassword = ConvertTo-SecureString $password -AsPlainText -Force
$credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($username, $securePassword)

# Connect to SharePoint Online
$context = New-Object Microsoft.SharePoint.Client.ClientContext($siteUrl)
$context.Credentials = $credentials

# Create the site
$webCreationInfo = New-Object Microsoft.SharePoint.Client.WebCreationInformation
$webCreationInfo.Url = ""
$webCreationInfo.Title = ""
$webCreationInfo.WebTemplate = "STS#3"  # Template for a modern team site
$webCreationInfo.UseSamePermissionsAsParentSite = $true

$newWeb = $context.Web.Webs.Add($webCreationInfo)
$context.ExecuteQuery()

Write-Output "Site created successfully at $siteUrl"
