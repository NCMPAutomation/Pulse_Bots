# Load SharePoint CSOM Assemblies
Add-Type -Path "C:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"
Add-Type -Path "C:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"

 
# Set up credentials and connect to SharePoint
$username = ""
$password = ""
$securePassword = ConvertTo-SecureString $password -AsPlainText -Force
$credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($username, $securePassword)
 
$siteUrl = ""
$context = New-Object Microsoft.SharePoint.Client.ClientContext($siteUrl)
$context.Credentials = $credentials
 
# Add a user to a SharePoint group
$groupName = ""
$userEmail = ""
 
$web = $context.Web
$group = $web.SiteGroups.GetByName($groupName)
$user = $web.EnsureUser($userEmail)
$context.Load($group)
$context.Load($user)
$context.ExecuteQuery()
 
$group.Users.AddUser($user)
$context.ExecuteQuery()
