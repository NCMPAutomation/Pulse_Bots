# Load SharePoint CSOM Assemblies
Add-Type -Path "C:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"
Add-Type -Path "C:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"


# Set up credentials and context
$siteUrl = "https://tenantinfo.sharepoint.com/sharepoint_automation_testing_create_site"
$username = ""
$password = ""
$securePassword = ConvertTo-SecureString $password -AsPlainText -Force
$credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($username, $securePassword)
 
$context = New-Object Microsoft.SharePoint.Client.ClientContext($siteUrl)
$context.Credentials = $credentials
 
# Add a list item
$list = $context.Web.Lists.GetByTitle("Test List Title")
$itemCreationInfo = New-Object Microsoft.SharePoint.Client.ListItemCreationInformation
$listItem = $list.AddItem($itemCreationInfo)
$listItem["Title"] = "Test Title Item"
#$listItem["Category"] = "Test Category Item"
$listItem.Update()
 
$context.ExecuteQuery()
