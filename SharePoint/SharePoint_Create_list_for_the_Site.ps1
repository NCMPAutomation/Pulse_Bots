
# Load SharePoint CSOM Assemblies
Add-Type -Path "C:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"
Add-Type -Path "C:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"



# Set up credentials and context
$siteUrl = "https://tenant.sharepoint.com/sharepoint_automation_testing_create_site"
$username = ""
$password = ""
$securePassword = ConvertTo-SecureString $password -AsPlainText -Force
$credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($username, $securePassword)
$context = New-Object Microsoft.SharePoint.Client.ClientContext($siteUrl)
$context.Credentials = $credentials

# Define the list creation properties
$listCreationInfo = New-Object Microsoft.SharePoint.Client.ListCreationInformation
$listCreationInfo.Title = "Test List Title"  # Replace with your list title
$listCreationInfo.TemplateType = [Microsoft.SharePoint.Client.ListTemplateType]::GenericList  # Use appropriate template type

# Create the list
$list = $context.Web.Lists.Add($listCreationInfo)
$context.ExecuteQuery()

Write-Host "List 'New List Title' created successfully."
