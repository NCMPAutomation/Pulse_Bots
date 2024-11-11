# Load SharePoint CSOM Assemblies
Add-Type -Path "C:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"
Add-Type -Path "C:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"

 
# SharePoint Online site URL
$siteUrl = ""
$username = ""
$password = ""
$securePassword = ConvertTo-SecureString $password -AsPlainText -Force
$credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($username, $securePassword)
 
# Connect to SharePoint Online site
$context = New-Object Microsoft.SharePoint.Client.ClientContext($siteUrl)
$context.Credentials = $credentials
 
# Upload a file to a document library
$filePath = ""
$targetLibrary = "Shared Documents"
 
# Get the target library
$library = $context.Web.GetFolderByServerRelativeUrl($targetLibrary)
$context.Load($library)
$context.ExecuteQuery()
 
# Upload the file
$fileCreationInfo = New-Object Microsoft.SharePoint.Client.FileCreationInformation
$fileCreationInfo.Content = [System.IO.File]::ReadAllBytes($filePath)
$fileCreationInfo.Url = [System.IO.Path]::GetFileName($filePath)
$fileCreationInfo.Overwrite = $true
 
$uploadedFile = $library.Files.Add($fileCreationInfo)
$context.Load($uploadedFile)
$context.ExecuteQuery()
 
Write-Output "File '$($uploadedFile.ServerRelativeUrl)' uploaded successfully."
 
# Disconnect from SharePoint Online
$context.Dispose()
