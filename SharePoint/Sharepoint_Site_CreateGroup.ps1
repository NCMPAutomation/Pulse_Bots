

# Load SharePoint CSOM Assemblies

Add-Type -Path "C:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"

Add-Type -Path "C:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"
 


$siteUrl = "https://netcontechnologies.sharepoint.com/sharepoint_automation_testing_create_site"

$username = "USERNAME"

$password = "PASSWORD"

$securePassword = ConvertTo-SecureString $password -AsPlainText -Force

$credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($username, $securePassword)

# Connect to SharePoint Online site

$context = New-Object Microsoft.SharePoint.Client.ClientContext($siteUrl)

$context.Credentials = $credentials

# Create a new group

$groupCreationInfo = New-Object Microsoft.SharePoint.Client.GroupCreationInformation

$groupCreationInfo.Title = "Automation Test Group"

$groupCreationInfo.Description = "This is a test group created to perform auotmation tasks"

$newGroup = $context.Web.SiteGroups.Add($groupCreationInfo)

$context.Load($newGroup)

$context.ExecuteQuery()

Write-Output "Group '$($newGroup.Title)' created successfully."
 
